<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Interfaces\BoardingHouseRepositoryInterface;
use App\Interfaces\TransactionRepositoryInterface;
use App\Http\Requests\CustomerInformationStoreRequest;
use App\Http\Requests\BookingShowRequest;
use App\Models\Transaction;

class BookingController extends Controller
{
    private BoardingHouseRepositoryInterface $boardingHouseRepository;
    private TransactionRepositoryInterface $transactionRepository;

    public function __construct(
        BoardingHouseRepositoryInterface $boardingHouseRepository, 
        TransactionRepositoryInterface $transactionRepository
    ) {
        $this->boardingHouseRepository = $boardingHouseRepository;
        $this->transactionRepository = $transactionRepository;
    }

    public function booking(Request $request, $slug)
    {
        $this->transactionRepository->saveTransactionDataToSession($request->all());
        return redirect()->route('booking.information', $slug);
    }

    public function information($slug)
    {
        $boardingHouse = $this->boardingHouseRepository->getBoardingHouseBySlug($slug);
        $transaction = $this->transactionRepository->getTransactionDataFromSession();
        
        if (!$transaction) return redirect()->route('home');

        $room = $this->boardingHouseRepository->getBoardingHouseRoomById($transaction['room_id']);
        return view('pages.booking.information', compact('boardingHouse', 'transaction', 'room'));
    }

    public function saveInformation(CustomerInformationStoreRequest $request, $slug)
    {
        $data = $request->validated();
        $this->transactionRepository->saveTransactionDataToSession($data);
        return redirect()->route('booking.checkout', $slug);
    }

    public function checkout($slug)
    {
        $boardingHouse = $this->boardingHouseRepository->getBoardingHouseBySlug($slug);
        $transaction = $this->transactionRepository->getTransactionDataFromSession();

        if (!$transaction) return redirect()->route('home');

        $room = $this->boardingHouseRepository->getBoardingHouseRoomById($transaction['room_id']);
        return view('pages.booking.checkout', compact('boardingHouse', 'transaction', 'room'));
    }

    // PERBAIKAN: Menambahkan parameter $slug agar tidak 404
    public function payment(Request $request, $slug)
    {
        $this->transactionRepository->saveTransactionDataToSession($request->all());
        $transaction = $this->transactionRepository->saveTransaction($this->transactionRepository->getTransactionDataFromSession());

        // Konfigurasi Midtrans
        \Midtrans\Config::$serverKey = config('midtrans.server_key');
        \Midtrans\Config::$isProduction = config('midtrans.is_production');
        \Midtrans\Config::$isSanitized = config('midtrans.is_sanitized');
        \Midtrans\Config::$is3ds = config('midtrans.is_3ds');

        $params = [
            'transaction_details' => [
                'order_id' => $transaction->code,
                'gross_amount' => $transaction->total_amount,
            ],
            'customer_details' => [
                'first_name' => $transaction->name,
                'email' => $transaction->email,
                'phone' => $transaction->phone_number,
            ],
        ];

        $paymentUrl = \Midtrans\Snap::createTransaction($params)->redirect_url;
        return redirect($paymentUrl);
    }

    public function success(Request $request)
    {
       $transaction = $this->transactionRepository->getTransactionByCode($request->order_id);
       if (!$transaction) return redirect()->route('home');
       return view('pages.booking.success', compact('transaction'));
    }

    public function check()
    {
        return view('pages.booking.check-booking');
    }

    public function show(BookingShowRequest $request)
    {
        $transaction = $this->transactionRepository->getTransactionByCodeEmailPhone(
            $request->code, $request->email, $request->phone_number
        );

        if (!$transaction) {
            return redirect()->back()->with('error', 'Data transaksi tidak ditemukan.');
        }

        return view('pages.booking.detail', compact('transaction'));
    }   
}