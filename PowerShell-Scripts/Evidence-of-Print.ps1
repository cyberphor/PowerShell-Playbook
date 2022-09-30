<#
  .LINK
  print.exe as a LOLBIN
  https://lolbas-project.github.io/lolbas/Binaries/Print/

  how to create a file using the CLI
  https://www.windows-commandline.com/create-file-from-command-line/
#>

$FilterHashTable = @{
    LogName = "security"
    Id = 4688
}

Import-Module soap
Get-WinEvent -FilterHashTable $FilterHashTable |
Read-WinEvent | 
Where-Object { $_.NewProcessName -like "*print*" }