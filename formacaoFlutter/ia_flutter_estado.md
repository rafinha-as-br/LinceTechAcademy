### Notas do aluno
A IA trouxe exemplos ótimos e práticos de se entender, de forma que retiraram algumas dúvidas que eu acabei tendo após ver as videoaulas
---

### O que é gerenciamento de estados em Flutter e por que é importante?

Gerenciamento de estado é o controle sobre os dados que mudam durante a execução de um app. Em Flutter, quando o estado de um widget muda, ele precisa ser reconstruído para refletir essa mudança na interface.

É importante porque ajuda a manter a UI sincronizada com os dados, garantindo que o aplicativo funcione de forma reativa e previsível.

---

### Qual a diferença entre estado local e estado global em um aplicativo Flutter?

* **Estado local**: mantido dentro de um único widget. Exemplo: um contador em `StatefulWidget`.
* **Estado global**: compartilhado entre vários widgets e telas. Exemplo: usuário logado, tema do app, carrinho de compras.

O estado global geralmente é controlado por bibliotecas de gerenciamento como `Provider`, `Riverpod`, `Bloc`, entre outras.

---

### Quais as vantagens de usar um gerenciador de estados em um projeto Flutter?

* Organização e separação entre lógica e interface.
* Reutilização de dados em múltiplos widgets.
* Facilidade de testes.
* Maior controle sobre atualizações e reconstruções da UI.
* Melhoria na performance e manutenção do código.

---

### O que é o pacote Provider em Flutter e para que ele serve?

`Provider` é uma biblioteca oficial recomendada pelo time do Flutter para gerenciamento de estado de forma simples, escalável e eficiente.

Ele permite:

* Compartilhar dados entre widgets sem precisar passar manualmente via construtores.
* Atualizar partes específicas da interface automaticamente quando os dados mudam.

---

### Como o Provider ajuda a evitar a reconstrução desnecessária de widgets?

O Provider permite que apenas os widgets que dependem diretamente dos dados (ou seja, os que “ouvem” as mudanças) sejam reconstruídos. Isso evita a reconstrução de toda a árvore de widgets, melhorando a performance.

---

### Como o Provider simplifica o gerenciamento de estados em Flutter?

Ele:

* Usa classes simples como `ChangeNotifier` para notificar mudanças.
* Evita o uso excessivo de `setState`.
* Centraliza o estado em um local acessível pela árvore de widgets.
* Tem uma API simples de entender e usar.

---

### O que é o ChangeNotifierProvider e como ele funciona?

`ChangeNotifierProvider` é um widget do pacote `Provider` que:

* Fornece uma instância de uma classe que estende `ChangeNotifier` para os widgets filhos.
* Permite notificar listeners quando o estado mudar.

---

### Como posso fornecer um ChangeNotifier para a árvore de widgets usando ChangeNotifierProvider?

Exemplo:

```dart
ChangeNotifierProvider(
  create: (context) => MeuModelo(),
  child: MyApp(),
)
```

Agora qualquer widget dentro de `MyApp` pode acessar e escutar `MeuModelo`.

---

### Como posso atualizar o estado do meu aplicativo usando providers?

Dentro da sua classe que estende `ChangeNotifier`, você cria métodos que alteram os dados e chamam `notifyListeners()` para avisar os widgets que dependem do estado:

```dart
class Contador with ChangeNotifier {
  int valor = 0;

  void incrementar() {
    valor++;
    notifyListeners();
  }
}
```

---

### O que é o Consumer e como ele funciona?

`Consumer` é um widget que escuta as mudanças de um `Provider` e reconstrói apenas o widget dentro do seu builder quando o estado muda.

Exemplo:

```dart
Consumer<Contador>(
  builder: (context, contador, child) {
    return Text('${contador.valor}');
  },
)
```

---

### Como o Consumer ajuda a reconstruir apenas os widgets que dependem do estado?

