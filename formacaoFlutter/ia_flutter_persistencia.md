### Notas do aluno

---

### O que é persistência de dados em aplicativos Flutter e por que é importante?

Persistência de dados é a capacidade de **gravar informações de forma permanente** (ou semi-permanente) para que continuem disponíveis depois que o app é fechado.
Sem persistência, quaisquer preferências, sessões ou listas criadas pelo usuário se perderiam a cada reinício, comprometendo a experiência e a usabilidade.

---

### Quais são os diferentes tipos de dados que podem ser persistidos em um aplicativo Flutter?

| Tipo de dado                            | Exemplos típicos                             | Tecnologias mais comuns                       |
| --------------------------------------- | -------------------------------------------- | --------------------------------------------- |
| **Chave-valor simples**                 | Tema, login remember-me, flags de onboarding | `SharedPreferences`, `flutter_secure_storage` |
| **Objetos estruturados pequenos**       | Carrinho, filtros de busca                   | `Hive`, `ObjectBox`, arquivos JSON locais     |
| **Grandes coleções ou relacionamentos** | Lista de produtos, catálogos                 | `Sqflite`, `Drift`, `Realm`, bases remotas    |
| **Dados sensíveis**                     | Tokens, senha offline                        | `flutter_secure_storage`, Keychain/Keystore   |
| **Arquivos de mídia**                   | Fotos, PDFs                                  | `path_provider` + I/O de arquivo              |

---

### O que é o pacote SharedPreferences em Flutter e como ele funciona?

`SharedPreferences` é um wrapper sobre o armazenamento de preferências nativo (iOS/Android).
Ele grava pares **String → valor simples** (int, double, bool, String, List\<String>) em arquivos XML/Plist gerenciados pelo sistema, e expõe uma API assíncrona:

```dart
final prefs = await SharedPreferences.getInstance();
await prefs.setString('nome', 'Maria');
final nome = prefs.getString('nome');
```

---

### Quais são as limitações do SharedPreferences em termos de armazenamento de dados?

* **Só tipos primitivos** – nada de objetos complexos sem serializar manualmente.
* **Sem consultas** – não é um banco; você lê pela chave inteira.
* **Tamanho reduzido** – recomendado apenas alguns KB (cada gravação reescreve o arquivo inteiro).
* **Sem criptografia** – não guarde dados sensíveis.

---

### Quando devo usar SharedPreferences em vez de outras opções de persistência de dados?

Use quando precisar de:

* Configurações simples ou flags (modo escuro, primeira vez).
* Valores únicos ou listas curtas que cabem em memória.
* Facilidade e pouca dependência – sem schema nem migrações.

Se for lista grande, relacionamentos complexos ou dados confidenciais, escolha Hive/SQLite/secure\_storage.

---

### Como posso lidar com erros ao usar SharedPreferences?

* **try-catch** qualquer chamada async: falhas de I/O, chaves inexistentes ou corrupção.
* Verifique null-safety (`prefs.getString('x') ?? ''`).
* Na primeira execução, trate a falta de chave como estado inicial.

```dart
try {
  final prefs = await SharedPreferences.getInstance();
  final valor = prefs.getInt('contador') ?? 0;
} catch (e, s) {
  debugPrint('Erro SharedPreferences: $e\n$s');
}
```

---

### Quais são as melhores práticas para usar SharedPreferences de forma eficiente?

1. **Finalize leituras antes do build** – use `FutureBuilder` ou inicialização assíncrona.
2. **Evite gravações excessivas** – agrupe mudanças (ex.: salvar a cada X segundos).
3. **Centralize o acesso** numa classe wrapper (`SettingsService`) para facilitar testes e troca futura.
4. **Mantenha chaves como constantes** para evitar typos.
5. **Limpe chaves obsoletas** em migrações.

---

### Crie um app que permita ao usuário salvar seu nome e sobrenome usando SharedPreferences e exibi-los na tela

> **Passo a passo (explicação):**

1. **Modelo**

   ```dart
   class NomeStore {
     Final String chaveNome = 'nome';
     Future<void> salvar(String nome) async { ... }
     Future<String?> ler() async { ... }
   }
   ```
2. **Tela** com dois `TextField` e botão **Salvar**.
3. No `onPressed`, chame `NomeStore.salvar('$nome $sobrenome')`.
4. No `initState`, leia o valor e coloque em um `TextEditingController` ou exibidor `Text`.
5. Envolva leituras em `FutureBuilder` para mostrar “Carregando…” enquanto busca.

> **Trecho essencial de código (resumido)**

```dart
ElevatedButton(
  child: const Text('Salvar'),
  onPressed: () async {
    await store.salvar('${_nome.text} ${_sobrenome.text}');
    setState(() {}); // força rebuild para ler de novo
  },
);
```

---

### Crie um app de lista de tarefas que salve as tarefas em SharedPreferences e as exiba na tela, mantendo as tarefas mesmo após o aplicativo ser fechado

> **Estratégia em alto nível:**

1. **Modelagem**

    * Guardar lista serializada: `prefs.setStringList('tarefas', lista);`
2. **Carregamento inicial** (`FutureBuilder` no `initState`).
3. **Adicionar tarefa**

   ```dart
   lista.add(nova); prefs.setStringList('tarefas', lista);
   ```
4. **Remover/Concluir** – atualize a lista e persista de novo.
5. **UI**

    * `ListView.builder` para mostrar itens.
    * `TextField` + FAB para inserir.
    * `Dismissible` ou `CheckboxListTile` para remover/concluir.

> **Trechos-chave (compactados)**

```dart
Future<void> _adicionar(String texto) async {
  final prefs = await SharedPreferences.getInstance();
  final tarefas = prefs.getStringList('tarefas') ?? [];
  tarefas.add(texto);
  await prefs.setStringList('tarefas', tarefas);
  setState(() {});
}
```
