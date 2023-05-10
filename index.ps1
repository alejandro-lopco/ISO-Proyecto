#Menu De selección entre los 3 submenus, deberá tener 3 botones de grandes
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#Declaración de funciones
function fHoros {
    .\Apartados\Foro\foroLogin.ps1
}
function fPlant {
    .\Apartados\PlaceHolder.ps1
}
function  fForo {
    .\Apartados\PlaceHolder.ps1
}
function  fExit {
    $menu.Close()    
}
#Area pricipal
$menu = New-Object System.Windows.Forms.Form
$menu.Text = 'Menu principal'
$menu.StartPosition = 'centerscreen'
$menu.BackColor = 'Black'
$menu.Size = New-Object System.Drawing.Size(700,500)
#Label autor
$lblAut = New-Object System.Windows.Forms.Label
$lblAut.Text = 'Autor: Alejandro López Corral - 1ºASIR'
$lblAut.ForeColor = 'LightCyan'
$lblAut.Font = New-Object System.Drawing.Font("Arial",16,[System.Drawing.FontStyle]::bold)
$lblAut.Location = New-Object System.Drawing.Point(10,10)
$lblAut.Size = New-Object System.Drawing.Size(600,25)
$menu.Controls.Add($lblAut)
#Boton de acceso a otros menus
    #Horoscopo
$btHoros = New-Object System.Windows.Forms.Button
$btHoros.Location = New-Object System.Drawing.Point(50,50)
$btHoros.Size = New-Object System.Drawing.Size(150,300)
$btHoros.BackColor = 'MediumPurple'
$btHoros.Text = 'Horoscopo'
$btHoros.Add_Click({fHoros})
$menu.Controls.Add($btHoros)
    #Plantas Medicinales
$btPlant = New-Object System.Windows.Forms.Button
$btPlant.Text = 'Plantas'
$btPlant.BackColor = 'GreenYellow'
$btPlant.Size = New-Object System.Drawing.Size(150,300)
$btPlant.Location = New-Object System.Drawing.Point(275,50)
$btPlant.Add_Click({fPlant})
$menu.Controls.Add($btPlant)
    #Foro
$btForo = New-Object System.Windows.Forms.Button
$btForo.Text = 'Foro'
$btForo.BackColor = 'ForestGreen'
$btForo.Size = New-Object System.Drawing.Size(150,300)
$btForo.Location = New-Object System.Drawing.Point(500,50)
$btForo.Add_Click({fForo})
$menu.Controls.Add($btForo)
    #Salir
$btExit = New-Object System.Windows.Forms.Button
$btExit.Text = 'Salir'
$btExit.BackColor = 'Coral'
$btExit.Size = New-Object System.Drawing.Size(100,50)
$btExit.Location = New-Object System.Drawing.Point(300,375)
$btExit.Add_Click({fExit})
$menu.Controls.Add($btExit)
#Mostrar
$menu.ShowDialog()