/*
# Source IP
*/

/*
## Query
*/
```
$Value = ""
$Field = "SourceAddress"
$LogName = "Security"
$Id = 5156

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

Get-WinEvent -FilterHashTable @{LogName=$LogName;Id=$Id} |
Read-WinEvent |
Where-Object { $_.$Field -eq $Value } |
Select-Object -First 1
ConvertTo-Json
'''

/*
## Results
*/
SELECT * FROM source(artifact = "Windows.System.PowerShell")
