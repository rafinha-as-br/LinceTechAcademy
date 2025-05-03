
# 📝 Notas do Aluno
A IA trouxe informações precisas e acertivas, facilitando a compreensão do conteúdo dos vídeos.

## Flutter: Introdução ao MaterialApp, Widgets e Gerenciamento de Estado

---

### 📦 O que é o `MaterialApp` e seus principais parâmetros?

O `MaterialApp` é um widget raiz que configura a aplicação com temas, rotas e muito mais, seguindo os padrões do Material Design.

```dart
MaterialApp(
  title: 'Minha App',
  theme: ThemeData(primarySwatch: Colors.blue),
  home: MyHomePage(),
)
```

#### 🔑 Parâmetros importantes:

| Parâmetro                    | Função                                               |
| ---------------------------- | ---------------------------------------------------- |
| `title`                      | Título da aplicação (visível em algumas plataformas) |
| `home`                       | Widget principal que será exibido na tela inicial    |
| `theme`                      | Define cores, fontes e estilo da aplicação           |
| `routes`                     | Define as rotas nomeadas da aplicação                |
| `initialRoute`               | Rota inicial quando a app é carregada                |
| `debugShowCheckedModeBanner` | Remove a faixa "debug" no canto da tela              |

---

### 📚 Como funcionam os `import`s no Flutter?

* Utilizam o padrão do Dart: `import 'package:nome_do_pacote/arquivo.dart';`
* Também aceitam importações relativas: `import '../widgets/botao.dart';`
* Importações podem ser:

    * `show` para exibir apenas símbolos específicos.
    * `hide` para ocultar símbolos específicos.
    * `as` para criar um prefixo.

```dart
import 'package:flutter/material.dart';
import 'meu_widget.dart' show BotaoPersonalizado;
```

---

### 🎨 O que é o Material Design e como é usado no Flutter?

O **Material Design** é um sistema de design criado pelo Google, que fornece diretrizes para cores, animações, ícones e componentes.

O Flutter implementa o Material Design nativamente por meio de widgets prontos como `AppBar`, `FloatingActionButton`, `TextField`, etc.

---

### 🧱 Principais Widgets do Material Design no Flutter:

* `AppBar`
* `Scaffold`
* `FloatingActionButton`
* `TextField`
* `BottomNavigationBar`
* `Drawer`
* `Card`
* `Snackbar`
* `ElevatedButton`

---

## 🧩 Widgets Stateless

### 🟩 O que são?

Widgets **imutáveis** que **não possuem estado interno**. Tudo que o widget exibe depende apenas dos dados que ele recebe.

### 🔁 Ciclo de vida:

1. `build()` – é chamado apenas uma vez e reconstroi o widget sempre que necessário.

### 🚫 Limitações:

* Não pode atualizar dinamicamente a interface.
* Útil para componentes estáticos.

```dart
class MeuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Sou um widget estático");
  }
}
```

---

## 🔄 Widgets Stateful

### 🟦 O que são?

Widgets que **mantêm estado interno** e podem mudar ao longo do tempo, respondendo a eventos e interações do usuário.

### 🔁 Ciclo de vida:

1. `createState()` – cria o estado do widget.
2. `initState()` – chamado ao iniciar.
3. `build()` – reconstrói a interface.
4. `setState()` – solicita uma nova renderização.
5. `dispose()` – chamado ao remover o widget da árvore.

```dart
class MeuWidgetDinamico extends StatefulWidget {
  @override
  _MeuWidgetDinamicoState createState() => _MeuWidgetDinamicoState();
}

class _MeuWidgetDinamicoState extends State<MeuWidgetDinamico> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Contador: $contador'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              contador++;
            });
          },
          child: Text('Incrementar'),
        )
      ],
    );
  }
}
```

---

### ⚙️ Como funciona o `setState`?

* Chama a função passada e atualiza o estado interno.
* Dispara a reconstrução do widget.
* Deve ser usado com cautela, pois muitas chamadas podem afetar a performance.

---

### ❗ Cuidados com gerenciamento de estado:

* Não abusar de `setState` em widgets complexos.
* Evitar chamadas desnecessárias de reconstrução.
* Considerar soluções como `Provider`, `Riverpod`, `Bloc`, etc., em projetos maiores.

---

### 📊 Diferenças entre Stateless e Stateful

| Característica    | Stateless             | Stateful                          |
| ----------------- | --------------------- | --------------------------------- |
| Estado            | Não armazena estado   | Possui estado interno             |
| Atualização de UI | Não reage a mudanças  | Pode atualizar dinamicamente a UI |
| Simplicidade      | Simples e leve        | Mais complexo                     |
| Uso Ideal         | Componentes estáticos | Componentes interativos/dinâmicos |

---

## ✅ Exemplos de uso prático

### 💡 Quando usar Stateless?

* Texto estático
* Ícones
* Layouts fixos

```dart
class Mensagem extends StatelessWidget {
  final String texto;
  Mensagem(this.texto);

  @override
  Widget build(BuildContext context) {
    return Text(texto);
  }
}
```

---

### 💡 Quando usar Stateful?

* Contadores
* Campos de formulário
* Componentes que mudam ao longo do tempo

---

### 🧪 Exemplo comparativo Stateless vs Stateful

#### Stateless:

```dart
class Saudacao extends StatelessWidget {
  final String nome;
  Saudacao(this.nome);

  @override
  Widget build(BuildContext context) {
    return Text('Olá, $nome');
  }
}
```

#### Stateful:

```dart
class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int valor = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Valor: $valor'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              valor++;
            });
          },
          child: Text('Adicionar'),
        ),
      ],
    );
  }
}
```