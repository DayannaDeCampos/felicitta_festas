<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProdutoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $nomes = ['doces', 'bomboniere', 'bebidas', 'balde de pipoca'];
        $contador = 0;
        foreach(\range(1,4) as $index){
            DB::table('categoriaproduto')->insert(
                ['nome'=>$nomes[$contador]]
            );
            $contador++;
            if ($contador >= count($nomes)) {
                $contador = 0;
        }

    }
}
}