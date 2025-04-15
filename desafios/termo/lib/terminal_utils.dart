import 'dart:io';

enum Color {
  black('\x1B[30m'),
  red('\x1B[31m'),
  green('\x1B[32m'),
  yellow('\x1B[33m'),
  blue('\x1B[34m'),
  magenta('\x1B[35m'),
  cyan('\x1B[36m'),
  grey('\x1B[37m'),
  white('\x1B[38m');

  const Color(this.code);

  final String code;
}

String colorize(String text, Color color) {
  final buffer = StringBuffer();

  buffer
    ..write(color.code)
    ..write(text)
    ..write(Color.white.code);

  return buffer.toString();
}

void printColor(String text, Color color) {
  stdout
    ..write(colorize(text, color))
    ..write('\n');
}

void printRed(String text) {
  printColor(text, Color.red);
}

void printGreen(String text) {
  printColor(text, Color.green);
}

void printYellow(String text) {
  printColor(text, Color.yellow);
}

void printBlue(String text) {
  printColor(text, Color.blue);
}

void printMagenta(String text) {
  printColor(text, Color.magenta);
}

void printCyan(String text) {
  printColor(text, Color.cyan);
}

void printGrey(String text) {
  printColor(text, Color.grey);
}

void printBlack(String text) {
  printColor(text, Color.black);
}

String colorizeRed(String text) {
  return colorize(text, Color.red);
}

String colorizeGreen(String text) {
  return colorize(text, Color.green);
}

String colorizeYellow(String text) {
  return colorize(text, Color.yellow);
}

String colorizeBlue(String text) {
  return colorize(text, Color.blue);
}

String colorizeMagenta(String text) {
  return colorize(text, Color.magenta);
}

String colorizeCyan(String text) {
  return colorize(text, Color.cyan);
}

String colorizeGrey(String text) {
  return colorize(text, Color.grey);
}

String colorizeBlack(String text) {
  return colorize(text, Color.black);
}

String syncPrompt(String prompt, [Color? color]) {
  if (color != null) {
    stdout.write(color.code);
  }

  stdout
    ..write(prompt.trim())
    ..write(' ');

  final input = stdin.readLineSync();

  stdout.write(Color.white.code);

  return input ?? '';
}
