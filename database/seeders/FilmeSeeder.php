<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FilmeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $nomes = ['ação', 'aventura', 'Ficção científica', 'terror', 'drama', 'comédia','romance'];
        $contador = 0;
        foreach(\range(1,7) as $index){
            DB::table('categoriafilme')->insert(
                ['nome'=>$nomes[$contador]]
            );
            $contador++;
            if ($contador >= count($nomes)) {
                $contador = 0;
        }

    }
}
}