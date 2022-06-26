import 'package:asramon/services/via_cep_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late ViaCepService buscarCep;
  var _resultado;

  final _cepController = TextEditingController(); // CEP
  final _enderecoController = TextEditingController(); // Nome da Rua
  final _bairroController = TextEditingController(); // Bairro
  final _cidadeContoller = TextEditingController(); // Cidade / Localidade
  final _ufController = TextEditingController(); //  Unidade federativa Estado.
  final _localidadeController = TextEditingController(); //  Unidade federativa Estado.
  final _logradouroController = TextEditingController(); //  Unidade federativa Estado.
  final _dddController = TextEditingController(); //  Unidade federativa Estado.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cep'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            GestureDetector(
              child: TextFormField(
                controller: _cepController,
                onChanged: (_cepController) {
                  if (_cepController.length >= 8) {
                    searchCep();
                  }
                },
                decoration: const InputDecoration(
                  labelText: "CEP",
                ),
              ),
            ),
            dadosCep(_ufController, "UF"),
            dadosCep(_bairroController, "Bairro"),
            dadosCep(_cidadeContoller, "Cidade"),
            dadosCep(_logradouroController, "Logradouro"),
            dadosCep(_dddController, "DDD"),
          ],
        ),
      ),
    );
  }

  void searchCep() async {
    // Variáveis que receberão os dados do WebService
    String _bairro;
    String _cidade;
    String _cep;
    String _uf;
    String _endereco;
    String _logradouro;
    String _localidade;
    String _ddd;

    _cep = _cepController.text;

    final infoCepJSON = await ViaCepService.gethttp(_cep);

    //  variáveis recebendo os dados em JSON da API
    _bairro = infoCepJSON.bairro;
    _localidade = infoCepJSON.localidade;
    _endereco = infoCepJSON.logradouro;
    _cidade = infoCepJSON.localidade;
    _logradouro = infoCepJSON.logradouro;
    _uf = infoCepJSON.uf;
    _ddd = infoCepJSON.ddd;

    // controller recebendo os dados das variáveis
    _enderecoController.text = _endereco;
    _bairroController.text = _bairro;
    _cidadeContoller.text = _cidade;
    _localidadeController.text = _localidade;
    _ufController.text = _uf;
    _logradouroController.text = _logradouro;
    _dddController.text = _ddd;
  }

  Widget dadosCep(TextEditingController controller, String nomeCampoCep) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: nomeCampoCep,
      ),
    );
  }
}
