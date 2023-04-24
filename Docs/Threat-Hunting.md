## Threat Hunting
Threat hunting is the process of proactively searching for threat actors who have evaded detection and infiltrated an organization’s enterprise. A threat hunt is made of four components: the trigger, the hypothesis, the investigation, and the response. Threat hunting is a sub-process of incident handling and complements the organization’s security monitoring program.

### Threat Actor
A threat actor is a person or group of people who seek to exploit the security flaws of an organization. Threat actors are often described by their attributes: motivation, intent, and behavior. 

**Motivation**  
Threat actors are motivated by fame, politics, revenge, competition, money, or national security. 

**Intent**  
Their intent may be to commit cyber-crimes like espionage and steal proprietary or private information. Alternatively, it may be to conduct cyber-warfare activities that deny (degrade, disrupt, and destroy) or manipulate an organization’s ability to provide information services. 

**Behavior**  
The different types of threat actors one may encounter include script kiddies, hacktivists, insider threats, corporate competitors, organized criminals, and Advanced Persistent Threat (APT) groups. Each type are known to exude a variety of behavior. 

### Threat Intelligence
Threat intelligence provides insight into a threat actor’s motivation, intent, and behavior. It gives the consumer an advantage by allowing them to anticipate malicious activity. 

### Triggers
A threat hunting trigger is what creates the need for a threat hunt. Threat hunts can be triggered by threat intelligence, an alert, or on schedule. For example, an intelligence-based trigger could be a report describing a new technique APT groups are using for persistence. Once a threat hunt is triggered, a hypothesis is developed.  

### Hypotheses
A threat hunting hypothesis is an assumption of what may be occuring on the network based on evidence available. For example, "I believe APT 1 may have or is attempting to gain access to our enterprise. They target organizations like ours and have been observed exploiting CVE-2021-44228."

### Investigations 
During an investigation, threat hunters will use the data sources available to discover Indicators of Attack. 

**Data Sources**  
* Network-Based Data Sources: alerts, flow records, client/server transactions, traffic statistics, and Packet Capture (PCAP) files. 
* Host-Based Data Sources: processes, network connections, scheduled tasks, logs, etc. 

**Indicators of Attack**  
Indicators of Attack (IOAs) "focus on detecting the intent of what an attacker is trying to accomplish, regardless of the malware or exploit used in an attack. Just like AV signatures, an IOC-based detection approach cannot detect the increasing threats from malware-free intrusions and zero-day exploits" ([https://www.crowdstrike.com/cybersecurity-101/indicators-of-compromise/ioa-vs-ioc/](https://www.crowdstrike.com/cybersecurity-101/indicators-of-compromise/ioa-vs-ioc/)).

### Responses
If a hypothesis is proven to be true and a threat actor has been discovered, the organization must immediately begin conducting incident response procedures. During the Post-Incident Activity phase of their response, they should also discuss and implement lessons learned during the threat hunt. 
