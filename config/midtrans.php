<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Midtrans Configuration
    |--------------------------------------------------------------------------
    |
    | This file is for storing the configuration settings for Midtrans payment
    | gateway integration. You can set your Midtrans server key, environment
    | mode (production or sandbox), and other related settings here.
    |
    */

    'server_key' => env('MIDTRANS_SERVER_KEY', 'your-midtrans-server-key'),

    'is_production' => env('MIDTRANS_IS_PRODUCTION', false),

    'is_sanitized' => env('MIDTRANS_IS_SANITIZED', true),

    'is_3ds' => env('MIDTRANS_IS_3DS', true),

];