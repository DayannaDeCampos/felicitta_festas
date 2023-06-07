<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FuncionarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $nomes = ['atendente', 'gerente', 'cozinheiro', 'cinegrafista', 'vendedor'];
        $contador = 0;
        foreach(\range(1,4) as $index){
            DB::table('categoriafuncionario')->insert(
                ['nome'=>$nomes[$contador]]
            );
            $contador++;
            if ($contador >= count($nomes)) {
                $contador = 0;
        }
    }
}
}