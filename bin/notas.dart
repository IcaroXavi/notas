import 'dart:async';
import 'dart:io';

void main() {
  menu();
}

Map<String, List<double>> notas = {
  'Icaro': [8.50, 10, 7.5, 8],
  'Maria': [9.50, 9, 6.5, 10],
};

void menu() {
  print(
    "\nMenu Principal\n\n1 - Incluir Aluno\n2 - Adiconar Nota\n3 - Consultar Alunos e Notas\n4 - Excluir Notas\n5 - Sair",
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
      double? nota = double.tryParse(stdin.readLineSync()!);
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
        print("Nota ${i + 1}: ${notas[i]}");
      }
    });
  }
  print("\nDigite qualquer tecla para voltar ao menu inicial\n");
  stdin.readLineSync();
  menu();
}

void excluir() {
  print("\nAlunos cadastrados:\n");
  notas.forEach((nome, notas) {
    print(nome);
  });
  print("\nDigite o nome do aluno que terá a nota excluída:\n");
  String? nome = stdin.readLineSync();
  if (notas.containsKey(nome)) {
    for (int i = 0; i < notas[nome]!.length; i++) {
      print("Nota ${i + 1}: ${notas[nome]![i]}");
    }
    print("\nDigite o número de referência da nota a ser excluída:");
    int? opcao = int.tryParse(stdin.readLineSync()!);
    notas[nome]!.removeAt(opcao! - 1);
    print(
      "\nNota excluída com sucesso! Segue abaixo nota(s) atualizada(s) do(a) Aluno(a) $nome:\n",
    );
    for (int i = 0; i < notas[nome]!.length; i++) {
      print("Nota ${i + 1}: ${notas[nome]![i]}");
    }
  } else {
    print(
      "Aluno(a) não localizado, verifique a lista abaixo e tente novamente:",
    );
  }
}

void sair() {
  print("Desconectando...");
  Timer(Duration(seconds: 1), () {});
}
