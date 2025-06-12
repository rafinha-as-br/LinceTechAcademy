### Notas do aluno

---

### O que é um banco de dados SQLite e como ele funciona em Flutter?

O **SQLite** é um banco de dados relacional leve, baseado em arquivos locais, ideal para apps mobile. Em Flutter, usamos principalmente o pacote [`sqflite`](https://pub.dev/packages/sqflite) para interagir com bancos SQLite.

Ele funciona como um sistema de gerenciamento de banco que:

* Armazena dados em **arquivos locais** (no dispositivo);
* Permite **consultas SQL padrão** (`SELECT`, `INSERT`, `UPDATE`, `DELETE`);
* Suporta **tabelas, chaves primárias, relações, transações**, etc.

---

### Quais são as vantagens de usar SQLite em aplicativos Flutter?

* **Armazenamento local robusto** com suporte a dados estruturados e relacionamentos;
* **Não requer conexão com internet**;
* Ideal para **apps offline-first**;
* Suporte a **consultas SQL avançadas**;
* Alta performance para até milhares de registros.

---

### Quais são os tipos de dados básicos que posso armazenar em um banco de dados SQLite?

O SQLite é flexível e usa tipagem dinâmica baseada em colunas. Os principais tipos:

| Tipo SQLite | Aceita em Flutter como | Exemplo                    |
| ----------- | ---------------------- | -------------------------- |
| INTEGER     | `int`                  | 1, 100, -5                 |
| TEXT        | `String`               | "Olá", "2025-06-11"        |
| REAL        | `double`               | 3.14, 10.5                 |
| BLOB        | `Uint8List`            | arquivos, imagens binárias |
| NULL        | `null`                 | valores ausentes           |

---

### Como posso inserir novos registros em uma tabela SQLite usando Flutter?

```dart
await db.insert('usuarios', {
  'nome': 'Maria',
  'idade': 28,
});
```

> Use `db.insert(...)` passando o nome da tabela e um `Map<String, dynamic>`.

---

### Como posso inserir vários registros de uma vez em uma tabela SQLite?

Usando `batch`:

```dart
final batch = db.batch();
batch.insert('usuarios', {'nome': 'Ana', 'idade': 30});
batch.insert('usuarios', {'nome': 'Carlos', 'idade': 25});
await batch.commit();
```

> Isso reduz o custo de múltiplas conexões ao banco.

---

### Como posso obter o ID do último registro inserido em uma tabela SQLite?

```dart
int id = await db.insert('usuarios', {'nome': 'João'});
print('ID gerado: $id');
```

> O método `insert` retorna o ID da linha inserida (caso a tabela tenha `PRIMARY KEY AUTOINCREMENT`).

---

### Como posso filtrar os resultados de uma consulta usando a cláusula WHERE?

```dart
List<Map<String, dynamic>> resultado = await db.query(
  'usuarios',
  where: 'idade > ?',
  whereArgs: [18],
);
```

> Use `where` e `whereArgs` para evitar SQL injection.

---

### Como posso agrupar os resultados de uma consulta usando a cláusula GROUP BY?

```dart
await db.query(
  'usuarios',
  columns: ['idade', 'COUNT(*) as total'],
  groupBy: 'idade',
);
```

> Útil para contar, somar ou agrupar registros por categorias.

---

### Como posso excluir registros de uma tabela SQLite usando Flutter?

```dart
await db.delete(
  'usuarios',
  where: 'id = ?',
  whereArgs: [3],
);
```

> A função `delete()` remove com base no critério `where`.

---

### Quais os cuidados necessários ao usar UPDATE, INSERT e DELETE?

* **Sempre use `whereArgs`** para evitar SQL injection;
* **Trate erros com `try-catch`**, principalmente em updates múltiplos;
* **Evite updates sem `WHERE`**, pois isso afeta todos os registros;
* **Use transações** em operações em lote.

---

### Como posso criar tabelas relacionadas em um banco de dados SQLite?

```sql
CREATE TABLE autores (
  id INTEGER PRIMARY KEY,
  nome TEXT
);

CREATE TABLE livros (
  id INTEGER PRIMARY KEY,
  titulo TEXT,
  autor_id INTEGER,
  FOREIGN KEY(autor_id) REFERENCES autores(id)
);
```

> Cada `livro` está ligado a um `autor` via chave estrangeira.

---

### Como posso consultar dados de tabelas relacionadas usando JOIN?

```dart
await db.rawQuery('''
  SELECT livros.titulo, autores.nome
  FROM livros
  JOIN autores ON livros.autor_id = autores.id
''');
```

> O `JOIN` permite acessar dados cruzados de várias tabelas relacionadas.

---

### O que são transações em um banco de dados SQLite e por que são importantes?

Transações garantem que **múltiplas operações sejam executadas como uma unidade única**.
Se uma falhar, tudo é desfeito. Isso evita inconsistências no banco.

```dart
await db.transaction((txn) async {
  await txn.insert(...);
  await txn.update(...);
});
```

---

### Como posso reverter uma transação em caso de erro?

Basta lançar uma exceção dentro da transação:

```dart
await db.transaction((txn) async {
  await txn.insert(...);
  if (erro) throw Exception('Erro');
  await txn.update(...);
});
```

> O `sqflite` detecta a exceção e **desfaz** todas as mudanças.

---

### Quais são as vantagens de usar transações para garantir a integridade dos dados?

* Evita que operações parciais deixem dados inconsistentes;
* Garante **atomicidade** (tudo ou nada);
* Permite melhor controle de falhas.

---

### Como posso criar um banco de dados e uma tabela em SQLite usando Flutter?

```dart
final db = await openDatabase(
  'meu_banco.db',
  version: 1,
  onCreate: (db, version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY,
        nome TEXT,
        idade INTEGER
      )
    ''');
  },
);
```

> O `openDatabase` cria o arquivo `.db` e define as tabelas no `onCreate`.

---

### Dicas de como otimizar minhas consultas?

* **Use índices** (`CREATE INDEX`) para colunas com `WHERE` ou `JOIN` frequentes;
* \*\*Evite SELECT \*\*\* – selecione apenas o necessário;
* **Use `batch()`** para múltiplas operações;
* **Evite abrir o banco várias vezes** – mantenha uma instância única;
* **Analise com EXPLAIN QUERY PLAN** para consultas lentas.
