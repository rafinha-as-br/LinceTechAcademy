
# Notas do Aluno

O conteúdo apresentado pela IA fora ótimo, porém, pedi mais um tópico sobre Parâmetros Posicionais e Nomeados, este
tópico fora citado em uma das questões do quiz #1 de orientação a objetos e acredito que deveria estar incluído dentro 
dos tópicos desta interação IA.


# Orientação a Objetos em Dart

---

## Quais são os principais conceitos da orientação a objetos?

1. **Classe**: Molde para criar objetos. Define atributos (dados) e métodos (comportamentos).
2. **Objeto**: Instância de uma classe.
3. **Encapsulamento**: Esconde detalhes internos, expondo apenas o necessário.
4. **Herança**: Uma classe pode herdar de outra, reutilizando código.
5. **Polimorfismo**: Um mesmo método pode ter comportamentos diferentes em classes distintas.
6. **Abstração**: Foca no que um objeto faz, não em como ele faz.

---

## Quais as vantagens de usar orientação a objetos?

- **Organização do código** em torno de entidades reais (modelos do mundo real).
- **Reutilização de código** via herança e composição.
- **Facilidade de manutenção e expansão** do sistema.
- **Separação de responsabilidades** clara entre classes.
- **Melhor legibilidade e modularização** do projeto.

---

## O que é uma 'classe' e como ela se relaciona com 'objetos'?

- Uma **classe** é um **modelo**.
- Um **objeto** é uma **instância concreta** dessa classe.

```dart
class Pessoa {
  String nome;
  int idade;

  void apresentar() {
    print("Olá, meu nome é $nome e tenho $idade anos.");
  }
}

// Criando objeto
var pessoa1 = Pessoa()
  ..nome = "João"
  ..idade = 30;
```

---

## O que são 'métodos' e como eles funcionam dentro de uma classe?

- **Métodos** são funções definidas dentro de uma classe que operam sobre seus atributos ou realizam ações.

```dart
class Conta {
  double saldo = 0;

  void depositar(double valor) {
    saldo += valor;
  }
}
```

---

## Como posso acessar os métodos de um objeto em Dart?

Usando a **notação de ponto** (`.`):

```dart
var conta = Conta();
conta.depositar(100); // chama o método
print(conta.saldo);   // acessa o atributo
```

---

## Qual a diferença entre atributos 'públicos' e 'privados'?

- **Públicos**: Acessíveis de fora da classe.
- **Privados**: Começam com `_` (underscore) e só são acessíveis dentro do mesmo arquivo.

```dart
class Produto {
  String nome;
  double _preco; // privado

  Produto(this.nome, this._preco);
}
```

---

## Qual a diferença entre um construtor padrão e um construtor nomeado?

- **Construtor padrão**: Usado para inicializar uma classe normalmente.
- **Construtor nomeado**: Permite criar formas alternativas de inicialização.

```dart
class Pessoa {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade); // padrão

  Pessoa.crianca(this.nome) : idade = 10; // nomeado
}

var p1 = Pessoa("Ana", 25);
var p2 = Pessoa.crianca("Carlos");
```

---

## O que são 'factories' em Dart e quando devo usá-las?

- **Factory constructors** são usados quando você precisa **controlar a criação** de objetos, como:
    - Criar instâncias com cache
    - Retornar subclasses
    - Fazer verificações antes de instanciar

```dart
class Usuario {
  String nome;

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario._internal(json['nome']);
  }

  Usuario._internal(this.nome);
}
```

---

## Dicas de organização do meu projeto usando classes

- **Separe arquivos por responsabilidade** (ex: `usuario.dart`, `produto.dart`).
- **Evite classes grandes** com muitas responsabilidades.
- **Use herança com cuidado**, preferindo **composição** quando possível.
- Agrupe classes relacionadas em **pastas** ou **módulos**.
- **Documente as classes** e métodos com comentários claros.

---

## Como identificar quando usar classes em Dart e qual a importância?

Use classes quando:
- Você estiver modelando entidades (ex: Pessoa, Produto, Conta).
- Quiser reutilizar código com herança ou composição.
- Precisar manter estado e comportamento juntos.

**Importância**:
- Estrutura o código de forma mais próxima da lógica do mundo real.
- Facilita testes, manutenção, extensão e legibilidade.

## Parâmetros Posicionais e Nomeados em Dart

Em Dart, os parâmetros de funções e construtores podem ser definidos de duas formas principais: **posicionais** e **nomeados**.

---

### 🔹 Parâmetros Posicionais

- São passados **na ordem exata** em que foram definidos.
- Podem ser **obrigatórios** ou **opcionais** (quando colocados entre colchetes `[]`).

```dart
void saudacao(String nome, [String? saudacao]) {
  print("${saudacao ?? 'Olá'}, $nome!");
}

saudacao("João"); // Olá, João!
saudacao("Ana", "Bem-vinda"); // Bem-vinda, Ana!
```

---

### 🔹 Parâmetros Nomeados

- São definidos entre **chaves** `{}`.
- Podem ser **obrigatórios** (com `required`) ou ter **valores padrão**.
- A vantagem é que **não precisam seguir ordem**, aumentando a clareza.

```dart
void cadastrar({required String nome, int idade = 18}) {
  print("Nome: $nome, Idade: $idade");
}

cadastrar(nome: "Lucas"); // Nome: Lucas, Idade: 18
cadastrar(nome: "Maria", idade: 25); // Nome: Maria, Idade: 25
```

---

### 📌 Quando usar cada um?

- **Posicional**: útil quando a ordem é clara e os parâmetros são poucos.
- **Nomeado**: ideal para muitos parâmetros, para maior **clareza** e **flexibilidade**.

## Exemplo com Parâmetros Posicionais em Classes

```dart
class Produto {
  String nome;
  double preco;

  // Construtor com parâmetros posicionais
  Produto(this.nome, this.preco);

  void exibirInfo() {
    print("Produto: $nome | Preço: R\$ $preco");
  }
}

void main() {
  var produto = Produto("Notebook", 3500.00);
  produto.exibirInfo(); // Produto: Notebook | Preço: R$ 3500.0
}
```

🔹 **Vantagem**: mais simples para objetos com poucos atributos.  
🔸 **Cuidado**: a ordem dos argumentos precisa ser respeitada.

---

## Exemplo com Parâmetros Nomeados em Classes

```dart
class Usuario {
  String nome;
  int idade;
  String email;

  // Construtor com parâmetros nomeados
  Usuario({required this.nome, required this.idade, required this.email});

  void exibirPerfil() {
    print("Nome: $nome\nIdade: $idade\nEmail: $email");
  }
}

void main() {
  var user = Usuario(nome: "Alice", idade: 30, email: "alice@email.com");
  user.exibirPerfil();
}
```

🔹 **Vantagem**: muito mais claro e flexível, especialmente com muitos atributos.  
🔸 **Boa prática**: sempre usar `required` para atributos obrigatórios e definir valores padrão quando possível.

---

## Dica Extra: Combinar Nomeados com Padrão

```dart
class Mensagem {
  String texto;
  bool urgente;

  Mensagem({required this.texto, this.urgente = false});

  void enviar() {
    if (urgente) {
      print("🚨 URGENTE: $texto");
    } else {
      print("Mensagem: $texto");
    }
  }
}

void main() {
  var msg1 = Mensagem(texto: "Reunião às 10h");
  var msg2 = Mensagem(texto: "Servidor fora do ar", urgente: true);

  msg1.enviar();
  msg2.enviar();
}
```