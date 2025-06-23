param (
    [string]$text = "Dev stuff",
    [string]$type = "Playing"
)

Invoke-RestMethod -Uri "http://192.168.1.54:3030/set-status" `
    -Method Post `
    -Body (@{ text = $text; type = $type } | ConvertTo-Json) `
    -ContentType "application/json"