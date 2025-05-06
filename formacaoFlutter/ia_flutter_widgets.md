

# Notas do Aluno
A IA exibiu uma série de exemplos que ajudaram a fixar os conteúdos, principalmente a parte ListTile e Builder.
# Widgets Fundamentais em Flutter

---

## 📏 Widget `Row`

**`Row`** é um widget que organiza seus filhos horizontalmente, um ao lado do outro.

```dart
Row(
  children: [
    Icon(Icons.star),
    Text('Favorito'),
  ],
)
```

---

## 📐 Como adicionar espaçamento uniforme entre os widgets em um `Row`

Utilize o `SizedBox`, `Spacer` ou `MainAxisAlignment.spaceEvenly`:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.person),
  ],
)
```

---

## ↔️ Diferença entre `MainAxisAlignment` e `CrossAxisAlignment` em um `Row`

* `MainAxisAlignment`: Alinha os widgets **na horizontal** (eixo principal do Row).
* `CrossAxisAlignment`: Alinha os widgets **na vertical** (eixo cruzado do Row).

---

## 📏 Widget `Column`

**`Column`** é um widget que organiza seus filhos verticalmente, um embaixo do outro.

```dart
Column(
  children: [
    Text('Título'),
    Text('Subtítulo'),
  ],
)
```

---

## ↕️ Diferença entre `MainAxisAlignment` e `CrossAxisAlignment` em um `Column`

* `MainAxisAlignment`: Alinha os widgets **na vertical** (eixo principal da Column).
* `CrossAxisAlignment`: Alinha os widgets **na horizontal** (eixo cruzado da Column).

---

## 🎯 Widget `Stack`

O **`Stack`** sobrepõe widgets, um em cima do outro, como camadas.

```dart
Stack(
  children: [
    Container(width: 100, height: 100, color: Colors.red),
    Positioned(
      top: 10,
      left: 10,
      child: Icon(Icons.star),
    ),
  ],
)
```

---

## ➕ Vantagens do `Stack` em relação a `Row` ou `Column`

* Permite sobreposição de widgets.
* Flexibilidade no posicionamento absoluto.
* Ideal para elementos como banners, avatares, badges, etc.

---

## 🎯 Como posicionar widgets específicos dentro de um `Stack`

Use o widget `Positioned`:

```dart
Positioned(
  top: 20,
  right: 10,
  child: Text("Topo Direito"),
)
```

---

## 🖼️ Como exibir uma imagem de um arquivo local

1. Adicione a imagem na pasta `assets`.
2. Configure no `pubspec.yaml`.
3. Use `Image.asset`:

```dart
Image.asset('assets/imagem.png')
```

---

## ✍️ Propriedades para controlar aparência do texto

* `style: TextStyle(...)` permite definir:

    * `fontSize`, `fontWeight`, `color`, `fontFamily`, etc.

```dart
Text(
  'Exemplo',
  style: TextStyle(fontSize: 20, color: Colors.blue),
)
```

---

## 📄 Como exibir texto em várias linhas

O `Text` se adapta automaticamente. Use `maxLines` e `overflow` para controle:

```dart
Text(
  'Texto longo que precisa quebrar linha.',
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)
```

---

## 📋 Como criar uma lista com rolagem vertical

Use `ListView`:

```dart
ListView(
  children: [
    Text('Item 1'),
    Text('Item 2'),
  ],
)
```

---

## 🔁 Como adicionar itens dinamicamente a um `ListView`

Use `ListView.builder` com uma lista dinâmica:

```dart
ListView.builder(
  itemCount: itens.length,
  itemBuilder: (context, index) {
    return Text(itens[index]);
  },
)
```

---

## 📏 Diferença entre `ListView.builder` e `ListView.separated`

* `builder`: cria lista dinâmica.
* `separated`: cria lista com separadores entre os itens.

```dart
ListView.separated(
  itemCount: 5,
  itemBuilder: (_, i) => Text("Item $i"),
  separatorBuilder: (_, i) => Divider(),
)
```

---

## 🔹 Como usar `ListTile` para criar itens de lista

```dart
ListTile(
  leading: Icon(Icons.email),
  title: Text('Email'),
  subtitle: Text('mensagem'),
  trailing: Icon(Icons.arrow_forward),
)
```

---

## 🖱️ Como tornar `ListTile` interativo

Adicione o parâmetro `onTap`:

```dart
ListTile(
  title: Text('Clique aqui'),
  onTap: () => print('Item clicado!'),
)
```

---

## ✅ Vantagens de usar `ListTile` em vez de widgets simples

* Combina título, subtítulo, ícone, trailing e ação em um só widget.
* Ideal para listas padronizadas e interativas.

---

## 🧱 Como os widgets são organizados dentro de um `Stack`

A ordem dos filhos importa: os primeiros ficam no **fundo**, os últimos **no topo** da pilha.

---

## 🌐 Como exibir uma imagem da internet

Use `Image.network`:

```dart
Image.network('https://exemplo.com/imagem.jpg')
```

---

## 🌫️ Como adicionar efeito de desvanecimento a uma imagem

Use `FadeInImage`:

```dart
FadeInImage.assetNetwork(
  placeholder: 'assets/loading.gif',
  image: 'https://exemplo.com/imagem.jpg',
)
```

---

## 🧩 Como adicionar ícones e elementos visuais ao `ListTile`

Use `leading`, `trailing` e combine com outros widgets:

```dart
ListTile(
  leading: Icon(Icons.person),
  title: Text('Nome'),
  trailing: Icon(Icons.arrow_forward),
)
```
