import 'package:http/http.dart' as http;
import 'dart:convert'; // Para trabalhar com JSON

void main() async{
  var url1 = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  var resposta = await http.get(url1);

  if(resposta.statusCode==200){
    var dados = jsonDecode(resposta.body);
    print('Título: ${dados['title']}');
  } else{
    print("Erro ${resposta.statusCode}");
  }

  var url2 = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  var resposta2 = await http.post(
    url2,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'title': 'Post de Teste',
      'body': 'Conteúdo qualquer',
      'userId': 123,
    }),
  );

  if (resposta.statusCode == 200) {
    var dados = jsonDecode(resposta.body);
    print('Post criado com ID: ${dados['id']}');
  } else {
    print('Erro: ${resposta.statusCode}');
  }

}
