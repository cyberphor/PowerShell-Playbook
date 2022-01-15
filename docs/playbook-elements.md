# Playbook Elements
### Playbook Identifer  
**Format**  
Option 1 (Credit: Crafting the InfoSec Playbook)
```pwsh
$UniqueId-$HF|$INV-$EventSource-$ReportCategory: $Description
# EXAMPLES
# 00001-HF-Flow-Trend: Outbound traffic to Russian C2 servers 
# 00002-HF-AV-Malware: Trickbot
# 00003-Inv-Syslog-Policy: IP theft
```

Option 2
```pwsh
$Number-$DeliveryVector-$DataSource
# EXAMPLES
# 01-SoftwareFlaw-Alerts
# 02-SocialEngineering-Email
# 03-ConfigurationManagement-NetworkConnections
```

Option 3
```pwsh
$Number-$Tactic-$Technique
# EXAMPLES
# 01-Execution-T1059.001
```

**Delivery Vectors**
* Reconnaissance 
* Authorized User 
* Social Engineering
* Configuration Management
* Software Flaw 
* Transitive Trust 
* Resource Exhaustion 
* Other 
* Unknown

**Data Sources**  
* Network: alerts, flow records, client/server transactions, traffic statistics, Packet Capture (PCAP) files, etc. 
* Memory: processes, network connections, scheduled tasks, etc. 
* Disk: logs, the Windows Registry, files, etc. 

### Details  
* Task
* Purpose
* Conditions
* Standard

### Setup
Variables go here.

### Query & Analysis
Code and comments go here. 
