<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cardapio;
use App\Models\CategoriaCardapio;
use Illuminate\Support\Facades\Storage;

class CardapioController extends Controller
{
    function index()
    {
        $cardapio = Cardapio::All();
        // dd($usuarios);

        return view('CardapioList')->with(['cardapio' => $cardapio]);
    }

    function create()
    {
        $categoriacardapio = Categoriacardapio::orderBy('nome')->get();

        return view('CardapioForm')->with(['categoriacardapio' => $categoriacardapio]);
    }

    function store(Request $request)
    {
        $request->validate(
            [
                'nome' => 'required | max: 120',
                'quantidade' => 'required  | max: 50',
                'valor' => 'required | max: 50',

                'categoriacardapio_id' => ' nullable',
                'imagemcardapio' => ' nullable|image|mimes:jpeg,jpg,png|max:2048',
            ],
            [
                'nome.required' => 'O nome é obrigatório',
                'nome.max' => 'Só é permitido 120 caracteres',
                'quantidade.required' => 'A quantidade é obrigatória',
                'quantidade.max' => 'Só é permitido 50 caracteres',
                'valor.required' => 'O valor é obrigatório',
                'valor.max' => 'Só é permitido 50 caracteres',

            ]
        );
        //dd( $request->nome);


        $dados = [
            'nome' => $request->nome,
            'quantidade' => $request->quantidade,
            'valor' => $request->valor,
            'categoriacardapio_id' => $request->categoriacardapio_id,
        ];

        $imagemcardapio = $request->file('imagemcardapio');
        $nome_arquivo = '';
        //verifica se o campo imagem foi passado uma imagem
        if ($imagemcardapio) {
            $nome_arquivo = date('YmdHis') . '.' . $imagemcardapio->getClientOriginalExtension();

            $diretorio = 'imagem/';
            //salva a imagem em uma pasta
            $imagemcardapio->storeAs($diretorio, $nome_arquivo, 'public');
            //adiciona ao vetor o diretorio do arquivo e o nome
            $dados['imagemcardapio'] = $diretorio . $nome_arquivo;
        }

        //dd( $request->nome);
        //passa o vetor com os dados do formulário como parametro para ser salvo
        Cardapio::create($dados);

        return \redirect('cardapio')->with('success', 'Cadastrado com sucesso!');
    }

    function edit($id)
    {
        //select * from usuario where id = $id;
        $cardapio = Cardapio::findOrFail($id);
        //dd($usuario);
        $categoriacardapio = Categoriacardapio::orderBy('nome')->get();

        return view('CardapioForm')->with([
            'cardapio' => $cardapio,
            'categoriacardapio' => $categoriacardapio,
        ]);
    }

    function show($id)
    {
        //select * from usuario where id = $id;
        $cardapio = Cardapio::findOrFail($id);
        //dd($usuario);
        $categoriacardapio = Categoriacardapio::orderBy('nome')->get();

        return view('CardapioForm')->with([
            'cardapio' => $cardapio,
            'categoriacardapio' => $categoriacardapio,
        ]);
    }

    function update(Request $request)
    {
        //dd( $request->nome);
        $request->validate(
            [
                'nome' => 'required | max: 120',
                'quantidade' => 'required  | max: 50',
                'valor' => 'required | max: 50',

                'categoriacardapio_id' => ' nullable',
                'imagemcardapio' => ' nullable|image|mimes:jpeg,jpg,png|max:2048',
            ],
            [
                'nome.required' => 'O nome é obrigatório',
                'nome.max' => 'Só é permitido 120 caracteres',
                'quantidade.required' => 'A quantidade é obrigatório',
                'quantidade.max' => 'Só é permitido 50 caracteres',
                'valor.required' => 'O valor é obrigatório',
                'valor.max' => 'Só é permitido 50 caracteres',

            ]
        );
        //dd( $request->nome);


        $dados = [
            'nome' => $request->nome,
            'quantidade' => $request->quantidade,
            'valor' => $request->valor,
            'categoriacardapio_id' => $request->categoriacardapio_id,
        ];
        $imagemcardapio = $request->file('imagemcardapio');
        $nome_arquivo = '';
        //verifica se o campo imagem foi passado uma imagem
        if ($imagemcardapio) {
            $nome_arquivo = date('YmdHis') . '.' . $imagemcardapio->getClientOriginalExtension();

            $diretorio = 'imagem/';
            //salva a imagem em uma pasta
            $imagemcardapio->storeAs($diretorio, $nome_arquivo, 'public');
            //adiciona ao vetor o diretorio do arquivo e o nome
            $dados['imagemcardapio'] = $diretorio . $nome_arquivo;
        }

        //dd($dados);

        Cardapio::updateOrCreate(
            ['id' => $request->id],
            $dados
        );

        return \redirect()->action(
            'App\Http\Controllers\CardapioController@index'
        );
    }
    //

    function destroy($id)
    {
        $cardapio = Cardapio::findOrFail($id);
        if($cardapio->imagemcardapio){
            Storage::disk('public')->delete($cardapio->imagemcardapio);
        }
        $cardapio->delete();

        return \redirect()->action(
            'App\Http\Controllers\CardapioController@index'
        );

    }
      function search(Request $request)
        {
            $campo = $request->campo;

            if (!empty($campo)) {
                $cardapio = Cardapio::where($campo, 'like', '%' . $request->valor . '%')->get();
            } else {
                $cardapio = Cardapio::all();
            }

        return view('CardapioList')->with(['cardapio' => $cardapio]);
    }
}
// npm install --save-dev vite laravel-vite-plugin
// npm install --save-dev @vitejs/plugin-vue
// npm run build

