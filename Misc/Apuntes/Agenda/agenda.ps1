Add-Type -AssemblyName system.windows.forms
Add-Type -AssemblyName system.drawing

function guardar {
    $nombre = $txtNom.Text
    $telefono = $txtTel.Text
    $tipo = $combo.SelectedItem
    $registro = $nombre+"@"+$telefono+"@"+$tipo
    $registro | Out-File "c:\scripts\agenda.txt" -Append -encoding ascii
    C:\scripts\mensaje.ps1 $nombre 
}

#Instanciamos el objeto Formulario
$form = New-Object System.Windows.Forms.Form
#Ponemos contenido al título de la ventana
$form.Text = 'Saludo'
#Indicamos en que parte de la ventana del ordenador, se mostrará el formulario
$form.StartPosition = 'centerscreen'
#Damos tamaño al formulario (ancho, alto)
$form.Size = New-Object System.Drawing.Size(500,300)

#Creamos una etiqueta
$lblNom = New-Object System.Windows.Forms.Label
#La posicionamos dentro del formulario (distancia_al_borde_izquierdo, distancia_al_borde_superior)
$lblNom.Location = New-Object System.Drawing.Point(30,50)
#Damos tamaño a la etiqueta (ancho, alto)
$lblNom.Size = New-Object System.Drawing.Size(70,20)
#Texto de la etiqueta
$lblNom.Text = 'NOMBRE:'
#Añadimos la etiqueta al formulario
$form.Controls.Add($lblNom)

$txtNom = New-Object System.Windows.Forms.TextBox
$txtNom.Location = New-Object System.Drawing.Point(120,45)
$txtNom.Size = New-Object System.Drawing.Size(300,20)
$form.Controls.Add($txtNom)

$lblTel = New-Object System.Windows.Forms.Label
$lblTel.Location = New-Object System.Drawing.Point(30,95)
$lblTel.Size = New-Object System.Drawing.Size(70,20)
$lblTel.Text = 'TELEFONO:'
$form.Controls.Add($lblTel)

$txtTel = New-Object System.Windows.Forms.TextBox
$txtTel.Location = New-Object System.Drawing.Point(120,95)
$txtTel.Size = New-Object System.Drawing.Size(300,20)
$form.Controls.Add($txtTel)

$combo = New-Object System.Windows.Forms.ComboBox
$combo.Location = New-Object System.Drawing.Point(120,145)
$combo.Size = New-Object System.Drawing.Size(300,20)
$combo.Items.Add("Trabajo")
$combo.Items.Add("Amigo")
$combo.Items.Add("Familia")
$combo.Items.Add("Vecino")
$form.Controls.Add($combo)


$btEntrar = New-Object System.Windows.Forms.Button
$btEntrar.Location = New-Object System.Drawing.Point(80,200)
$btEntrar.Size = New-Object System.Drawing.Size(150,20)
$btEntrar.Text = 'GUARDAR'
$form.Controls.Add($btEntrar)
$btEntrar.add_click({guardar})


$btSalir = New-Object System.Windows.Forms.Button
$btSalir.Location = New-Object System.Drawing.Point(270,200)
$btSalir.Size = New-Object System.Drawing.Size(150,20)
$btSalir.Text = "SALIR"
$form.Controls.Add($btSalir)

$lblMensaje = New-Object System.Windows.Forms.Label
$lblMensaje.Location = New-Object System.Drawing.Point(120,130)
$lblMensaje.Size = New-Object System.Drawing.Size(250,20)
$lblMensaje.Font = New-Object System.Drawing.Font("Arial",12,[system.drawing.fontstyle]::bold)

$lblMensaje.ForeColor = 'white'
$lblMensaje.Text = ''
$form.Controls.Add($lblMensaje)

$form.ShowDialog()