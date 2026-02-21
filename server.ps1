$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add('http://localhost:8080/')
$listener.Start()
Write-Host "Server running at http://localhost:8080/"

while ($true) {
    $context = $listener.GetContext()
    $path = $context.Request.Url.LocalPath
    if ($path -eq '/') { $path = '/index.html' }
    $file = "d:\Projects\My_first_project" + $path.Replace('/', '\')
    if (Test-Path $file) {
        $content = [System.IO.File]::ReadAllBytes($file)
        $context.Response.StatusCode = 200
        $context.Response.ContentLength64 = $content.Length
        $context.Response.OutputStream.Write($content, 0, $content.Length)
    } else {
        $context.Response.StatusCode = 404
    }
    $context.Response.OutputStream.Close()
}
