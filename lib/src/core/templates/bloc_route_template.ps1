# Solicitar o nome da pasta do usuário
$pastaNome = Read-Host "Digite o nome da pasta"

# Caminho completo da nova pasta
$caminhoPasta = Join-Path -Path "lib\src\presentation" -ChildPath $pastaNome

# Criar a nova pasta
New-Item -Path $caminhoPasta -ItemType Directory -Force

# Caminho completo para a pasta 'controller' dentro da pasta criada
$caminhoController = Join-Path -Path $caminhoPasta -ChildPath "controller"

# Criar a pasta 'controller' dentro da pasta criada
New-Item -Path $caminhoController -ItemType Directory -Force

# Converter a primeira letra de cada palavra do nome da pasta para maiúscula
$nomePastaMaiusculo = ($pastaNome -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

# Juntar as partes em uma única string
$nomePastaMaiusculo = $nomePastaMaiusculo -join ""

# Template do cubit
$cubitTemplate = @"
import 'package:bloc/bloc.dart';

import '/src/presentation/$pastaNome/controller/${pastaNome}_state.dart';

class ${nomePastaMaiusculo}Cubit extends Cubit<${nomePastaMaiusculo}State> {
  ${nomePastaMaiusculo}Cubit() : super(const ${nomePastaMaiusculo}StateInitial());
}
"@

# Template do state.dart
$stateTemplate = @"
sealed class ${nomePastaMaiusculo}State {
  const ${nomePastaMaiusculo}State();
}

class ${nomePastaMaiusculo}StateInitial extends ${nomePastaMaiusculo}State {
  const ${nomePastaMaiusculo}StateInitial();
}
"@

# Template da page.dart
$pageTemplate = @"
import 'package:flutter/material.dart';

import '/src/core/infra/ui/base_bloc_state.dart';
import '/src/presentation/$pastaNome/controller/${pastaNome}_cubit.dart';

class ${nomePastaMaiusculo}Page extends StatefulWidget {
  const ${nomePastaMaiusculo}Page({super.key});

  @override
  State<${nomePastaMaiusculo}Page> createState() => _${nomePastaMaiusculo}PageState();
}

class _${nomePastaMaiusculo}PageState extends BaseBlocState<${nomePastaMaiusculo}Page, ${nomePastaMaiusculo}Cubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${nomePastaMaiusculo}'),
      ),
      body: const Center(
        child: Text('Page ${nomePastaMaiusculo}'),
      ),
    );
  }
}
"@

# Template da route.dart
$routeTemplate = @"
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/src/presentation/$pastaNome/${pastaNome}_page.dart';
import '/src/presentation/$pastaNome/controller/${pastaNome}_cubit.dart';

class ${nomePastaMaiusculo}Route {
  ${nomePastaMaiusculo}Route._();

  static Widget get page => BlocProvider(
        create: (context) => ${nomePastaMaiusculo}Cubit(),
        child: const ${nomePastaMaiusculo}Page(),
      );
}
"@

# Caminho completo para o arquivo page.dart
$caminhoPage = Join-Path -Path $caminhoPasta -ChildPath "$pastaNome`_page.dart"

# Criar o arquivo page.dart com base no template
$pageTemplate | Set-Content -Path $caminhoPage

# Caminho completo para o arquivo route.dart
$caminhoRoute = Join-Path -Path $caminhoPasta -ChildPath "$pastaNome`_route.dart"

# Criar o arquivo route.dart com base no template
$routeTemplate | Set-Content -Path $caminhoRoute

# Caminho completo para o arquivo cubit.dart
$caminhoCubit = Join-Path -Path $caminhoController -ChildPath "${pastaNome}_cubit.dart"

# Criar o arquivo cubit.dart com base no template
$cubitTemplate | Set-Content -Path $caminhoCubit

# Caminho completo para o arquivo state.dart
$caminhoState = Join-Path -Path $caminhoController -ChildPath "${pastaNome}_state.dart"

# Criar o arquivo state.dart com base no template
$stateTemplate | Set-Content -Path $caminhoState