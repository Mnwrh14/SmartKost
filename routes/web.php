<?php

use App\Http\Controllers\BoardingHouseController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CityController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;

Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('/category/{slug}', [CategoryController::class, 'show'])->name('category.show');

Route::get('/city/{slug}', [CityController::class, 'show'])->name('city.show');

Route::get('/check-booking', [BookingController::class, 'check'])->name('check-booking');
Route::post('/check-booking', [BookingController::class, 'show'])->name('check-booking.show');

Route::get('/find-kos', [BoardingHouseController::class, 'find'])->name('find-kos');
Route::get('/find-result', [BoardingHouseController::class, 'findResults'])->name('find-kos.result');
Route::get('/boarding-house/{slug}', [BoardingHouseController::class, 'show'])->name('boarding-house.show');
Route::get('/boarding-house/{slug}/rooms', [BoardingHouseController::class, 'rooms'])->name('boarding-house.rooms');

Route::post('/boarding-house/booking/{slug}', [BookingController::class, 'booking'])->name('booking');

Route::get('/boarding-house/booking/{slug}/information', [BookingController::class, 'information'])->name('booking.information');
Route::post('/boarding-house/booking/{slug}/information/save', [BookingController::class, 'saveInformation'])->name('booking.information.save');

Route::get('/boarding-house/booking/{slug}/checkout', [BookingController::class, 'checkout'])->name('booking.checkout');
Route::post('/boarding-house/booking/{slug}/payment', [BookingController::class, 'payment'])->name('booking.payment');

Route::get('/boarding-house/booking/success', [BookingController::class, 'success'])->name('booking.success');


Route::get('/storage/private/{path}', function ($path) {
    if (!Storage::exists($path)) {
        abort(404);
    }
    
    return response()->file(storage_path('app/private/' . $path));
})->where('path', '.*')->name('private.storage');