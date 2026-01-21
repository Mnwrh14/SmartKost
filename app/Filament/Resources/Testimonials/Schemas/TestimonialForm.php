<?php

namespace App\Filament\Resources\Testimonials\Schemas;

use Filament\Schemas\Schema;
use Laravel\Pail\File;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\TextArea;

class TestimonialForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                FileUpload::make('photo')
                    ->image()
                    ->required()
                    ->directory('testimonials')
                    ->columnSpanFull(),
                Select::make('boarding_house_id')
                    ->relationship('boardingHouse', 'name')
                    ->required()
                    ->columnSpanFull(),
                TextArea::make('content')
                    ->required()
                    ->columnSpanFull(),
                TextInput::make('name')
                    ->required(),
                TextInput::make('rating')
                    ->numeric()
                    ->minValue(1)
                    ->maxValue(5)
                    ->required(),
            ]);
    }
}
