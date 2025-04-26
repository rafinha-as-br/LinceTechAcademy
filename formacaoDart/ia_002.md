
# Notas do Aluno
A IA apresentou um sólido conteúdo, que combinado com uma rápida organização
solicitada a ela, deixa tudo ainda mais sintetizado!
# Herança, Abstração, Getters, Setters, Interfaces e Métodos em Dart

---

## 🔁 Herança e Sobrescrita de Métodos

### O que significa "sobrescrever" um método em Dart e por que eu faria isso?

Sobrescrever (override) significa fornecer uma nova implementação de um método herdado da classe pai, para personalizar o comportamento na classe filha.

```dart
class Animal {
  void fazerSom() {
    print("Som genérico");
  }
}

class Cachorro extends Animal {
  @override
  void fazerSom() {
    print("Latido");
  }
}
```

---

### Como chamar o método original da classe pai em um método sobrescrito?

Use a palavra-chave `super` para chamar o método original da classe pai.

```dart
class Gato extends Animal {
  @override
  void fazerSom() {
    super.fazerSom();
    print("Miau");
  }
}
```

---

### Como sobrescrever um método da classe pai na classe filha?

Basta usar `@override` antes do método:

```dart
class Pai {
  void falar() => print("Olá");
}

class Filho extends Pai {
  @override
  void falar() => print("Oi pai!");
}
```

---

## 🧱 Abstração, Classes e Interfaces

### O que é uma classe abstrata?

É uma classe que **não pode ser instanciada diretamente** e serve como molde para outras classes.

```dart
abstract class Forma {
  void desenhar(); // Método abstrato
}
```

---

### Quando usar classes abstratas?

- Para **forçar subclasses** a implementarem certos métodos.
- Para criar uma **estrutura base comum** para várias classes.

---

### O que é herança em Dart?

Permite que uma classe herde atributos e métodos de outra.

```dart
class Cavalo extends Animal {} // herda métodos e atributos de Animal
```

---

### Diferença entre herança e composição

| Conceito   | Herança ("é um")                 | Composição ("tem um")             |
|------------|-----------------------------------|-----------------------------------|
| Exemplo    | Cachorro é um Animal             | Carro tem um Motor               |
| Vantagem   | Reutilização de código direto    | Maior flexibilidade e desacoplamento |

---

### O que é uma interface?

Um contrato de comportamento que classes podem seguir usando `implements`.

```dart
class Enviavel {
  void enviar();
}

class Email implements Enviavel {
  @override
  void enviar() {
    print("Enviando email");
  }
}
```

---

### Diferença entre herança e implementação de interface

| Aspecto                    | Herança (`extends`)         | Interface (`implements`)      |
|------------------------------|------------------------------|-------------------------------|
| Herda código?                | Sim                          | Não                           |
| Necessita sobrescrever tudo? | Não                          | Sim                           |
| Permite múltiplas heranças?  | Não                          | Sim                           |

---

## ⚙️ Métodos Estáticos e Instância

### O que são métodos estáticos?

Métodos que pertencem à classe, não a uma instância específica.

```dart
class Calculadora {
  static int somar(int a, int b) => a + b;
}
```

---

### Quando usar métodos estáticos?

- Para utilitários ou operações que **não dependem de atributos de instância**.
- Ex: Validações, cálculos simples.

---

### Como acessar um método estático?

Chame diretamente pela classe:

```dart
Calculadora.somar(2, 3);
```

---

### Diferença entre métodos estáticos e de instância

| Tipo             | Estático                     | De Instância                    |
|------------------|------------------------------|----------------------------------|
| Chamado por      | Classe                       | Objeto                          |
| Acesso a atributos da classe | Somente atributos estáticos | Atributos normais              |
| Uso              | Utilitários, ferramentas     | Comportamento específico do objeto |

---

## 🔒 Getters e Setters

### Como criar um getter para acessar um atributo privado?

```dart
class Produto {
  double _preco;

  Produto(this._preco);

  double get preco => _preco;
}
```

---

### Como criar um setter com validação?

```dart
class Conta {
  double _saldo = 0;

  double get saldo => _saldo;

  set saldo(double valor) {
    if (valor >= 0) {
      _saldo = valor;
    } else {
      print("Valor inválido");
    }
  }
}
```

---

### Quando usar getters e setters?

- Para adicionar **validação**.
- Para controlar o **acesso seguro** aos dados internos da classe.

Evite acesso direto se precisar validar, calcular ou proteger dados.

---

## 🧾 Enumeradores (enums)

### O que são enumeradores (enums)?

São listas de valores constantes e nomeados.

```dart
enum Status { pendente, aprovado, rejeitado }
```

---

### Quando usar enums em vez de constantes?

- Quando há um **conjunto fixo de opções**.
- Para deixar o código mais **organizado e legível**.
