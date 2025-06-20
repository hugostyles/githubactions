param(
    [string]$SQLServers,
    [string]$Authority
)

function Invoke-VerifyParameters {
    param(
        [string]$SQLServers,
        [string]$Authority
    )

    write-host " " 
    Write-host "Please review the below parameters:"
    write-host '----------------------------------------'
    Write-host "Authority : " $Authority
    Write-host "Servers : " $SQLServers
    Write-host "EnvironmentName : " $EnvironmentName
    Write-host "EnvironmentType : " $EnvironmentType
    Write-host "EnvironmentCategory : " $EnvironmentCategory
    Write-host "EnvironmentPrimary : " $EnvironmentPrimary
    Write-host "ReadableSecondaryLocation : " $ReadableSecondaryLocation
    Write-host "SQLServerBuild : " $SQLServerBuild
    Write-host "EMISGroupDBAVersion : " $EMISGroupDBAVersion
    Write-host "EMISServiceManagerVersion : " $EMISServiceManagerVersion
    Write-host "DeployEMISServiceManager : " $DeployEMISServiceManager
    Write-host "IsAWS : " $IsAWS
    Write-host "Reporting Server : " $ReportingServer
    Write-host "SentryOne Server : " $SentryOneDB
    write-host "Service : " $Service
    write-host '----------------------------------------'
    
    #start with no errors
    $haserror = 0

    #check if the parameters are set
    if ( ([string]::IsNullOrEmpty($SQLServers))){
        Write-Output '$SQLServers - Missing SQLServers Parameter'
        $haserror = 1}
    if ( ([string]::IsNullOrEmpty($Authority))){
        Write-Output '$Authority - Missing Authority Parameter'
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