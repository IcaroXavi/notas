import 'dart:io';

void main() {
  menu();
}

List<double> notas = [];

void menu() {
  print(
    "Menu Principal\n\n1 - Adiconar nota\n2 - Consultar notas\n3 - Excluir Nota\n4 - Sair",
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

void consultar() {}

void excluir() {}

void sair() {
  print("Até breve!");
}
