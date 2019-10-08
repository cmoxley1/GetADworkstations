$date = get-date -Format "yyyyMMdd"
$outarray=@()
Set-ExecutionPolicy RemoteSigned
$cylist = "OU=OUname","OU=Ouname","OU=ouname"
#,"OU=Workstation_Clinical-SearchScope 2
foreach($ou in $cylist){
 $output = get-adcomputer -Properties * -LDAPfilter "(|(name=addprefix*)(name=addprefix*)(name=addprefix*)(name=addprefix*)(name=addprefix*)(name=addprefix*)(name=addprefix*)(name=addprefix*))" -SearchBase "$ou,OU=ou,DC=addhere,DC=addhere,DC=com" | Select-object name,lastlogondate
 $outarray += $output
} 
write-output $date
$outarray | Export-CSV C:\Filepath\$(get-date -f yyyyMMdd)devices.csv -NoTypeInformation -Encoding UTF8 