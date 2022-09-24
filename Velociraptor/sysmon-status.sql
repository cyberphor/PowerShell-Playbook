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
SELECT
  Fqdn AS Hostname,
  parse_json(data = Stdout).DisplayName AS DisplayName,
  parse_json(data = Stdout).Name AS Status
  FROM source(artifact = "Windows.System.PowerShell")
