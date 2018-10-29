#Gets computers to run on from text file
#$computers = Get-Content '\\fileshare\Computers.txt'

#Gets all workstations that need to have software installed, if you don't want to uninstall all of the software from you will need to use a text document and Get-Content
$computers = Get-ADComputer -Filter * -SearchBase "OU=Workstations,DC=Contoso,DC=COM" | Select DNSHostName -ExpandProperty DNSHostname

#Name of process to find
$ProcessName = "notepad"

ForEach ($Computer in $Computers)
 {
 $Computer
 get-process -ComputerName $Computer -Name $ProcessName
 }