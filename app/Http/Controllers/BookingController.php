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
        TransactionRepositoryInterface $transactionRepository)
    {
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

    // Validasi: Jika session kosong atau tidak ada room_id, balikkan ke halaman detail/awal
    if (!$transaction || !isset($transaction['room_id'])) {
        return redirect()->route('boarding-house.show', $slug)
                         ->with('error', 'Silakan pilih kamar terlebih dahulu.');
    }

    $room = $this->boardingHouseRepository->getBoardingHouseRoomById($transaction['room_id']);

    return view('pages.booking.checkout', compact('boardingHouse', 'transaction', 'room'));
}

   public function payment(Request $request, $slug)
{
    // 1. Ambil data transaksi yang sebelumnya disimpan di session saat isi form checkout
    $transactionData = session()->get('transaction');

    if (!$transactionData) {
        return redirect()->route('booking.index')->with('error', 'Session expired');
    }

    // 2. Gabungkan data session dengan data pilihan pembayaran dari form (down_payment/full_payment)
    $data = array_merge($transactionData, [
        'payment_method' => $request->payment_method,
    ]);

    // 3. Panggil repository
    $transaction = $this->transactionRepository->saveTransaction($data);

    // ... lanjut ke proses Midtrans
}

    public function success(Request $request)
    {
       $transaction = $this->transactionRepository->getTransactionByCode($request->order_id);

       if (!$transaction) {
           return redirect()->route('home');
       }

        return view('pages.booking.success', compact('transaction'));
    }

    public function check()
    {
        return view('pages.booking.check-booking');
    }

    public function show(BookingShowRequest $request)
    {
        $transaction = $this->transactionRepository->getTransactionByCodeEmailPhone(
            $request->code,
            $request->email,
            $request->phone_number
        );

        if (!$transaction) {
            return redirect()->back()->with(['error', 'Data transaksi tidak ditemukan.']);
        }

        return view('pages.booking.detail', compact('transaction'));
    }   
}
