### Notas do aluno
Os promps fornecidos ajudaram a entender mais os comportamentos e as diferentes formas de trabalhar com JSON, ótimo para praticar consumos de APIs.
---

### O que é programação assíncrona em Flutter e por que ela é importante?

Programação assíncrona permite executar tarefas demoradas (como requisições de rede, leitura de arquivos, etc.) sem bloquear a interface do usuário.

No Flutter, manter a UI fluida é essencial, e o uso de `async`, `await`, `Future` e `Stream` ajuda a lidar com operações que levam tempo, evitando travamentos ou congelamentos no app.

---

### Quais cuidados devo ter usando programação assíncrona?

* **Evitar bloqueios**: nunca use loops pesados ou `sleep` na main thread.
* **Lidar com erros**: sempre trate exceções com `try-catch`.
* **Não esquecer de aguardar**: se uma função `async` não for aguardada com `await`, o código seguinte pode executar antes da resposta.
* **Gerenciar estados corretamente**: atualize a UI apenas após a resposta.

---

### O que são isolates em Flutter?

Isolates são unidades de execução independentes que não compartilham memória. Cada isolate tem seu próprio loop de eventos e executa paralelamente ao main isolate (onde roda a UI).

Flutter usa isolates para executar tarefas pesadas em segundo plano, como:

* Processamento de arquivos grandes
* Cálculos complexos

---

### Quais cuidados devo ter ao usar isolates em Flutter?

* Comunicação entre isolates deve ser feita com `SendPort` e `ReceivePort`.
* Não é possível compartilhar objetos diretamente entre isolates.
* Não use isolates para tarefas simples; são mais indicados para processamento pesado.
* Isolates não têm acesso à UI — toda interação com widgets deve ser feita no isolate principal.

---

### Qual o conceito do Loop de Eventos em Flutter?

O loop de eventos (event loop) é a estrutura que gerencia todas as tarefas assíncronas no Dart.

Quando você executa algo como `Future.delayed()`, essa tarefa entra na fila de eventos. O loop verifica essa fila constantemente e executa as tarefas assim que possível, mantendo o app responsivo.

---

### O que é um `Future` em Dart e como ele funciona?

Um `Future` representa um valor que estará disponível **no futuro**. Ele pode estar em três estados:

* **Incompleto**
* **Completo com sucesso** (com um valor)
* **Completo com erro**

Exemplo:

```dart
Future<String> pegarDados() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Dados prontos';
}
```

---

### Como posso usar `async` e `await` para trabalhar com `Futures`?

Use `async` para marcar uma função que retorna um `Future`, e `await` para esperar o resultado:

```dart
Future<void> carregarDados() async {
  String resultado = await pegarDados();
  print(resultado);
}
```

---

### Como posso lidar com erros em operações assíncronas usando `try-catch`?

Envolva suas chamadas `await` com `try-catch` para capturar exceções:

```dart
try {
  final resposta = await http.get(Uri.parse('https://api.exemplo.com'));
  print(resposta.body);
} catch (e) {
  print('Erro: $e');
}
```

---

### Traga a explicação dos métodos HTTP.

* **GET**: Busca dados (ex: ler posts).
* **POST**: Envia dados (ex: criar um novo usuário).
* **PUT**: Substitui dados existentes.
* **PATCH**: Atualiza parcialmente.
* **DELETE**: Remove dados.

---

### Como posso lidar com diferentes códigos de resposta HTTP (200, 404, 500)?

Você pode verificar o código com `response.statusCode`:

```dart
if (response.statusCode == 200) {
  // Sucesso
} else if (response.statusCode == 404) {
  // Não encontrado
} else if (response.statusCode == 500) {
  // Erro do servidor
}
```

---

### O que é JSON e como ele é usado em Flutter?

JSON (JavaScript Object Notation) é um formato leve para armazenar e trocar dados. Em Flutter, é usado para comunicar com APIs REST.

Exemplo:

```json
{
  "nome": "João",
  "idade": 30
}
```

---

### Como posso acessar valores específicos em um objeto JSON?

Após decodificar com `jsonDecode()`:

```dart
final dados = jsonDecode(resposta.body);
print(dados['nome']);
```

---

### Como posso lidar com arrays (listas) em JSON em Flutter?

Suponha o JSON:

```json
{
  "usuarios": [
    {"nome": "João"},
    {"nome": "Maria"}
  ]
}
```

Você pode acessar assim:

```dart
List usuarios = dados['usuarios'];
print(usuarios[0]['nome']);
```

---

### Como posso iterar sobre os elementos de um array JSON?

Use um `for` ou `map()`:

```dart
for (var u in usuarios) {
  print(u['nome']);
}
```

---

### Por que é útil mapear JSON para classes Dart?

* Torna o código mais seguro (tipado).
* Facilita leitura e escrita.
* Ajuda no uso com `ListView`, `Provider`, etc.

---

### Como posso usar `factory` para criar objetos Dart a partir de JSON?

Exemplo de classe com `factory`:

```dart
class Usuario {
  final String nome;

  Usuario({required this.nome});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(nome: json['nome']);
  }
}
```

Uso:

```dart
final usuario = Usuario.fromJson(jsonData);
```

---

### Como posso usar `toJson()` para converter objetos Dart em JSON?

```dart
class Usuario {
  final String nome;

  Usuario({required this.nome});

  Map<String, dynamic> toJson() {
    return {'nome': nome};
  }
}
```

Uso:

```dart
final json = usuario.toJson();
```

---

### Como organizar minhas requisições no meu código Flutter?

**Boa prática**: criar uma camada de serviços, por exemplo:

```dart
class ApiService {
  Future<List<Usuario>> buscarUsuarios() async {
    final resposta = await http.get(Uri.parse('...'));
    final lista = jsonDecode(resposta.body) as List;
    return lista.map((e) => Usuario.fromJson(e)).toList();
  }
}
```

---

### Como posso exibir uma mensagem de carregamento enquanto a requisição HTTP está em andamento?

Use um `FutureBuilder`:

```dart
FutureBuilder(
  future: buscarUsuarios(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Erro: ${snapshot.error}');
    } else {
      return ListaUsuarios(snapshot.data);
    }
  },
)
```

---

### De exemplos de consumo a API’s em Flutter?

```dart
class Usuario {
  final String nome;
  Usuario({required this.nome});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(nome: json['nome']);
  }
}

Future<List<Usuario>> buscarUsuarios() async {
  final resposta = await http.get(Uri.parse('https://exemplo.com/usuarios'));
  if (resposta.statusCode == 200) {
    final dados = jsonDecode(resposta.body) as List;
    return dados.map((json) => Usuario.fromJson(json)).toList();
  } else {
    throw Exception('Erro ao buscar usuários');
  }
}
```

Uso na interface:

```dart
FutureBuilder<List<Usuario>>(
  future: buscarUsuarios(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Erro: ${snapshot.error}');
    } else {
      return ListView(
        children: snapshot.data!.map((u) => ListTile(title: Text(u.nome))).toList(),
      );
    }
  },
)
```
