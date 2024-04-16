# Obter o nome do projeto Flutter
$projectName = (Get-Content "pubspec.yaml" | Select-String "name:" | ForEach-Object { $_ -replace '^\s*name:\s*','' }) -replace '\s'

# Solicitar o nome da pasta do usuário
$pastaNome = Read-Host "Digite o nome da feature"

# Converter a primeira letra de cada palavra do nome da pasta para maiúscula
$nomePastaMaiusculo = ($pastaNome -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

# Juntar as partes em uma única string
$nomePastaMaiusculo = $nomePastaMaiusculo -join ""

# Caminho completo da nova pasta
$caminhoPasta = Join-Path -Path "lib\src\features\" -ChildPath $pastaNome

# Criar a nova pasta
New-Item -Path $caminhoPasta -ItemType Directory -Force

# Caminho completo para a pasta 'data' dentro da pasta criada
$caminhoData = Join-Path -Path $caminhoPasta -ChildPath "data"

# Criar a pasta 'data' dentro da pasta criada
New-Item -Path $caminhoData -ItemType Directory -Force

# Caminho completo para a pasta 'domain' dentro da pasta criada
$caminhoDomain = Join-Path -Path $caminhoPasta -ChildPath "domain"

# Criar a pasta 'domain' dentro da pasta criada
New-Item -Path $caminhoDomain -ItemType Directory -Force

# Caminho completo para a pasta 'presentation' dentro da pasta criada
$caminhoPresentation = Join-Path -Path $caminhoPasta -ChildPath "presentation"

# Criar a pasta 'presentation' dentro da pasta criada
New-Item -Path $caminhoPresentation -ItemType Directory -Force

# Caminho completo para a pasta 'di' dentro da pasta criada
$caminhoDi = Join-Path -Path $caminhoPasta -ChildPath "di"

# Criar a pasta 'di' dentro da pasta criada
New-Item -Path $caminhoDi -ItemType Directory -Force

# Caminho completo para o arquivo di.dart
$caminhoArquivoDi = Join-Path -Path $caminhoDi -ChildPath "${pastaNome}_di.dart"

# Template do di.dart
$diTemplate = @"
class ${nomePastaMaiusculo}DI {
  ${nomePastaMaiusculo}DI._();

  static configure() {
    _configureDataSources();
    _configureRepositories();
    _configureUseCases();
    _configureCubits();
  }

  static void _configureDataSources() {}

  static void _configureRepositories() {}

  static void _configureUseCases() {}

  static void _configureCubits() {}
}
"@

# Criar o arquivo di.dart com base no template
$diTemplate | Set-Content -Path $caminhoArquivoDi