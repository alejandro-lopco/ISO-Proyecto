Add-Type -AssemblyName system.windows.forms
Add-Type -AssemblyName system.drawing

$nom = $args[0]
$fcorrecto = New-Object System.Windows.Forms.Form
$fcorrecto.Text = "Verificar Alta"
$fcorrecto.Size = New-Object System.Drawing.Size(300,150)
$fcorrecto.StartPosition='centerScreen'

$lblAlta = New-Object System.Windows.Forms.Label
$lblAlta.Location = New-Object System.Drawing.Point(50,50)
$lblAlta.Size = New-Object System.Drawing.Size(200,30)
$lblAlta.Text = $nom + " guardado en la agenda"
$fcorrecto.Controls.Add($lblAlta)
    
$fcorrecto.ShowDialog()
 