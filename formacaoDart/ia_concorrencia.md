# Notas do Aluno
A IA entregou um conteúdo muito bom que ajudou a sintetizar o conteúdo das aulas
# Trabalhando com Futures e Assíncrono em Dart

---

## 🚀 O que é um Future em Dart e como ele me ajuda a lidar com tarefas que levam tempo?

Um **Future** representa o resultado de uma operação assíncrona que **pode estar disponível agora, no futuro, ou nunca
**.  
Ele é usado para tarefas que levam tempo, como requisições de rede, leitura de arquivos ou delays.

```dart
Future<String> buscarDados() async {
  return "Dados recebidos!";
}
```

---

## ⏳ O que significam os termos 'assíncrono' e 'síncrono'?

- **Síncrono:** o código é executado **passo a passo**, cada linha espera a anterior terminar.
- **Assíncrono:** o código **não espera**; tarefas demoram para completar, mas o programa continua executando outras
  coisas.

---

## ⚠️ O que acontece se um Future falhar e como posso lidar com esse erro?

Se um Future falha, ele gera uma **exceção**.  
Você pode capturá-la usando `try-catch` ou métodos como `catchError`.

```dart
try {
await minhaFuncao();
} catch (e) {
print("Erro: $e");
}
```

---

## 🧩 Existe uma forma de executar várias tarefas assíncronas em paralelo?

Sim! Você pode usar `Future.wait` para aguardar várias tarefas ao mesmo tempo:

```dart
await
Future.wait
([tarefa1(),
tarefa2(),
tarefa3(),
]
);
```

---

## 🛠️ Em quais situações devo usar Futures em meu código Dart?

- Acesso a banco de dados.
- Requisições HTTP.
- Leitura/escrita de arquivos.
- Operações que envolvam espera (delays, animações, etc).

---

## ⚡ Cuidados ao não usar `await` em funções Future

Se você esquecer de usar `await`, o código pode:

- Não esperar o Future terminar.
- Ter comportamentos inesperados.
- Ignorar erros que deveriam ser tratados.

```dart
// Sem await: não espera terminar
buscarDados();

// Com await: espera terminar antes de prosseguir
await buscarDados();
```

---

## 🛡️ Como lidar com erros usando Future?

- Usando `try-catch` com `await`.
- Usando `.catchError()` diretamente no Future.

```dart
minhaFuncao
().catchError
(
(e) {
print("Erro capturado: $e");
});
```

---

## 🎯 De quais formas posso esperar que um Future seja concluído e obter o resultado?

- Usando `await` em funções `async`.
- Usando `.then()` encadeado ao Future.

```dart
// Com await
var resultado = await

buscarDados();

// Com then
buscarDados
().then
(
(resultado) {
print(resultado);
});
```

---

## 🧪 Como simular um erro em um Future usando `Future.error`?

```dart
Future<String> simularErro() {
  return Future.error("Algo deu errado!");
}
```

---

## ⏱️ Como criar uma função que retorna um Future simulando uma demora?

Use `Future.delayed`:

```dart
Future<String> tarefaDemorada() {
  return Future.delayed(Duration(seconds: 3), () => "Tarefa concluída!");
}
```
