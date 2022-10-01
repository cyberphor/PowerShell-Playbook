<#
  .TACTIC
  TA0002, Execution
  https://attack.mitre.org/tactics/TA0002/
  
  .TECHNIQUE
  T1059, Command and Scripting Interpreter
  https://attack.mitre.org/techniques/T1059/

  .SUB-TECHNIQUE
  T1059.001, PowerShell
  https://attack.mitre.org/techniques/T1059/001/

  .ATOMIC
  https://lolbas-project.github.io/lolbas/Binaries/Print/

  .REFERENCES
  - https://www.powershellgallery.com/packages/Soap/
  - https://www.windows-commandline.com/create-file-from-command-line/
#>

$FilterHashTable = @{
    LogName = "security"
    Id = 4688
}

Import-Module soap
Get-WinEvent -FilterHashTable $FilterHashTable |
Read-WinEvent | 
Where-Object { $_.NewProcessName -like "*print*" } |
Select-Object TimeCreated, SubjectUserName, ParentProcessName, CommandLine