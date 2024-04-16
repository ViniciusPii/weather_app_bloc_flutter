$projectName = (Get-Content "pubspec.yaml" | Select-String "name:" | ForEach-Object { $_ -replace '^\s*name:\s*','' }) -replace '\s'

$featureName = Read-Host "Digite o nome da feature"

$dtsName = Read-Host "Digite o nome do data source"

$featureNameUpper = ($featureName -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

$featureNameUpper = $featureNameUpper -join ""

$dtsNameUpper = ($dtsName -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

$featureNameUpper = $featureNameUpper -join ""

$dtsNameUpper = $dtsNameUpper -join ""

$pathFolder = Join-Path -Path "lib\src\data\data_sources" -ChildPath $featureName

New-Item -Path $pathFolder -ItemType Directory -Force

$dataSourceImplTemplate = @"
import 'package:$projectName/src/data/data_sources/$featureName/${dtsName}_data_source.dart';

class ${dtsNameUpper}DataSourceImpl implements ${dtsNameUpper}DataSource {}
"@

$dataSourceTemplate = @"
abstract class ${dtsNameUpper}DataSource {}
"@

$pathImpl = Join-Path -Path $pathFolder -ChildPath "impl"

New-Item -Path $pathImpl -ItemType Directory -Force

$pathDataSourceImpl = Join-Path -Path $pathImpl -ChildPath "${dtsName}_data_source_impl.dart"

$dataSourceImplTemplate | Set-Content -Path $pathDataSourceImpl

$pathDataSource = Join-Path -Path $pathFolder -ChildPath "${dtsName}_data_source.dart"

$dataSourceTemplate | Set-Content -Path $pathDataSource