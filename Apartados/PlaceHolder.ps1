Add-Type -AssemblyName system.windows.forms
Add-Type -AssemblyName system.drawing
#Menu
$plHold = New-Object System.Windows.Forms.Form
$plHold.Text = "PlaceHolder"
$plHold.Size = New-Object System.Drawing.Size(700,900)
$plHold.StartPosition= 'centerScreen'
#Etiqueta
$lblHold = New-Object System.Windows.Forms.Label
$lblHold.Location = New-Object System.Drawing.Point(20,10)
$lblHold.Size = New-Object System.Drawing.Size(600,40)
$lblHold.Font = New-Object System.Drawing.Font("Arial", 24,[system.drawing.fontstyle]::Bold)
$lblHold.Text = "PlaceHolder jiji :3"
$plHold.Controls.Add($lblHold)
#Imagen gato gracioso
$img = New-Object System.Windows.Forms.PictureBox
$img.Location = new-object System.Drawing.Point(20,50)
$img.Size = new-object System.Drawing.Size(100,100)
$gato = [System.Drawing.Image]::FromFile(".\Misc\img\GATO JONESY MMMMMMHHH.png")
$img.Width = $gato.Size.Width 
$img.Height = $gato.Size.Height 
$img.Image = $gato
$plHold.Controls.Add($img)
#Mostrar
$plHold.ShowDialog()
