<?php

namespace App\Filament\Resources\Transactions\Schemas;

use Dflydev\DotAccessData\Data;
use Dom\Text;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Schemas\Schema;
use Filament\Forms\Components\TextInput;

class TransactionForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('code')
                    ->required(),
                Select::make('boarding_house_id')
                    ->relationship('boardingHouse', 'name')
                    ->required(),
                Select::make('room_id')
                    ->relationship('room', 'name')
                    ->required(),
                TextInput::make('name')
                    ->required(),
                TextInput::make('email')
                    ->email()
                    ->required(),
                TextInput::make('phone_number')
                    ->required(),   
                Select::make('payment_method')
                    ->options([
                        'full_payment' => 'Full Payment',
                        'down_payment' => 'Down Payment',
                    ])
                    ->required(),
                Select::make('payment_status')
                    ->options([
                        'pending' => 'Pending',
                        'success' => 'Success',
                    ])
                    ->required(),
                DatePicker::make('start_date')
                    ->required(),
                TextInput::make('duration')
                    ->numeric()
                    ->required(),
                TextInput::make('total_amount')
                    ->numeric()
                    ->prefix('IDR ')
                    ->required(),
                DatePicker::make('transaction_date')
                    ->required(),               
            ]);
    }
}
