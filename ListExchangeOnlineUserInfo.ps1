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
$exchangeOnlineUserStats = Get-EXOMailbox -Identity $user

Write-Host User Name: $exchangeOnlineUser.UserPrincipalName
Write-Host Email Address: $user
Write-Host Mailbox Usage: $exchangeOnlineUserStats.TotalItemSize
Write-Host Total Items: $exchangeOnlineUserStats.ItemCount
