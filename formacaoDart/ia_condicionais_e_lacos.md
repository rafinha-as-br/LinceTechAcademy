
# Notas do Aluno
Mais uma vez a IA mostra grandes resultados, onde, sem erros mostrou as diferenças entre
os diferentes tipos de laços de repetição e de condicionais.


# Controle de Fluxo e Laços de Repetição em Dart

---

## Diferença entre `if`, `else if` e `else`

- `if`: executa o bloco se a condição for verdadeira.
- `else if`: usado para testar uma nova condição caso o `if` seja falso.
- `else`: executa se nenhuma das condições anteriores for verdadeira.

```dart
int idade = 20;

if (idade < 13) {
  print("Criança");
} else if (idade < 18) {
  print("Adolescente");
} else {
  print("Adulto");
}
```

---

## Cuidados com `if` e `else`

- **Evite muitas condições aninhadas** – isso dificulta a leitura.
- **Use parênteses** para garantir a ordem correta das comparações.
- **Prefira `switch`** quando houver muitas comparações com o mesmo valor.

---

## Importância do `break` em um `switch case`

O `break` impede que a execução continue para os próximos casos após um `case` ser executado.

```dart
switch (comando) {
  case "iniciar":
    print("Iniciando...");
    break;
  case "parar":
    print("Parando...");
    break;
}
```

Sem `break`, todos os `case` seguintes seriam executados, causando comportamento indesejado.

---

## Quando usar `switch` em vez de `if else`

- Quando você está comparando **um valor fixo contra várias possibilidades**.
- Mais **legível** e **eficiente** em alguns casos.

```dart
String dia = "segunda";

switch (dia) {
  case "segunda":
    print("Começo da semana");
    break;
  case "sexta":
    print("Fim da semana");
    break;
  default:
    print("Dia qualquer");
}
```

---

## Diferença entre `for` tradicional e `for...in`

- `for` tradicional: usado quando você precisa do **índice** ou controlar a iteração manualmente.
- `for...in`: mais legível para iterar **sobre coleções**.

```dart
// for tradicional
for (int i = 0; i < lista.length; i++) {
  print(lista[i]);
}

// for-in
for (var item in lista) {
  print(item);
}
```

---

## Como repetir um bloco de código um número específico de vezes

Use um `for` tradicional:

```dart
for (int i = 0; i < 5; i++) {
  print("Executando $i");
}
```

---

## Riscos de usar `while` sem condição de parada adequada

- Pode gerar **loop infinito**.
- Pode travar a aplicação.
- Causa uso excessivo de memória ou CPU.

```dart
while (true) {
  print("Isso nunca vai parar..."); // ⚠️
}
```

---

## Quando usar `for` e quando usar `while`

- Use `for` quando **sabe quantas vezes** quer repetir algo.
- Use `while` quando **não sabe quantas vezes**, mas há uma **condição a ser satisfeita**.

```dart
// for: quantidade fixa
for (int i = 0; i < 10; i++) {
  print(i);
}

// while: depende de condição
while (!arquivo.eof()) {
  print(arquivo.readLine());
}
```

---

## Diferença entre `break` e `continue`

- `break`: **interrompe completamente** o loop.
- `continue`: **pula a iteração atual** e segue para a próxima.

```dart
for (int i = 0; i < 5; i++) {
  if (i == 3) break;    // para tudo quando i == 3
  print(i);
}

for (int i = 0; i < 5; i++) {
  if (i == 3) continue; // pula o 3
  print(i);
}
```

---

## Usar `break` para sair de um loop aninhado

Use um `label` para sair de loops externos:

```dart
externo:
for (int i = 0; i < 3; i++) {
  for (int j = 0; j < 3; j++) {
    if (i == 1 && j == 1) break externo;
    print("$i $j");
  }
}
```

---

## Situações úteis para usar `continue`

- Quando você quer **pular** elementos que não atendem a uma condição.

```dart
for (var item in lista) {
  if (item.isEmpty) continue; // pula vazios
  print(item);
}
```

---

## Usar `while` para ler dados de um arquivo

```dart
import 'dart:io';

void main() {
  final file = File('dados.txt');
  final lines = file.openRead().transform(utf8.decoder).transform(LineSplitter());

  lines.listen((linha) {
    print("Linha: $linha");
  });
}
```

---

## Usar `switch` com Strings

O `switch` em Dart funciona com `String`:

```dart
String comando = "sair";

switch (comando) {
  case "iniciar":
    print("Iniciando");
    break;
  case "sair":
    print("Saindo");
    break;
  default:
    print("Comando desconhecido");
}
```

---

## Como organizar o código com `if`, `else if` e `else`

**Boas práticas:**
- Evite aninhamentos profundos.
- Extraia blocos em funções quando possível.
- Comente blocos complexos para ajudar na leitura.
- Utilize `early return` quando fizer sentido:

```dart
void verificarUsuario(String? nome) {
  if (nome == null) {
    print("Nome não pode ser nulo");
    return;
  }

  if (nome.length < 3) {
    print("Nome muito curto");
    return;
  }

  print("Nome válido: $nome");
}
```
