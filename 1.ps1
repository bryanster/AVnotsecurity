$connectTestResult = Test-NetConnection -ComputerName avnotsecurity.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Het wachtwoord opslaan, zodat de schijf blijft behouden bij opnieuw opstarten
    cmd.exe /C "cmdkey /add:`"avnotsecurity.file.core.windows.net`" /user:`"localhost\avnotsecurity`" /pass:`"DrRpr44IoNV9tLKBNPjoF7hAuCAKnwlQNNBYB41M8Thj50tcdJLp8OxTxzdgH/F0iL/09WjvJ1RF+AStPMdl2w==`""
    # Het station koppelen
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\avnotsecurity.file.core.windows.net\avnotsec" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}
Copy-Item -Path c:/users/bryan/key.pem -Destination Z:/key.pem -Force
remove-item -path c:/users/bryan/key.pem -force
remove-PSDrive -Name Z