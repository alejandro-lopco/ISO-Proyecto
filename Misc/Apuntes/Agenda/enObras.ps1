Add-Type -AssemblyName system.windows.forms
Add-Type -AssemblyName system.drawing

$fobras = New-Object System.Windows.Forms.Form
$fobras.Text = "En Obras"
$fobras.Size = New-Object System.Drawing.Size(300,200)
#$fobras.WindowState = 'max'
$fobras.StartPosition='centerScreen'

$mensaje = New-Object System.Windows.Forms.Label
$mensaje.Location = New-Object System.Drawing.Point(20,10)
$mensaje.Size = New-Object System.Drawing.Size(290,30)
$mensaje.Font = New-Object System.Drawing.Font("Arial", 10,[system.drawing.fontstyle]::Bold)
$mensaje.Text = "En construcción, perdonen las molestias"
$fobras.Controls.Add($mensaje)

$imagen = New-Object System.Windows.Forms.PictureBox
$imagen.Location = new-object System.Drawing.Point(20,50)
$imagen.Size = new-object System.Drawing.Size(100,100)
$img = [System.Drawing.Image]::FromFile("c:\scripts\obras1.jpeg")
$imagen.Width = $img.Size.Width 
$imagen.Height = $img.Size.Height 
$imagen.Image = $img
$fobras.Controls.Add($imagen)

Write-Host $img.Size.Width

$fobras.ShowDialog()