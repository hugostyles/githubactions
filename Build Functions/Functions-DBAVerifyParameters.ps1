function Invoke-VerifyParameters {
param(
    [string]$SQLServers
)


    Write-host "Servers : " $SQLServers
    $haserror = 0

    if ( ([string]::IsNullOrEmpty($SQLServers))){
        Write-Output '$SQLServers - Missing SQLServers Parameter'
        $haserror = 1}
    
    
    #Summary of the checks
    if ($haserror -ne '1')
    {
        Write-Output "All parameters have been set correctly"
    }

    #If there is an error, then we will fail the task
    if ($haserror -eq '1')
    {
        Write-Output "There was an error with the parameters, please check the output above."
        Write-Output "Please correct the parameters and try again."
        Write-Output "Exiting script with failure status."
        exit 1
    }
   
}


Invoke-VerifyParameters -SQLServers $SQLServers 