$projectName = (Get-Content "pubspec.yaml" | Select-String "name:" | ForEach-Object { $_ -replace '^\s*name:\s*','' }) -replace '\s'

$featureName = Read-Host "Digite o nome da feature"

$repoName = Read-Host "Digite o nome do repository"

$useCaseName = Read-Host "Digite o nome do use case"

$useCaseNameUpper = ($useCaseName -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

$useCaseNameUpper = $useCaseNameUpper -join ""

$featureNameUpper = ($featureName -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

$featureNameUpper = $featureNameUpper -join ""

$repoNameUpper = ($repoName -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

$repoNameUpper = $repoNameUpper -join ""

$pathFolder = Join-Path -Path "lib\src\domain\use_cases\" -ChildPath $featureName

New-Item -Path $pathFolder -ItemType Directory -Force

$useCaseImplTemplate = @"
import 'package:$projectName/src/data/repositories/$featureName/${repoName}_repository.dart';
import 'package:$projectName/src/domain/use_cases/$featureName/${useCaseName}_use_case.dart';

class ${useCaseNameUpper}UseCaseImpl implements ${useCaseNameUpper}UseCase {
  ${useCaseNameUpper}UseCaseImpl({
    required ${repoNameUpper}Repository repository,
  }) : _repository = repository;

  final ${repoNameUpper}Repository _repository;
}
"@

$useCaseTemplate = @"
abstract class ${useCaseNameUpper}UseCase {}
"@

$pathImpl = Join-Path -Path $pathFolder -ChildPath "impl"

New-Item -Path $pathImpl -ItemType Directory -Force

$pathUseCaseImpl = Join-Path -Path $pathImpl -ChildPath "${useCaseName}_use_case_impl.dart"

$useCaseImplTemplate | Set-Content -Path $pathUseCaseImpl

$pathUseCase = Join-Path -Path $pathFolder -ChildPath "${useCaseName}_use_case.dart"

$useCaseTemplate | Set-Content -Path $pathUseCase