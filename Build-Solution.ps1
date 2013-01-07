param(
    [ValidateSet('FullBuild', 'RunUnitTests', 'Build', 'Clean')]
    [string]
    $build = "FullBuild"
    ,
    [ValidateSet('Debug', 'Release')]
    [string]
    $config = "Debug"
    ,
    [string]
    $MSBuildVerbosity = "normal"
)

$scriptPath = Split-Path $MyInvocation.MyCommand.Path
$projFile = join-path $scriptPath NullGuard.msbuild
 
& "$(get-content env:windir)\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe" $projFile /t:$build /p:Configuration=$config /verbosity:$MSBuildVerbosity
