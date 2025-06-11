import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ProviderFavoritos(), child: MyApp()),
  );
}

class Video {
  final String titulo;
  final String imagem;
  final List<String> tags;

  Video({required this.titulo, required this.imagem, required this.tags});
}

class ProviderFavoritos with ChangeNotifier {
  List<Video> lista0 = [];
  List<Video> lista2 = [];

  bool pesquisaAtiva = false;

  //função que atualiza a pesquisaAtiva
  void atualizaPesquisa() {
    pesquisaAtiva = !pesquisaAtiva;
    notifyListeners();
  }

  //função que retorna a exibição de um vídeo pra lista
  Column exibirVideo(Video video) {
    //pegando a lista de tags e jogando ela para uma String

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(video.imagem, fit: BoxFit.cover),
        ),
        Text(
          video.titulo,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),

        Wrap(
          children: [
            for (final item in video.tags)
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Chip(label: Text(item.toString())),
              ),
          ],
        ),
        // Text(
        //   video.tags.toString(),
        //   textAlign: TextAlign.start,
        //   style: TextStyle(fontStyle: FontStyle.italic),
        // ),
      ],
    );
  }

  //função que clona a lista0 para lista2
  void clonarLista0() {
    lista2.addAll(lista0);
  }

  //função de adicionar video na lista
  void adicionarVideoLista(String urlPassado, List<String> tagsPassadas) async {
    //tratando urlpassada
    var urlPassado2 = urlPassado.split('=');
    var urlAPI = Uri.parse(
      'https://cruiserdev.lince.com.br/video/' + urlPassado2[1],
    );

    Video videoNovo;

    var resposta = await http.get(urlAPI);
    if (resposta.statusCode == 200) {
      var dados = jsonDecode(resposta.body);
      videoNovo = Video(
        titulo: dados['titulo'],
        imagem: dados['imagem'],
        tags: tagsPassadas,
      );

      lista0.add(videoNovo);
      notifyListeners();
    } else {
      print("Não foi possível encontrar o vídeo!");
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeApp.routeName,
      routes: {
        HomeApp.routeName: (context) => HomeApp(),
        CadastroVideoTela.routeName: (context) => CadastroVideoTela(),
      },
    );
  }
}

//tela de listagem de video
class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  static const routeName = '/TelaHome';

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProviderFavoritos>(context);

    return Scaffold(
      appBar: AppBar(
        title: state.pesquisaAtiva
            ? Row(
                children: [
                  InkWell(
                    child: Icon(Icons.arrow_back, color: Colors.white),
                    onTap: () {
                      state.atualizaPesquisa();
                      //clonar a lista original para exibir a lista original
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Qualquer coisa'),
                    ),
                  ),
                ],
              )
            : Text('Favoritos YT', style: TextStyle(color: Colors.white)),
        actions: [
          InkWell(
            child: Icon(Icons.search, color: Colors.white),
            onTap: () {
              //definir booleano de pesquisa como true
              state.atualizaPesquisa();
              //limpar lista modificável
            },
          ),
          InkWell(child: Icon(Icons.settings, color: Colors.white)),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
        child: Stack(
          children: [
            Consumer<ProviderFavoritos>(
              builder: (context, p, child) => ListView.builder(
                itemCount: p.lista0.length,
                itemBuilder: (context, indice) {
                  return ListTile(
                    title: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                      child: p.exibirVideo(p.lista0[indice]),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, CadastroVideoTela.routeName);
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//tela de cadastro
class CadastroVideoTela extends StatelessWidget {
  CadastroVideoTela({super.key});

  static const routeName = '/CadastroTela';
  final formKey = GlobalKey<FormState>();

  final urlController = TextEditingController();
  final tagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProviderFavoritos>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cadastro'), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text('URL do vídeo'),
              TextFormField(
                controller: urlController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              Text('Categorias (#)'),
              TextFormField(
                controller: tagsController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    String tags = tagsController.text;
                    List<String> tagsString = tags.split(' ');

                    state.adicionarVideoLista(urlController.text, tagsString);
                  }
                },
                child: Text('Cadastrar video'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
