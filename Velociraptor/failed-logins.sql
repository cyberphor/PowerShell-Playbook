LET PowerShell = '''
filter Read-WinEvent {
    $WinEvent = [ordered]@{} 
    $XmlData = [xml]$_.ToXml()
    $SystemData = $XmlData.Event.System
    $SystemData | 
    Get-Member -MemberType Properties | 
    Select-Object -ExpandProperty Name |
    ForEach-Object {
        $Field = $_
        if ($Field -eq 'TimeCreated') {
            $WinEvent.$Field = Get-Date -Format 'yyyy-MM-dd hh:mm:ss' $SystemData[$Field].SystemTime
        } elseif ($SystemData[$Field].'#text') {
            $WinEvent.$Field = $SystemData[$Field].'#text'
        } else {
            $SystemData[$Field]  | 
            Get-Member -MemberType Properties | 
            Select-Object -ExpandProperty Name |
            ForEach-Object { 
                $WinEvent.$Field = @{}
                $WinEvent.$Field.$_ = $SystemData[$Field].$_
            }
        }
    }
    $XmlData.Event.EventData.Data |
    ForEach-Object { 
        $WinEvent.$($_.Name) = $_.'#text'
    }
    return New-Object -TypeName PSObject -Property $WinEvent
}

Get-WinEvent -FilterHashTable @{LogName='security';Id=4625} |
Read-WinEvent |
Select TimeCreated, TargetUserName, LogonType |
ConvertTo-Json
'''

SELECT parse_json(data=Foo) FROM execve(
  argv=[
    "powershell", "-ExecutionPolicy", "Unrestricted", "-encodedCommand", base64encode(string = utf16_encode(string = PowerShell))]
  )
