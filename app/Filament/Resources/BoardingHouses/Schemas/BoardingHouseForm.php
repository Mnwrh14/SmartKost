<?php

namespace App\Filament\Resources\BoardingHouses\Schemas;

use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Components\Tabs;
use Filament\Schemas\Components\Tabs\Tab;
use Filament\Schemas\Schema;
use Illuminate\Support\Str;

class BoardingHouseForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Tabs::make('Heading')
                    ->tabs([
                        Tab::make('Informasi Umum')
                            ->schema([
                                FileUpload::make('thumbnail')
                                    ->label('Thumbnail')
                                    ->image()
                                    ->required()
                                    ->directory('boarding-houses')
                                    ->columnSpanFull(),

                                TextInput::make('name')
                                    ->label('Name')
                                    ->required()
                                    ->maxLength(255)
                                    ->live(onBlur: true)
                                    ->afterStateUpdated(function (string $operation, $state, $set) {
                                        if ($operation === 'create') {
                                            $set('slug', Str::slug($state));
                                        }
                                    }),
                                
                                TextInput::make('slug')
                                    ->label('Slug')
                                    ->required()
                                    ->maxLength(255)
                                    ->unique(ignoreRecord: true),
                                
                                Select::make('city_id')
                                    ->label('City')
                                    ->relationship('city', 'name')
                                    ->required()
                                    ->searchable()
                                    ->preload(),
                                
                                Select::make('category_id')
                                    ->label('Category')
                                    ->relationship('category', 'name')
                                    ->required()
                                    ->searchable()
                                    ->preload(),

                                RichEditor::make('description')
                                    ->label('Description')
                                    ->required()
                                    ->columnSpanFull(),
                                
                                TextInput::make('price')
                                    ->label('Price')
                                    ->required()
                                    ->numeric()
                                    ->prefix('IDR')
                                    ->minValue(0),
                                
                                TextInput::make('address')
                                    ->label('Address')
                                    ->required()
                                    ->maxLength(255)
                                    ->columnSpanFull(),                                
                            ]),
                        Tab::make('Bonos Ngekos')
                            ->schema([
                                Repeater::make('bonuses')
                                    ->relationship()
                                    ->schema([
                                        FileUpload::make('image')
                                            ->label('Image')
                                            ->image()
                                            ->required()
                                            ->directory('bonuses'),
                                        
                                        TextInput::make('name')
                                            ->label('Name')
                                            ->required()
                                            ->maxLength(255),
                                        
                                        Textarea::make('description')
                                            ->label('Description')
                                            ->required()
                                            ->rows(3),
                                    ])
                                    ->collapsible()
                                    ->reorderable()
                                    ->itemLabel(fn (array $state): ?string => $state['name'] ?? null)
                                    ->addActionLabel('Add Bonus')
                                    ->defaultItems(1)
                                    ->columnSpanFull(),
                            ]),
                        Tab::make('Kamar')
                            ->schema([
                                Repeater::make('rooms')
                                    ->relationship()
                                    ->schema([
                                        TextInput::make('name')
                                            ->label('Name')
                                            ->required()
                                            ->maxLength(255),
                                        
                                        TextInput::make('room_type')
                                            ->label('Room Type')
                                            ->required(),
                                        
                                        TextInput::make('square_feet')
                                            ->label('Square Feet')
                                            ->required()
                                            ->numeric()
                                            ->minValue(0),
                                        
                                        TextInput::make('capacity')
                                            ->label('Capacity')
                                            ->required()
                                            ->numeric()
                                            ->minValue(0),
                                        
                                        TextInput::make('price_per_month')
                                            ->label('Price Per Month')
                                            ->required()
                                            ->numeric()
                                            ->prefix('IDR')
                                            ->minValue(0),
                                        
                                        Toggle::make('is_available')
                                            ->label('Is Available')
                                            ->default(true),
                                        
                                        Repeater::make('roomImages')
                                            ->relationship()
                                            ->label('Room Images')
                                            ->schema([
                                                FileUpload::make('image')
                                                    ->label('Image')
                                                    ->image()
                                                    ->required()
                                                    ->directory('room-images'),
                                            ])
                                            ->columns(1)
                                            ->defaultItems(1)
                                            ->columnSpanFull(),
                                    ])
                                    ->collapsible()
                                    ->reorderable()
                                    ->itemLabel(fn (array $state): ?string => $state['name'] ?? null)
                                    ->addActionLabel('Add Room')
                                    ->defaultItems(1)
                                    ->columnSpanFull(),
                            ]),
                    ])->columnSpanFull(),
            ]);
    }
}
