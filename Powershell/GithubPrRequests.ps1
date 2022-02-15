"`nThis will return a list of all open pull requests:"
$URI = "https://api.github.com/repos/$Env:GITHUB_REPOSITORY/pulls`n"
Write-Host $URI
$RESPONSE = Invoke-WebRequest -Uri $URI -Method Get -TimeoutSec 480
Write-Host $RESPONSE

"`n`nThis will return all pull requests of a specified state:"
$URI = "https://api.github.com/repos/$Env:GITHUB_REPOSITORY/pulls?state=$Env:PR_STATE`n"
Write-Host $URI
Write-Host "Access above link directly to read content."

"`n`nThis will return a specific pull request:"
$ID = $Env:GITHUB_REF_NAME -replace "/.*"
$URI = "https://api.github.com/repos/$Env:GITHUB_REPOSITORY/pulls/$ID`n"
Write-Host $URI
$RESPONSE = Invoke-WebRequest -Uri $URI -Method Get -TimeoutSec 480
Write-Host $RESPONSE

"`n`nAccessing variables from the object:"
$JSON_OBJECT = $RESPONSE | ConvertFrom-Json
Write-Host "HTML URL: ${ JSON_OBJECT.html_url }"
Write-Host "TITLE:" $JSON_OBJECT.title
Write-Host "BODY: ${ $JSON_OBJECT.body }"
Write-Host "BODY:" $JSON_OBJECT.user.login
