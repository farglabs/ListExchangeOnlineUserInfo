### ListExchangeOnlineUserInfo.ps1 :: https://github.com/farglabs/ListExchangeOnlineUserInfo

Import-Module MSOnline
Import-Module ExchangeOnlineManagement

Connect-MsolService
Connect-ExchangeOnline

$users = Get-MsolUser | Sort-Object -Property UserPrincipalName

ForEach ($user In $users) {
    Write-Host $user.DisplayName '(' $user.UserPrincipalName ')'
}

$user = Read-Host "Enter the email address of the user you want to view Exchange Online information for:"

$exchangeOnlineUser = Get-EXOMailbox -Identity $user
$exchangeOnlineUserStats = Get-EXOMailboxStatistics -Identity $user

Write-Host User Name: $exchangeOnlineUser.DisplayName
Write-Host Email Address: $exchangeOnlineUser.UserPrincipalName
Write-Host Mailbox GUID: $exchangeOnlineUserStats.MailboxGuid
Write-Host Mailbox Usage: $exchangeOnlineUserStats.TotalItemSize
Write-Host Total Items: $exchangeOnlineUserStats.ItemCount
Write-Host Deleted Usage: $exchangeOnlineUserStats.TotalDeletedItemSize
Write-Host Deleted Items: $exchangeOnlineUserStats.DeletedItemCount
