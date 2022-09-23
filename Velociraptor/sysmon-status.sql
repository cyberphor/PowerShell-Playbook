/* 
# Get Sysmon Status
*/

LET Cmdlets = "Get-Service Sysmon64 | ConvertFrom-Json"

LET JSON = SELECT
  Fqdn AS Hostname,
  parse_json(data = Stdout) AS PowerShell
  FROM Artifact.Windows.System.Powershell(Command = Cmdlets)

SELECT 
  Hostname,
  PowerShell.DisplayName AS DisplayName, 
  PowerShell.Status AS Status 
  FROM JSON
