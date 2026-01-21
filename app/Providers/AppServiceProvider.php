<?php

namespace App\Providers;

use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if (Str::contains(request()->url(), 'ngrok-free.app')) {
            URL::forceScheme('https');
            
            // Set asset URL to use ngrok URL
            $appUrl = request()->root();
            config(['app.url' => $appUrl]);
            config(['app.asset_url' => $appUrl]);
            
            // Force root URL
            URL::forceRootUrl($appUrl);
        }
    }
}
