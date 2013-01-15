param (
    [string]$config = "Debug"
)

$solutionname = "MvcProjectTemplate"

start-process -FilePath "rake" -ArgumentList "solutionname= config=" -wait -NoNewWindow -WorkingDirectory ".\build"