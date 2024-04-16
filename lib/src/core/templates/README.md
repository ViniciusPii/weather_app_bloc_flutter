# Como criar manualmente o arquivo de perfil do PowerShell

O arquivo de perfil do PowerShell é um script que é executado automaticamente quando você inicia o PowerShell, permitindo que você configure o ambiente do PowerShell de acordo com suas preferências. Siga as etapas abaixo para criar manualmente o arquivo de perfil do PowerShell:

1. Abra o PowerShell.

2. Execute o seguinte comando para verificar se o arquivo de perfil do PowerShell já existe:
   ```powershell
   Test-Path $PROFILE
   ```

   Se o comando retornar `False`, significa que o arquivo de perfil ainda não existe e você precisa criá-lo, se retornar `True`, siga a partir do passo 4.

3. Execute o seguinte comando para criar o arquivo de perfil:
   ```powershell
   New-Item -Path $PROFILE -ItemType File -Force
   ```

4. Após criar o arquivo de perfil, você pode editá-lo com o editor de texto de sua escolha. Por exemplo, você pode usar o Bloco de Notas com o seguinte comando:
   ```powershell
   notepad $PROFILE
   ```

5. No arquivo de perfil, adicione a seguinte linha para criar um alias para o seu script de template:
   ```powershell
   Set-Alias -Name bloc -Value ".\lib\src\core\templates\bloc_template.ps1"
   ```

   Isso criará um alias chamado `bloc` que apontará para o seu script de template.

6. No arquivo de perfil, adicione a seguinte linha para criar um alias para o seu script de template:
   ```powershell
   Set-Alias -Name repo -Value ".\lib\src\core\templates\repository_template.ps1"
   ```

   Isso criará um alias chamado `repo` que apontará para o seu script de template.

7. No arquivo de perfil, adicione a seguinte linha para criar um alias para o seu script de template:
   ```powershell
   Set-Alias -Name service -Value ".\lib\src\core\templates\service_template.ps1"
   ```

   Isso criará um alias chamado `service` que apontará para o seu script de template.

8. No arquivo de perfil, adicione a seguinte linha para criar um alias para o seu script de template:
   ```powershell
   Set-Alias -Name dts -Value ".\lib\src\core\templates\data_source_template.ps1"
   ```

   Isso criará um alias chamado `dts` que apontará para o seu script de template.

9. No arquivo de perfil, adicione a seguinte linha para criar um alias para o seu script de template:
   ```powershell
   Set-Alias -Name use -Value ".\lib\src\core\templates\use_case_template.ps1"
   ```

   Isso criará um alias chamado `use` que apontará para o seu script de template.

10. No arquivo de perfil, adicione a seguinte linha para criar um alias para o seu script de template:
   ```powershell
   Set-Alias -Name service -Value ".\lib\src\core\templates\bloc_route_template.ps1"
   ```

   Isso criará um alias chamado `bloc_route` que apontará para o seu script de template.

   OBS: Essa opção é caso deseje não utilizar o get_it como DI e sim o próprio BLOC

Depois de seguir estas etapas, o alias será criado automaticamente sempre que você iniciar o PowerShell, permitindo que você acesse facilmente seu script de template.

Lembre-se de reiniciar o terminal para que os alias surtam efeito.
