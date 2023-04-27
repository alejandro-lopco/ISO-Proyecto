#Menu De selección entre los 3 submenus, deberá tener 3 botones de grandes
    #Intentar buscar una manera de poner una imagen de fondo en el botón
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

#Estructura del menu pricipal
$menu = New-Object System.Windows.Forms.Form
$menu.Text = 'Menu principal'
$menu.StartPosition = 'centerscreen'
$menu.Size = New-Object System.Drawing.Size(700,500)
#Boton de acceso a otros menus
$btHoros = New-Object System.Windows.Forms.Button
$btHoros.Location = New-Object System.Drawing.Point(75,50)
$btHoros.Size = New-Object System.Drawing.Size(150,300)
$btHoros.Text = 'Horoscopo'
$menu.Controls.Add($btHoros)
#Mostrar
$menu.ShowDialog()