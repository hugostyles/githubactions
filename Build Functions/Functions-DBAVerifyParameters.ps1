function Invoke-VerifyParameters 
(
 [string]$Authority
,[string]$SQLServers
,[string]$DeployEMISServiceManager
,[string]$EMISGroupDBAVersion
,[string]$EMISServiceManagerVersion
,[string]$EnvironmentCategory
,[string]$EnvironmentName
,[string]$EnvironmentPrimary
,[string]$EnvironmentType
,[string]$IsAWS
,[string]$ReadableSecondaryLocation
,[string]$ReportingServer
,[string]$SentryOneDB
,[string]$Service
,[string]$SQLServerBuild
)
{



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
    write-host " "
    write-host "Verifying Parameters"
    write-host '----------------------------------------'
    write-output 'Sanity Checking Parameters values are as expected...'
    Write-Output ' '

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


Invoke-VerifyParameters 
-Authority $Authority `
    -SQLServers $SQLServers `
    -DeployEMISServiceManager $DeployEMISServiceManager `
    -EMISGroupDBAVersion $EMISGroupDBAVersion `
    -EMISServiceManagerVersion $EMISServiceManagerVersion `
    -EnvironmentCategory $EnvironmentCategory `
    -EnvironmentName $EnvironmentName `
    -EnvironmentPrimary $EnvironmentPrimary `
    -EnvironmentType $EnvironmentType `
    -IsAWS $IsAWS `
    -ReadableSecondaryLocation $ReadableSecondaryLocation `
    -ReportingServer $ReportingServer `
    -SentryOneDB $SentryOneDB `
    -Service $Service `
    -SQLServerBuild $SQLServerBuild