# Solicitar o nome da pasta do usuário
$pastaNome = Read-Host "Digite o nome da pasta"

# Converter a primeira letra de cada palavra do nome da pasta para maiúscula
$nomePastaMaiusculo = ($pastaNome -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

# Juntar as partes em uma única string
$nomePastaMaiusculo = $nomePastaMaiusculo -join ""

# Caminho completo da nova pasta
$caminhoPasta = Join-Path -Path "lib\src\services" -ChildPath $pastaNome

# Criar a nova pasta
New-Item -Path $caminhoPasta -ItemType Directory -Force

# Template do service_impl.dart
$serviceImplTemplate = @"
import '${pastaNome}_service.dart';

class ${nomePastaMaiusculo}ServiceImpl implements ${nomePastaMaiusculo}Service {}
"@

# Template do service.dart
$serviceTemplate = @"
abstract class ${nomePastaMaiusculo}Service {}
"@

# Caminho completo para o arquivo service_impl.dart
$caminhoServiceImpl = Join-Path -Path $caminhoPasta -ChildPath "${pastaNome}_service_impl.dart"

# Criar o arquivo service_impl.dart com base no template
$serviceImplTemplate | Set-Content -Path $caminhoServiceImpl

# Caminho completo para o arquivo service.dart
$caminhoService = Join-Path -Path $caminhoPasta -ChildPath "${pastaNome}_service.dart"

# Criar o arquivo service.dart com base no template
$serviceTemplate | Set-Content -Path $caminhoService