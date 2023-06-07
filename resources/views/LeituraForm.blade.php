<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
</head>

<body>
    <div class="container">
   @php
        if (!empty($leitura->id)) {
            $route = route('leitura.update', $leitura->id);
        } else {
            $route = route('leitura.store');
        }
    @endphp
        <h1>Formulário de Leitura</h1>

        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action='{{ $route }}' method="POST" enctype="multipart/form-data">
            @csrf
            @if (!empty($leitura->id))
                @method('PUT')
            @endif

            <input type="hidden" name="id"
                value="@if (!empty(old('id'))) {{ old('id') }} @elseif(!empty($leitura->id)) {{ $leitura->id }} @else {{ '' }} @endif" /><br>
            <div class="col-3">
                <label class="form-label">Nome Mac</label><br>
                <input type="text" class="form-control" name="nomemac"
                    value="@if (!empty(old('nomemac'))) {{ old('nomemac') }} @elseif(!empty($leitura->nomemac)) {{ $leitura->nomemac }} @else {{ '' }} @endif" /><br>
            </div>
            <div class="col-3">
                <label class="form-label">Data da Leitura</label><br>
                <input type="date" class="form-control" name="dataleitura"
                    value="@if (!empty(old('dataleitura'))) {{ old('dataleitura') }} @elseif(!empty($leitura->dataleitura)) {{ $leitura->dataleitura }} @else {{ '' }} @endif" /><br>
            </div>
            <div class="col-3">
                <label class="form-label">Hora da Leitura</label><br>
                <input type="time" class="form-control" name="horaleitura"
                    value="@if (!empty(old('horaleitura'))) {{ old('horaleitura') }} @elseif(!empty($leitura->horaleitura)) {{ $leitura->horaleitura }} @else {{ '' }} @endif" /><br>
            </div>
            <div class="col-3">
                <label class="form-label">Valor do sensor</label><br>
                <input type="float" class="form-control" name="valorsensor"
                    value="@if (!empty(old('valorsensor'))) {{ old('valorsensor') }} @elseif(!empty($leitura->valorsensor)) {{ $leitura->valorsensor }} @else {{ '' }} @endif" /><br>
            </div>
            <button class="btn btn-dark" type="submit">
                <i class="fa-solid fa-save"></i> Salvar
            </button>
            <a href="{{ route('leitura.index') }}" class="btn btn-dark"><i class="fa-solid fa-arrow-left"></i>
                Voltar</a>
                </select>
            </div>
        </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous">
    </script>
</body>

</html>