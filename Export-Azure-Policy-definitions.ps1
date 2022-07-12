# Define Variables
$date = Get-Date -Format "dd-MM-yyyy"
$storageAccountRG     = "cloud-shell-storage-westeurope"
$storageAccountName   = "csx2y45d675"
$storageContainerName = "azure-policies"

# Get Storage Account Key
$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $storageAccountRG -AccountName $storageAccountName).Value[0]

# Set AzStorageContext
$destinationContext = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey

# Generate SAS URI Token which is valid for 15 minutes ONLY
$containerSASURI = New-AzStorageContainerSASToken -Context $destinationContext -ExpiryTime(get-date).AddSeconds(900) -FullUri -Name $storageContainerName -Permission rw

# Export Azure Policy definitions
$policies = Get-AzPolicyDefinition | Where-Object {$_.Properties.PolicyType -eq "Custom"}
foreach ($policy in $policies) {
$policy.properties | ConvertTo-Json -Depth 12 | `
 Out-File "$($home)/clouddrive/Backup_$($policy.properties.DisplayName)_$date.json"
# Backup Azure Policy to Azure Storage
 azcopy cp "$($home)/clouddrive/Backup_$($policy.properties.DisplayName)_$date.json" $containerSASURI 
}

# Delete Azure Policies from the Azure Shell cloud drive
Remove-Item Backup* -Force