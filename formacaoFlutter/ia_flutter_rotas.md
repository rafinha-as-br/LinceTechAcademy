
### Notas do aluno
Muito interessante a construção dos exemplos que a IA utilizou, mostrando rotas e utilizando listas como no exemplo dos times de futebol brasileiro
### O que são rotas anônimas em Flutter e como elas funcionam?

Rotas anônimas são formas de navegação em que você empilha uma nova tela diretamente usando o widget da tela, sem nomeá-la. Elas funcionam como uma pilha: cada nova rota empurrada (`push`) fica por cima da anterior, e você pode voltar com `pop()`.

Exemplo:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => TelaDetalhes()),
);
```

---

### Quais métodos do Navigator são comumente utilizados e por quê?

* `Navigator.push()`: navega para uma nova tela.
* `Navigator.pop()`: volta para a tela anterior.
* `Navigator.pushReplacement()`: substitui a tela atual por outra.
* `Navigator.pushNamed()`: usado com rotas nomeadas.
* `Navigator.popUntil()`: volta várias telas até uma condição.
* `Navigator.canPop()`: verifica se é possível voltar.

Esses métodos ajudam a controlar o fluxo da navegação no app.

---

### Qual a função do Navigator.push() na navegação com rotas anônimas?

Ele empilha uma nova tela sobre a atual, criando uma nova rota anônima.

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => TelaNova()),
);
```

Isso é útil para transições simples e rápidas sem precisar registrar a rota antes.

---

### Quais as vantagens e desvantagens de usar rotas anônimas?

**Vantagens:**

* Rápidas de implementar.
* Boas para protótipos ou navegações simples.

**Desvantagens:**

* Difícil de reutilizar.
* Não centraliza a gestão das rotas.
* Dificulta manutenção em projetos maiores.

---

### O que são rotas nomeadas em Flutter e como elas funcionam?

Rotas nomeadas permitem navegar entre telas usando strings (nomes) em vez de instanciar widgets diretamente. Você define um mapa de rotas no `MaterialApp`, e navega usando `Navigator.pushNamed()`.

---

### Como posso navegar para uma rota nomeada específica?

Exemplo de navegação:

```dart
Navigator.pushNamed(context, '/detalhes');
```

Certifique-se de que a rota `/detalhes` esteja definida no `MaterialApp`.

---

### Quais as vantagens de usar rotas nomeadas em relação às rotas anônimas?

* Melhor organização e manutenção.
* Reutilização mais fácil.
* Navegação centralizada.
* Boa integração com URLs na web (Flutter Web).

---

### Como posso definir rotas nomeadas em meu aplicativo Flutter?

No `MaterialApp`, use o parâmetro `routes`:

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => TelaInicial(),
    '/detalhes': (context) => TelaDetalhes(),
  },
)
```

---

### Como posso acessar os parâmetros passados em uma rota nomeada?

Ao navegar, envie argumentos:

```dart
Navigator.pushNamed(
  context,
  '/detalhes',
  arguments: 'Flamengo',
);
```

Na tela de destino:

```dart
final time = ModalRoute.of(context)!.settings.arguments as String;
```

---

### Como posso tornar os parâmetros opcionais em uma rota nomeada?

Você pode verificar se os `arguments` são nulos ou não, antes de usá-los:

```dart
final argumentos = ModalRoute.of(context)?.settings.arguments;
if (argumentos != null && argumentos is String) {
  // use o valor
}
```

Ou defina um valor padrão caso o parâmetro não venha.

---

### Quais cuidados devo ter ao usar as rotas?

* Evitar acoplamento excessivo entre telas.
* Garantir que os parâmetros estejam corretos (tipo, null-safety).
* Usar `Navigator.pop()` somente se pode voltar (`canPop()`).
* Evitar pilhas muito profundas sem controle.

---

### Quais as boas práticas ao usar rotas em Flutter?

* Centralizar as rotas no `MaterialApp`.
* Usar constantes para nomes de rotas.
* Validar os argumentos recebidos.
* Usar rotas nomeadas em apps maiores.
* Componente cada tela em arquivos separados.

---

### Traga um exemplo de galeria navegando entre imagens usando rotas anônimas.

```dart
// Tela de galeria
List<String> imagens = ['img1.png', 'img2.png'];

ListView.builder(
  itemCount: imagens.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('Imagem ${index + 1}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TelaImagem(imagem: imagens[index]),
          ),
        );
      },
    );
  },
)

// TelaImagem
class TelaImagem extends StatelessWidget {
  final String imagem;

  TelaImagem({required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visualizar imagem')),
      body: Center(child: Image.asset(imagem)),
    );
  }
}
```

---

### Crie um fluxo com várias telas, passando pelos times brasileiros usando rotas nomeadas e parâmetros.

```dart
// main.dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => TelaTimes(),
    '/detalhes': (context) => DetalhesTime(),
  },
)

// TelaTimes
class TelaTimes extends StatelessWidget {
  final List<String> times = ['Flamengo', 'Palmeiras', 'Grêmio'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Times Brasileiros')),
      body: ListView(
        children: times.map((time) {
          return ListTile(
            title: Text(time),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detalhes',
                arguments: time,
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

// DetalhesTime
class DetalhesTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final time = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Detalhes')),
      body: Center(
        child: Text('Você selecionou o time: $time'),
      ),
    );
  }
}
```

---
