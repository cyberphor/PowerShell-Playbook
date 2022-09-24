/* 
# Get Sysmon Status
*/

/*
## Query
```
Get-Service Sysmon64 | ConvertFrom-Json
```
*/

/*
## Results
*/
LET JSON = SELECT
  Fqdn AS Hostname,
  parse_json(data = Stdout) AS PowerShell
  FROM source(artifact = "Windows.System.PowerShell")

SELECT 
  Hostname,
  PowerShell.DisplayName AS DisplayName, 
  PowerShell.Status AS Status 
  FROM JSON
