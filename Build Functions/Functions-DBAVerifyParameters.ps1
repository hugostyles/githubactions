param(
        [string]$Servernames,
        [string]$Authority,
        [string]$SQLServerBuild,
        [string]$EnvironmentName,
        [string]$EnvironmentType,
        [string]$EnvironmentCategory,
        [string]$EMISGroupDBAVersion,
        [string]$EMISServiceManagerVersion,
        [string]$ReportingServer,
        [string]$SentryOneDB
    )

    write-host " " 
    Write-host "Please review the below parameters:"
    write-host '----------------------------------------'
    Write-host "Servers : " $Servernames
    Write-host "Authority : " $Authority
    Write-host "SQLServerBuild : " $SQLServerBuild
    Write-host "EnvironmentName : " $EnvironmentName
    Write-host "EnvironmentType : " $EnvironmentType
    Write-host "EnvironmentCategory : " $EnvironmentCategory
    Write-host "EMISGroupDBAVersion : " $EMISGroupDBAVersion
    Write-host "EMISServiceManagerVersion : " $EMISServiceManagerVersion
    Write-host "Reporting Server : " $ReportingServer
    Write-host "SentryOne Server : " $SentryOneDB
    write-host '----------------------------------------'
    
    #start with no errors
    $haserror = 0

    #check if the parameters are set
    if ( ([string]::IsNullOrEmpty($Servernames))){
        Write-Output '$Servernames - Missing Servernames Parameter'
        $haserror = 1}

    if ( ([string]::IsNullOrEmpty($Authority))){
        Write-Output '$Authority - Missing Authority Parameter'
        $haserror = 1}

    if ( ([string]::IsNullOrEmpty($SQLServerBuild))){
        Write-Output '$SQLServerBuild - Missing SQLServerBuild Parameter'
        $haserror = 1}
    
    if ( ([string]::IsNullOrEmpty($EnvironmentName))){
        Write-Output '$EnvironmentName - Missing EnvironmentName Parameter'
        $haserror = 1}
    
    if ( ([string]::IsNullOrEmpty($EnvironmentType))){
        Write-Output '$EnvironmentType - Missing EnvironmentType Parameter'
        $haserror = 1} elseif ($EnvironmentType -notin @('PRD','STG','DEV')) {
        Write-Output "$EnvironmentType - Invalid EnvironmentType Parameter. Must be PRD, STG or DEV."
        $haserror = 1}
    
    if ( ([string]::IsNullOrEmpty($EnvironmentCategory))){
        Write-Output '$EnvironmentCategory - Missing EnvironmentCategory Parameter'
        $haserror = 1}

    if ( ([string]::IsNullOrEmpty($EMISGroupDBAVersion))){    
        Write-Output '$EMISGroupDBAVersion - Missing EMISGroupDBAVersion Parameter'
        $haserror = 1}

    if ( ([string]::IsNullOrEmpty($EMISServiceManagerVersion))){ 
        Write-Output '$EMISServiceManagerVersion - Missing EMISServiceManagerVersion Parameter'
        $haserror = 1}

    if ( ([string]::IsNullOrEmpty($ReportingServer))){
        Write-Output '$ReportingServer - Missing ReportingServer Parameter'
        $haserror = 1}  

    if ( ([string]::IsNullOrEmpty($SentryOneDB))){
        Write-Output '$SentryOneDB - Missing SentryOneDB Parameter'
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
