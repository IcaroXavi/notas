import 'dart:async';
import 'dart:io';

void main() {
  menu();
}

List<double> notas = [];

void menu() {
  print(
    "\nMenu Principal\n\n1 - Adiconar nota\n2 - Consultar notas\n3 - Excluir Nota\n4 - Sair",
  );
  String? opcao = stdin.readLineSync();
  switch (opcao) {
    case "1":
      adiconar();
      break;
    case "2":
      consultar();
      break;
    case "3":
      excluir();
      break;
    case "4":
      sair();
      break;
  }
}

void adiconar() {
  print("Digite a nota a ser adicionada:");
  double? nota = double.tryParse(stdin.readLineSync() ?? "");
  notas.add(nota!);
  print(
    "Nota $nota adicionada! Digite 1 para adicionar mais notas ou qualquer outra tecla para retorar ao menu principal:",
  );
  String? opcao = stdin.readLineSync();
  if (opcao == "1") {
    adiconar();
  } else {
    menu();
  }
}

void consultar() {
  if (notas.isEmpty) {
    print(
      "Nenhuma nota encontrada! Digite 1 para voltar ao menu inicial ou qualquer outra tecla para sair:",
    );
    String? opcao = stdin.readLineSync();
    if (opcao == "1") {
      menu();
    } else {
      sair();
    }
  } else {
    print("\nNotas:\n");
    for (var i = 0; i < notas.length; i++) {
      print(notas[i]);
    }
    print(
      "\nDigite 1 para voltar ao menu inicial ou qualquer outra tecla para sair:",
    );
    String? opcao = stdin.readLineSync();
    if (opcao == "1") {
      menu();
    } else {
      sair();
    }
  }
}

void excluir() {
  print("\nDigite o valor correspondente a nota a ser excluída:\n");
  List<int> opcoes = [];
  for (var i = 0; i < notas.length; i++) {
    int index = i + 1;
    print("Nota $index: ${notas[i]}");
    opcoes.add(index);
  }
  int? opcao = int.tryParse(stdin.readLineSync() ?? "");
  if (opcoes.contains(opcao)) {
    notas.removeAt(opcao! - 1);
  } else {
    print("Opção inválida.");
    excluir();
  }

  menu();
}

void sair() {
  print("Desconectando...");
  Timer(Duration(seconds: 1), () {});
}
