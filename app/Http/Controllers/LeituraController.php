<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Leitura;
use Illuminate\Support\Facades\Storage; 

class LeituraController extends Controller
{
    function index()
    {
        $leituras = Leitura::All();
        // dd($usuarios);

        return view('LeituraList')->with(['leituras' => $leituras]);
    }

    function create()
    {
        return view('LeituraForm');
    }


    function store(Request $request)
    {
        $request->validate(
            [
                'nomemac' => 'required | max: 120',
                'dataleitura' => 'required | max: 10',
                'valorsensor' => 'required | max: 50',
                'horaleitura' => 'required  | max: 50',

            ],
            [
                'nomemac.required' => 'O nome é obrigatório',
                'nomemac.max' => 'Só é permitido 120 caracteres',
                'dataleitura.required' => 'A data é obrigatória',
                'dataleitura.max' => 'Só é permitido 10 caracteres',
                'horaleitura.required' => 'A hora é obrigatória',
                'horaleitura.max' => 'Só é permitido 50 caracteres',
                'valorsensor.required' => 'O valor do sensor é obrigatória',
                'valorsensor.max' => 'Só é permitido 50 caracteres',
            ]
        );
       
        $dados = [
            'nomemac' => $request->nomemac,
            'dataleitura' => $request->dataleitura,
            'horaleitura' => $request->horaleitura,
            'valorsensor' => $request->valorsensor,
        ];

        //verifica se o campo imagem foi passado uma imagem

        //dd( $request->nome);
        //passa o vetor com os dados do formulário como parametro para ser salvo
        Leitura::create($dados);

        return \redirect('leitura')->with('success', 'Cadastrado com sucesso!');
    }
    function edit($id)
    {
        //select * from usuario where id = $id;
        $leitura = Leitura::findOrFail($id);
        //dd($usuario);
        return view('LeituraForm')->with([
            'leitura' => $leitura,
        ]);
    }

    function show($id)
    {
        //select * from usuario where id = $id;
        $leitura = Leitura::findOrFail($id);
        //dd($usuario);
        return view('LeituraForm')->with([
            'leitura' => $leitura,
        ]);
    }

    function update(Request $request)
    {
        //dd( $request->nome);
        $request->validate(
            [
                'nomemac' => 'required | max: 120',
                'dataleitura' => 'required | max: 10',
                'valorsensor' => 'required | max: 50',
                'horaleitura' => 'required  | max: 50',
            ],
            [
                'nomemac.required' => 'O nome é obrigatório',
                'nomemac.max' => 'Só é permitido 120 caracteres',
                'dataleitura.required' => 'A data é obrigatória',
                'dataleitura.max' => 'Só é permitido 10 caracteres',
                'horaleitura.required' => 'A hora é obrigatória',
                'horaleitura.max' => 'Só é permitido 50 caracteres',
                'valorsensor.required' => 'O valor do sensor é obrigatória',
                'valorsensor.max' => 'Só é permitido 50 caracteres',
            ]
        );

        $dados = [
            'nomemac' => $request->nomemac,
            'dataleitura' => $request->dataleitura,
            'horaleitura' => $request->horaleitura,
            'valorsensor' => $request->valorsensor,
        ];
        //dd($dados);

        Leitura::updateOrCreate(
            ['id' => $request->id],
            $dados
        );

        return \redirect()->action(
            'App\Http\Controllers\LeituraController@index'
        );
    }
    //

        function destroy($id)
    {
        $leitura = Leitura::findOrFail($id);
        $leitura->delete();

        return \redirect()->action(
            'App\Http\Controllers\LeituraController@index'
        );
    }
    function search(Request $request)
    {
        if ($request->campo == 'nomemac') {
            $leituras = Leitura::where(
                'nomemac',
                'like',
                '%' . $request->valor . '%'
            )->get();
        } else {
            $leituras = Leitura::all();
        }

        return view('LeituraList')->with(['leituras' => $leituras]);
    }
}

// npm install --save-dev vite laravel-vite-plugin
// npm install --save-dev @vitejs/plugin-vue
