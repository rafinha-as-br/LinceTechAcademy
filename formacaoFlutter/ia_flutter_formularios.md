
### Notas do aluno

Os conteúdos apresentados pela IA foram muito úteis na hora de realizar a lista de atividades.
### O que é um widget TextField em Flutter e para que ele serve?

O `TextField` é um widget do Flutter usado para entrada de texto pelo usuário. Ele é uma das formas mais básicas de capturar dados, como nomes, senhas, e-mails, entre outros. Pode ser personalizado com estilos, ícones, tipo de teclado e validações.

---

### Como posso obter o valor digitado pelo usuário em um TextField?

Para obter o valor digitado, usamos um `TextEditingController`. Exemplo:

```dart
final controller = TextEditingController();

// Atribuir ao TextField:
TextField(controller: controller)

// Depois, acessar o valor:
print(controller.text);
```

---

### Qual a diferença entre um TextField e um TextFormField?

* **TextField**: usado para entrada simples de texto.
* **TextFormField**: versão mais completa, ideal para formulários. Permite uso direto com validações e integração com o `Form`.

Use `TextFormField` quando estiver criando formulários com validação.

---

### Quais parâmetros importantes do TextField?

Alguns parâmetros comuns e úteis:

* `controller`: para controlar e acessar o texto.
* `decoration`: para adicionar ícones, labels, dicas (hints).
* `keyboardType`: tipo de teclado (texto, número, email, etc).
* `obscureText`: para esconder texto (ex: senhas).
* `maxLength`: limita o número de caracteres.
* `onChanged`: escuta mudanças em tempo real.

---

### O que significa validar um campo de texto em Flutter?

Validar significa verificar se o conteúdo do campo atende a alguma regra (ex: não vazio, e-mail válido). Isso ajuda a garantir que os dados inseridos estão corretos antes de continuar.

---

### Qual a diferença entre validação síncrona e assíncrona?

* **Validação síncrona**: ocorre imediatamente, sem esperar por nada externo. Ex: verificar se um campo está vazio.
* **Validação assíncrona**: envolve aguardar uma resposta externa, como uma consulta a um banco de dados ou API. Ex: verificar se um nome de usuário já existe.

---

### O que é um widget CheckBox em Flutter e para que ele serve?

`Checkbox` é um widget que permite selecionar ou desmarcar uma opção (ligado/desligado). Ele é usado para escolhas booleanas, como "aceita os termos e condições".

---

### Como posso alterar a cor e a forma de um CheckBox?

Use os parâmetros:

* `activeColor`: muda a cor quando selecionado.
* `checkColor`: cor do ícone de check.
* Para forma, combine com `ThemeData` e `CheckboxTheme` (forma personalizada exige customização com `MaterialStateProperty`).

---

### O que é um widget Radio em Flutter e qual sua aplicabilidade?

O `Radio` é usado quando o usuário precisa escolher **apenas uma** opção entre várias. Por exemplo: escolher um gênero, um plano, uma preferência única.

---

### Como posso alterar a cor e a forma de um Rádio?

Use os parâmetros:

* `activeColor`: muda a cor quando selecionado.
* `fillColor`: para personalizar a aparência.
* Para forma, use `RadioTheme` para aplicar estilos personalizados ao grupo de botões de rádio.

---

### Como posso limitar o número de caracteres que o usuário pode digitar em um TextField?

Use o parâmetro `maxLength`:

```dart
TextField(maxLength: 20)
```

---

### Como posso alterar o tipo de teclado exibido para um TextField (numérico, email etc.)?

Use o parâmetro `keyboardType`:

```dart
TextField(keyboardType: TextInputType.emailAddress)
```

Outros exemplos:

* `TextInputType.number`
* `TextInputType.phone`
* `TextInputType.text`

---

### Como posso adicionar um ícone ao lado do texto em um TextField?

Use `InputDecoration` com `prefixIcon` ou `suffixIcon`:

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Usuário',
    prefixIcon: Icon(Icons.person),
  ),
)
```

---

### Como posso exibir mensagens de erro para o usuário se a validação falhar?

Use `TextFormField` com um `Form` e o parâmetro `validator`:

```dart
TextFormField(
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  },
)
```

Para exibir a mensagem, você deve envolver os campos em um widget `Form` e usar uma `GlobalKey` para validar.

---

### Crie um formulário com um CheckBox para 'Aceitar termos e condições'.

```dart
bool aceitaTermos = false;

CheckboxListTile(
  title: Text('Aceitar termos e condições'),
  value: aceitaTermos,
  onChanged: (bool? valor) {
    setState(() {
      aceitaTermos = valor ?? false;
    });
  },
)
```

---

### Crie um grupo de Radios para permitir que o usuário selecione sua preferência (Aceita ketchup: Não, Sim).

```dart
String? aceitaKetchup;

Column(
  children: [
    Text('Aceita ketchup?'),
    RadioListTile(
      title: Text('Sim'),
      value: 'sim',
      groupValue: aceitaKetchup,
      onChanged: (value) {
        setState(() {
          aceitaKetchup = value;
        });
      },
    ),
    RadioListTile(
      title: Text('Não'),
      value: 'nao',
      groupValue: aceitaKetchup,
      onChanged: (value) {
        setState(() {
          aceitaKetchup = value;
        });
      },
    ),
  ],
)
```

---

### Como posso verificar se o texto digitado em um campo é um email válido?

Você pode usar uma expressão regular (regex):

```dart
bool emailValido(String email) {
  final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return regex.hasMatch(email);
}
```

Em um `validator`:

```dart
validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Digite um e-mail';
  } else if (!emailValido(value)) {
    return 'E-mail inválido';
  }
  return null;
}
```
