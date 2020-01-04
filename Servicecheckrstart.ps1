[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$serviceName
)
function serviceCheckRestart
{
    try
    {
        Get-Service | Where Status -eq "Running"
        Restart-Service $serviceName
        $result=Get-Service | Where Name -eq $serviceName
        if($result.Status -eq "Running")
        {
            Write-Host("$serviceName is Running")
        }
        else
        {
            Write-Host("$serviceName is Stopped")
        }
    }
    catch
    {
        "OOPS! Error Occurred with following message:- $error"
    }
}
serviceCheckRestart