Apenas o widget passado no builder do `Consumer` será reconstruído quando o estado mudar. Isso isola a reconstrução e evita recarregar toda a interface.

---

### Como posso usar o Consumer para acessar o estado fornecido pelo ChangeNotifierProvider?

Basta usar o `Consumer<T>` onde `T` é o tipo do seu modelo. Dentro do builder, você tem acesso ao objeto do estado.

```dart
Consumer<MeuModelo>(
  builder: (context, modelo, child) {
    return Text(modelo.texto);
  },
)
```

---

### Qual a diferença entre usar Consumer e Provider.of() para acessar o estado?

* `Consumer`: reconstrói apenas o widget filho dele quando o estado muda.
* `Provider.of(context)`: pode ser usado para obter o estado, mas se `listen: true` for usado, ele reconstrói o widget inteiro que está chamando o método.

Use `Provider.of(context, listen: false)` se só quiser acessar métodos sem escutar mudanças.

---

### Como posso otimizar o uso do Consumer para evitar reconstruções desnecessárias?

* Evite colocar grandes widgets dentro do `builder`.
* Extraia o widget que consome o estado para um componente separado.
* Use `child` dentro do `Consumer` para partes da interface que não precisam ser reconstruídas.

```dart
Consumer<Contador>(
  builder: (context, contador, child) {
    return Column(
      children: [
        Text('${contador.valor}'),
        child!, // não reconstrói
      ],
    );
  },
  child: Text('Texto fixo'),
)
```

---

### Crie um aplicativo simples com um contador que pode ser incrementado e decrementado, usando ChangeNotifierProvider e Consumer.

```dart
// Modelo
class Contador with ChangeNotifier {
  int valor = 0;

  void incrementar() {
    valor++;
    notifyListeners();
  }

  void decrementar() {
    valor--;
    notifyListeners();
  }
}

// main.dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Contador(),
      child: MyApp(),
    ),
  );
}

// UI
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Contador')),
        body: Center(
          child: Consumer<Contador>(
            builder: (context, contador, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Valor: ${contador.valor}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: contador.incrementar,
                      child: Text('+'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: contador.decrementar,
                      child: Text('-'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

---

### De exemplos de consumo a API’s em Flutter?

Com o `Provider`, você pode criar um modelo que faz chamadas HTTP e atualiza a UI quando os dados chegam:

```dart
class DadosAPI with ChangeNotifier {
  String? resultado;

  Future<void> buscarDados() async {
    final resposta = await http.get(Uri.parse('https://api.exemplo.com/dado'));
    resultado = jsonDecode(resposta.body)['nome'];
    notifyListeners();
  }
}
```

Na UI:

```dart
ElevatedButton(
  onPressed: () {
    Provider.of<DadosAPI>(context, listen: false).buscarDados();
  },
  child: Text('Buscar'),
)

Consumer<DadosAPI>(
  builder: (context, api, _) => Text(api.resultado ?? 'Sem dados'),
)
```

---

### Crie um aplicativo de tema que permite ao usuário alternar entre temas claros e escuros, usando ChangeNotifierProvider e Consumer.

```dart
// Modelo
class TemaModel with ChangeNotifier {
  bool _modoEscuro = false;

  bool get modoEscuro => _modoEscuro;

  void alternarTema() {
    _modoEscuro = !_modoEscuro;
    notifyListeners();
  }
}

// main.dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TemaModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TemaModel>(
      builder: (context, tema, _) {
        return MaterialApp(
          theme: tema.modoEscuro ? ThemeData.dark() : ThemeData.light(),
          home: TelaPrincipal(),
        );
      },
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tema = Provider.of<TemaModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Tema Dinâmico')),
      body: Center(
        child: SwitchListTile(
          title: Text('Modo Escuro'),
          value: tema.modoEscuro,
          onChanged: (_) => tema.alternarTema(),
        ),
      ),
    );
  }
}
```
