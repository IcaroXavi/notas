import 'dart:async';
import 'dart:io';

void main() {
  menu();
}

Map<String, List<int>> notas = {};

void menu() {
  print(
    "\nMenu Principal\n\n1 - Incluir Aluno\n2 - Adiconar nota\n3 - Consultar alunos e notas\n4 - Excluir Nota\n5 - Sair",
  );
  String? opcao = stdin.readLineSync();
  switch (opcao) {
    case "1":
      incluir();
      break;
    case "2":
      adiconar();
      break;
    case "3":
      consultar();
      break;
    case "4":
      excluir();
      break;
    case "5":
      sair();
      break;
  }
}

void incluir() {
  print("\nDigite o nome do(a) aluno(a):");
  String? nome = stdin.readLineSync();
  if (notas.containsKey(nome)) {
    print(
      "\nO nome $nome já consta na base de dados. Digite 1 para incluir outro nome ou qualquer tecla para voltar ao menu inicial.",
    );
    String? opcao = stdin.readLineSync();
    if (opcao == "1") {
      incluir();
    } else {
      menu();
    }
  } else {
    notas.putIfAbsent(nome!, () => []);
    print(
      "\n$nome adicionado com sucesso. Digite 1 para incluir outro nome ou qualquer tecla para voltar ao menu inicial.",
    );
    String? opcao = stdin.readLineSync();
    if (opcao == "1") {
      incluir();
    } else {
      menu();
    }
  }
}

void adiconar() {
  print("\nDigite o nome do(a) aluno(a):");
  String? nome = stdin.readLineSync();
  if (notas.containsKey(nome)) {
    String opcao = "1";
    while (opcao == "1") {
      print("\nDigite a nota:");
      int? nota = int.tryParse(stdin.readLineSync()!);
      notas[nome]?.add(nota!);
      print(
        "\nA nota $nota foi atribuida ao aluno $nome. Digite 1 para incluir outra nota para $nome, digite 2 para incluir nota para outro aluno ou qualquer tecla para voltar ao menu inicial.",
      );
      opcao = stdin.readLineSync()!;
      if (opcao == "2") {
        adiconar();
      } else if (opcao != "1") {
        menu();
      }
    }
  } else {
    print(
      "Aluno não localizado. Digite 1 para tentar novamente ou qualquer tecla para voltar ao menu inicial",
    );
    String? opcao = stdin.readLineSync();
    if (opcao == "1") {
      adiconar();
    } else {
      menu();
    }
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
    notas.forEach((nome, notas) {
      print("\nAluno: $nome");
      for (int i = 0; i < notas.length; i++) {
        print("Nota: ${i + 1}: ${notas[i]}");
      }
    });
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
    // notas.removeAt(opcao! - 1);
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
