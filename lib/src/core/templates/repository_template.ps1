$projectName = (Get-Content "pubspec.yaml" | Select-String "name:" | ForEach-Object { $_ -replace '^\s*name:\s*','' }) -replace '\s'

$featureName = Read-Host "Digite o nome da feature"

$repositoryName = Read-Host "Digite o nome do repository"

$featureNameUpper = ($featureName -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

$featureNameUpper = $featureNameUpper -join ""

$repositoryNameUpper = ($repositoryName -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

$featureNameUpper = $featureNameUpper -join ""

$repositoryNameUpper = $repositoryNameUpper -join ""

$pathFolder = Join-Path -Path "lib\src\data\repositories" -ChildPath $featureName

New-Item -Path $pathFolder -ItemType Directory -Force

$repositoryImplTemplate = @"
import 'package:$projectName/src/data/data_sources/$featureName/${repositoryName}_data_source.dart';
import 'package:$projectName/src/data/repositories/$featureName/${repositoryName}_repository.dart';

class ${repositoryNameUpper}RepositoryImpl implements ${repositoryNameUpper}Repository {
  ${repositoryNameUpper}RepositoryImpl({
    required ${repositoryNameUpper}DataSource dataSource,
  }) : _dataSource = dataSource;

  final ${repositoryNameUpper}DataSource _dataSource;
}
"@

$repositoryTemplate = @"
abstract class ${repositoryNameUpper}Repository {}
"@

$pathImpl = Join-Path -Path $pathFolder -ChildPath "impl"

New-Item -Path $pathImpl -ItemType Directory -Force

$pathRepositoryImpl = Join-Path -Path $pathImpl -ChildPath "${repositoryName}_repository_impl.dart"

$RepositoryImplTemplate | Set-Content -Path $pathRepositoryImpl

$pathRepository = Join-Path -Path $pathFolder -ChildPath "${repositoryName}_repository.dart"

$RepositoryTemplate | Set-Content -Path $pathRepository