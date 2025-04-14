# Notas do Aluno
Achei muito interessante o tópico sobre a organização de exceptions. 
Onde é possível criar um arquivo "exceptions.dart" e colocar todas as exceptions dentro dela.
# Erros, Exceções e Tratamento em Dart

---

## Qual a diferença entre um erro e uma exceção em Dart?

- **Erro (`Error`)**: representa problemas **graves** que normalmente não deveriam ser tratados pelo seu código. Ex: `StackOverflowError`, `OutOfMemoryError`.
- **Exceção (`Exception`)**: representa condições **esperadas** ou **recuperáveis** em tempo de execução. Ex: falha ao acessar um arquivo, dividir por zero.

```dart
throw Exception('Algo deu errado'); // Exceção tratável
throw RangeError('Erro de faixa');  // Erro mais crítico
```

---

## Quando devo esperar um erro e quando devo esperar uma exceção?

- **Exceções**: Esperadas em situações do dia a dia de um programa:
    - Falha de rede
    - Arquivo não encontrado
    - Conversão de tipo inválida

- **Erros**: Relacionados ao próprio sistema ou bugs de programação:
    - Estouro de pilha
    - Falta de memória
    - Acesso indevido a listas

---

## O que fazem os blocos `try`, `catch` e `finally` em Dart?

- `try`: Tenta executar um bloco de código que pode gerar uma exceção.
- `catch`: Captura e lida com exceções lançadas no bloco `try`.
- `finally`: Sempre é executado, **com ou sem erro**, ideal para limpeza de recursos.

```dart
try {
  int resultado = 10 ~/ 0;
} catch (e) {
  print('Erro: $e');
} finally {
  print('Execução finalizada');
}
```

---

## Como capturar diferentes tipos de exceções usando `catch`?

Você pode capturar tipos específicos com `on`, ou capturar a exceção e a stack trace com `catch`.

```dart
try {
  throw FormatException('Formato inválido');
} on FormatException catch (e) {
  print('Erro de formato: ${e.message}');
} catch (e, stack) {
  print('Erro genérico: $e');
  print('Stack trace: $stack');
}
```

---

## Quando usar o bloco `finally`?

Use `finally` para:
- Fechar arquivos
- Encerrar conexões
- Liberar recursos
- Exibir mensagens finais

```dart
try {
  abrirArquivo();
} catch (e) {
  print('Erro ao abrir');
} finally {
  fecharArquivo(); // sempre será executado
}
```

---

## Por que lançar uma exceção?

Você pode lançar uma exceção para:
- Interromper o fluxo normal quando algo inesperado acontece
- Informar que uma função não pôde completar sua tarefa
- Impedir que o programa continue com dados inválidos

```dart
void processarIdade(int idade) {
  if (idade < 0) throw Exception("Idade inválida: $idade");
}
```

---

## Como personalizar mensagens de erro ao lançar exceções?

Você pode criar suas próprias exceções com mensagens personalizadas:

```dart
class MinhaExcecao implements Exception {
  final String mensagem;
  MinhaExcecao(this.mensagem);

  @override
  String toString() => "MinhaExcecao: $mensagem";
}

throw MinhaExcecao('Erro personalizado');
```

---

## Melhores práticas ao lançar exceções

- **Lance exceções significativas** (com mensagens claras).
- **Use tipos personalizados** quando fizer sentido.
- **Evite lançar exceções para controle de fluxo comum**.
- **Documente os métodos que podem lançar exceções.**

---

## Diferença entre `assert` e lançar exceções

| Característica     | `assert`                     | Exceções (`throw`)              |
|--------------------|------------------------------|----------------------------------|
| Uso principal       | Verificações de desenvolvimento | Fluxo de execução / runtime       |
| Ativado em         | Apenas em modo debug         | Sempre                           |
| Continua execução? | Sim, se a condição for verdadeira | Não, interrompe com erro         |

```dart
assert(valor != null); // Só funciona no modo debug
```

---

## Quando o `assert` é mais útil?

- Durante o **desenvolvimento** para testar condições que devem sempre ser verdadeiras.
- Em testes e validações internas.
- **Não use em produção**, pois pode ser desativado.

```dart
assert(lista.isNotEmpty); // Verifica se a lista não está vazia
```

---

## Como organizar exceções no projeto

- Crie um arquivo `exceptions.dart` com classes customizadas.
- Separe exceções por domínio: `LoginException`, `FileException`, etc.
- Use boas mensagens e documentações para cada exceção.

```dart
// exceptions.dart
class LoginException implements Exception {
  final String mensagem;
  LoginException(this.mensagem);
}
```

---

## Como erros e exceções afetam a execução do programa?

- **Erros** normalmente causam **crashes** e **não devem ser tratados** na maioria dos casos.
- **Exceções** podem ser **tratadas e recuperadas**, permitindo que o app continue funcionando.

### Exemplo com exceção tratável:
```dart
try {
  int resultado = int.parse("abc");
} catch (e) {
  print("Não foi possível converter");
}
```

### Exemplo com erro que encerra o programa:
```dart
List<int> lista = [1, 2, 3];
print(lista[10]); // RangeError
```
  