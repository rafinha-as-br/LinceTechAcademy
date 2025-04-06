# Notas do Aluno
A IA, como sempre, desenvolvendo muito bem sobre os tópicos, porém, desta vez
optei por adicionar um tópico extra que senti que estava faltando nos tópicos já
fornecidos pelo curso: Boas práticas com os operadores ?? e ?: 

# Operadores, Tipos e Boas Práticas em Dart

## Comparando Valores de Tipos Diferentes com Operadores Relacionais

Se você comparar valores de tipos diferentes (ex: `int` com `String`) usando operadores como `>`, `<`, `==`, Dart lança um erro de tempo de execução:

```dart
print(5 > "5"); // Erro: tipo incompatível
```

**Evite comparar tipos diferentes**, a não ser que você garanta que são compatíveis.

---

## Diferença entre os Operadores '/' e '~/'

- `/` realiza **divisão com ponto flutuante**:
  ```dart
  print(10 / 3); // 3.333...
  ```

- `~/` realiza **divisão inteira** (descarta as casas decimais):
  ```dart
  print(10 ~/ 3); // 3
  ```

---

## Como Verificar o Tipo de uma Variável

Use os operadores `is` e `is!`:

```dart
var nome = "Dart";
print(nome is String); // true
print(nome is! int); // true
```

---

## Função do Operador `?` em Testes de Tipo

O operador `?` pode ser usado em diferentes contextos em Dart:
- **Tipos anuláveis:** `String? nome;`
- **Acesso condicional a membros:** `usuario?.nome`
- **Operador ternário:** `condição ? valor1 : valor2`

**Exemplo (acesso condicional):**
```dart
usuario?.nome // só acessa nome se usuário não for null
```

---

## Quando Usar Parâmetros Opcionais e Requeridos

- **Opcionais:** quando um valor tem um default.
- **Requeridos:** quando a função precisa daquele valor para funcionar corretamente.

```dart
void mostrar({required String nome, int idade = 18}) {
  print("$nome tem $idade anos");
}
```

---

## Operadores de Atribuição Compostos

| Operador | Exemplo     | Equivalente     |
|----------|-------------|-----------------|
| `+=`     | `a += b`    | `a = a + b`     |
| `-=`     | `a -= b`    | `a = a - b`     |
| `*=`     | `a *= b`    | `a = a * b`     |
| `/=`     | `a /= b`    | `a = a / b`     |
| `%=`     | `a %= b`    | `a = a % b`     |

---

## Usando `&&` e `||` para Combinar Condições

- `&&` (E lógico): todas as condições precisam ser verdadeiras.
- `||` (OU lógico): basta uma ser verdadeira.

```dart
if (idade > 18 && temCNH) {
print("Pode dirigir");
}

if (chovendo || nublado) {
print("Leve guarda-chuva");
}
```

---

## Diferença entre `if-else` e Expressões Condicionais

- `if-else`: estrutura comum de controle de fluxo.
- Ternário: condicional em linha (mais concisa).

```dart
// if-else
if (idade >= 18) {
  print("Adulto");
} else {
  print("Menor de idade");
}

// ternário
print(idade >= 18 ? "Adulto" : "Menor de idade");
```

**Evite ternários muito complexos — isso compromete a legibilidade.**

---

## Notação em Cascata: Quando Usar?

- Ideal quando você precisa configurar um objeto com várias chamadas de métodos.

```dart
var buffer = StringBuffer()
  ..write("Olá ")
  ..write("Mundo!")
  ..write("!!!");
```

---

## Diferença entre Notação em Cascata e Chamadas Separadas

```dart
// Notação em cascata
final pessoa = Pessoa()
  ..nome = "João"
  ..idade = 25
  ..andar();

// Sem cascata
final pessoa = Pessoa();
pessoa.nome = "João";
pessoa.idade = 25;
pessoa.andar();
```

**Cascata é mais concisa, mas só deve ser usada com objetos modificáveis.**

---

## Notação em Cascata com Teste de Tipo

```dart
void processar(objeto) {
  if (objeto is Pessoa) {
    objeto
      ..andar()
      ..falar();
  }
}
```

---

## Documentação dos Operadores (Resumo)

- Relacionais: `==`, `!=`, `>`, `<`, `>=`, `<=`
- Lógicos: `&&`, `||`, `!`
- Aritméticos: `+`, `-`, `*`, `/`, `~/`, `%`
- Atribuição composta: `+=`, `-=`, etc.
- Condicional: `condição ? valor1 : valor2`
- Tipo: `is`, `is!`, `as`

Documentação oficial: [https://dart.dev/language/operators](https://dart.dev/language/operators)

---

## Exemplos de Mau Uso do Ternário

```dart
// Muito longo e confuso
var resultado = condicao1 ? (condicao2 ? "A" : "B") : (condicao3 ? "C" : "D");

// Melhor com if-else
if (condicao1) {
  if (condicao2) {
    resultado = "A";
  } else {
    resultado = "B";
  }
} else {
  resultado = condicao3 ? "C" : "D";
}
```

---

## Como Evitar Problemas com Operadores Lógicos

1. **Sempre verifique `null` antes de usar `.`**
2. **Agrupe condições com parênteses para garantir ordem correta**
3. **Evite duplicar lógica — extraia funções para condições complexas**

```dart
if (usuario != null && usuario.idade > 18) {
  print("Aprovado");
}
```

---

# Tópicos Extras

## Boas Práticas com Operadores `??` e `? :`

### Operador `??` (Null-aware operator)

Esse operador retorna o **primeiro operando não nulo**.

```dart
String? nome;
String saudacao = nome ?? "Visitante";
print(saudacao); // Visitante
```

**Boas práticas:**
- Use `??` para fornecer valores padrão seguros.
- Evite encadeamentos longos e confusos com `??`.

### Operador `? :` (Ternário condicional)

Este é o operador condicional ternário, que retorna `expr1` se `condição` for verdadeira e `expr2` se for falsa:

```dart
int idade = 20;
String status = idade >= 18 ? "Adulto" : "Menor";
```

**Boas práticas:**
- Use o ternário para expressar condições simples.
- Evite aninhamentos múltiplos que prejudiquem a clareza do código.
- Prefira `if-else` quando houver múltiplas verificações.

**Evite isso:**
```dart
String cor = tema == "escuro"
  ? escuro != null ? escuro : "cinza"
  : claro != null ? claro : "branco"; // confuso
```

**Prefira algo mais claro:**
```dart
String cor;
if (tema == "escuro") {
  cor = escuro ?? "cinza";
} else {
  cor = claro ?? "branco";
}
```

Esses operadores são muito úteis quando usados com moderação e clareza!

