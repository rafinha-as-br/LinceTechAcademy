import 'package:termo/dicionario.dart';
import 'package:termo/terminal_utils.dart';

void main(List<String> arguments) {
  printBlue("""
------------------------------------------------------------------------------------------------------------------------------------------
                                     
    ██╗     ██╗███╗   ██╗ ██████╗███████╗    ████████╗███████╗ ██████╗██╗  ██╗     █████╗  ██████╗ █████╗ ██████╗ ███████╗███╗   ███╗██╗   ██╗
    ██║     ██║████╗  ██║██╔════╝██╔════╝    ╚══██╔══╝██╔════╝██╔════╝██║  ██║    ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝████╗ ████║╚██╗ ██╔╝
    ██║     ██║██╔██╗ ██║██║     █████╗         ██║   █████╗  ██║     ███████║    ███████║██║     ███████║██║  ██║█████╗  ██╔████╔██║ ╚████╔╝ 
    ██║     ██║██║╚██╗██║██║     ██╔══╝         ██║   ██╔══╝  ██║     ██╔══██║    ██╔══██║██║     ██╔══██║██║  ██║██╔══╝  ██║╚██╔╝██║  ╚██╔╝  
    ███████╗██║██║ ╚████║╚██████╗███████╗       ██║   ███████╗╚██████╗██║  ██║    ██║  ██║╚██████╗██║  ██║██████╔╝███████╗██║ ╚═╝ ██║   ██║   
    ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝       ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝     ╚═╝   ╚═╝   
    
------------------------------------------------------------------------------------------------------------------------------------------
""");

  printCyan('Esse arquivo será o ponto de entrada de sua aplicação.');
  print(
    colorizeCyan('Utilize as bibliotecas disponíveis em ') +
        colorizeGrey('/lib ') +
        colorizeCyan('para implementar seu projeto.'),
  );

  print('\nBiblioteca de dicionario (${colorizeGrey('dicionario.dart')})');
  final word = sortearPalavra();
  print(' - Sortear palavra ( sortearPalavra ) : ${colorizeGreen(word)}');
  print(
    ' - Palavra gerada : ${colorizeBlue(word)}',
  );

  print('\nBiblioteca de terminal (${colorizeGrey('terminal_utils.dart')})');
  print(' - Imprimir texto colorido ( ${colorizeGrey('printColor')} )');
  print(' - Gerar string com texto colorido ( ${colorizeGrey('colorize')} )');
  printRed(' - Vermelho ( printRed / Color.red)');
  printGreen(' - Verde ( printGreen / Color.green)');
  printBlue(' - Azul ( printBlue / Color.blue)');
  printBlack(' - Preto ( printBlack / Color.black)');
  printGrey(' - Cinza ( printGrey / Color.grey)');
  printCyan(' - Ciano ( printCyan / Color.cyan)');
  printYellow(' - Amarelo ( printYellow / Color.yellow)');
  printMagenta(' - Magenta ( printMagenta / Color.magenta )');
  print(' - Prompt de entrada ( ${colorizeGrey('syncPrompt')} )');
  print('\n');

  var keepGoing = true;

  while (keepGoing) {
    final response = syncPrompt(
      'E ai, tudo entendido? (${colorizeGreen('sim')} / ${colorizeRed('nao')}):',
    );

    switch (response.trim().toLowerCase()) {
      case 's':
      case 'sim':
        printBlue('Bons estudos!');
        keepGoing = false;
        break;

      case 'n':
      case 'nao':
        printYellow('Leia o "readme.md" ou tire suas dúvidas com os mentores');
        keepGoing = true;
        break;

      default:
        printRed('Responda apenas "sim" ou "nao"');
    }
  }
}
