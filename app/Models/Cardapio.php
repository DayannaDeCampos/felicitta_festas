<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cardapio extends Model
{
    use HasFactory;
    protected $table = "cardapio";

    protected $fillable = [
        'nome', 'quantidade', 'valor','categoriacardapio_id', 'imagemcardapio'
    ];

    public function categoriacardapio(){
        return $this->belongsTo(CategoriaCardapio::class,'categoriacardapio_id','id');
    }

}
