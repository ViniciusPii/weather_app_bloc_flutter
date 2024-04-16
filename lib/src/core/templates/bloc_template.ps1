$projectName = (Get-Content "pubspec.yaml" | Select-String "name:" | ForEach-Object { $_ -replace '^\s*name:\s*','' }) -replace '\s'

$featureName = Read-Host "Digite o nome da feature"

$subFeatureName = Read-Host "Digite o nome da sub feature"

$controllerName = Read-Host "Digite o nome do controller"

$pathFolder = Join-Path -Path "lib\src\presentation" -ChildPath $featureName\$subFeatureName

New-Item -Path $pathFolder -ItemType Directory -Force

$pathController = Join-Path -Path $pathFolder -ChildPath "controller"

New-Item -Path $pathController -ItemType Directory -Force

$controllerNameUpper = ($controllerName -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

$controllerNameUpper = $controllerNameUpper -join ""

$cubitTemplate = @"
import 'package:bloc/bloc.dart';
import 'package:$projectName/src/presentation/$featureName/$subFeatureName/controller/${controllerName}_state.dart';

class ${controllerNameUpper}Cubit extends Cubit<${controllerNameUpper}State> {
  ${controllerNameUpper}Cubit() : super(const ${controllerNameUpper}InitialState());
}
"@

$stateTemplate = @"
sealed class ${controllerNameUpper}State {
  const ${controllerNameUpper}State();
}

class ${controllerNameUpper}InitialState extends ${controllerNameUpper}State {
  const ${controllerNameUpper}InitialState();
}
"@

$pageTemplate = @"
import 'package:$projectName/src/core/ui/base_bloc_state.dart';
import 'package:$projectName/src/presentation/$featureName/$subFeatureName/controller/${controllerName}_cubit.dart';
import 'package:flutter/material.dart';

class ${controllerNameUpper}Page extends StatefulWidget {
  const ${controllerNameUpper}Page({super.key});

  @override
  State<${controllerNameUpper}Page> createState() => _${controllerNameUpper}PageState();
}

class _${controllerNameUpper}PageState extends BaseBlocState<${controllerNameUpper}Page, ${controllerNameUpper}Cubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${controllerNameUpper}'),
      ),
      body: const Center(
        child: Text('Page ${controllerNameUpper}'),
      ),
    );
  }
}
"@

$pathPage = Join-Path -Path $pathFolder -ChildPath "$controllerName`_page.dart"

$pageTemplate | Set-Content -Path $pathPage

$pathCubit = Join-Path -Path $pathController -ChildPath "${controllerName}_cubit.dart"

$cubitTemplate | Set-Content -Path $pathCubit

$pathState = Join-Path -Path $pathController -ChildPath "${controllerName}_state.dart"

$stateTemplate | Set-Content -Path $pathState