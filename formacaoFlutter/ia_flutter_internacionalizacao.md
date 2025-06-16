Notas do aluno
---
A IA ajudou a entender a importância da internacionalização, como fazê-la e dicas gerais.

### O que é internacionalização e qual sua importância?

**Internacionalização (i18n)** é o processo de preparar um aplicativo para que ele possa ser facilmente traduzido e adaptado a diferentes idiomas e culturas, sem alterar o código-fonte principal.

**Importância:**

* Aumenta o alcance do app para públicos globais;
* Melhora a experiência do usuário em diferentes regiões;
* Garante flexibilidade para adaptar textos, formatos de data, moeda e leitura (ex: da esquerda para a direita ou vice-versa).

---

### Como funciona a internacionalização no Flutter?

No Flutter, a internacionalização é feita com o pacote `intl`, em conjunto com arquivos de tradução `.arb` (Application Resource Bundle).
O processo envolve:

1. Configurar o `MaterialApp` com `localizationsDelegates` e `supportedLocales`;
2. Criar arquivos `.arb` com os textos traduzidos;
3. Usar funções de localização para carregar o texto no idioma correto;
4. Gerar as classes `.dart` correspondentes com o comando do Flutter.

---

### Quais as dicas de uso dos arquivos ARB?

Os arquivos `.arb` são arquivos JSON que contêm os textos traduzidos para cada idioma. Exemplo:

`lib/l10n/intl_en.arb`

```json
{
  "title": "Register",
  "nameField": "Name",
  "submitButton": "Submit"
}
```

`lib/l10n/intl_pt.arb`

```json
{
  "title": "Cadastro",
  "nameField": "Nome",
  "submitButton": "Enviar"
}
```

**Dicas:**

* Use nomes de chave descritivos e consistentes;
* Mantenha comentários com `"@key"` para ajudar tradutores;
* Nunca use textos "fixos" no código. Sempre use chaves de localização.

---

### Quais cuidados devo ter ao usar o `intl`?

* Sempre gere os arquivos `.dart` após editar os `.arb` com o comando:

  ```bash
  flutter gen-l10n
  ```
* Evite duplicação de chaves;
* Mantenha os arquivos `.arb` organizados na pasta `lib/l10n`;
* Verifique se o idioma do dispositivo está suportado no app;
* Cuide de traduções com plural, gênero e interpolação.

---

### Como posso adicionar suporte para diferentes idiomas em meu aplicativo Flutter?

1. **Ative o suporte a localizações:**

No `pubspec.yaml`:

```yaml
flutter:
  generate: true
  assets:
    - assets/
```

2. **Adicione os arquivos `.arb` em `lib/l10n/`**

3. **Configure o `MaterialApp`:**

```dart
MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  locale: Locale('pt'), // ou use LocaleSettings com pacote de localização
  home: MinhaTela(),
);
```

4. **Use as traduções:**

```dart
Text(AppLocalizations.of(context)!.title);
```

---

### Mostre o exemplo de um formulário de cadastro usando internacionalização

**Exemplo (usando tradução via `intl`):**

```dart
Column(
  children: [
    Text(AppLocalizations.of(context)!.title), // "Cadastro"
    TextFormField(
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.nameField, // "Nome"
      ),
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text(AppLocalizations.of(context)!.submitButton), // "Enviar"
    )
  ],
)
```

Com os `.arb`:

**intl\_pt.arb**

```json
{
  "title": "Cadastro",
  "nameField": "Nome",
  "submitButton": "Enviar"
}
```

**intl\_en.arb**

```json
{
  "title": "Register",
  "nameField": "Name",
  "submitButton": "Submit"
}
```

---

### Como posso lidar com diferentes formatos de data, hora e moeda em diferentes idiomas?

Use o pacote `intl` com as classes `DateFormat` e `NumberFormat`:

```dart
import 'package:intl/intl.dart';

// Data no formato local:
final dataFormatada = DateFormat.yMMMd('pt_BR').format(DateTime.now());

// Hora:
final hora = DateFormat.Hm('pt_BR').format(DateTime.now());

// Moeda:
final preco = NumberFormat.simpleCurrency(locale: 'pt_BR').format(1234.5);
```

**Dicas:**

* Use `intl` com locale explícito para consistência;
* Sempre use `DateTime` e `double` como base, e formate para a exibição.
