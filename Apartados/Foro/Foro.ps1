<#  - Menu de inicio de sesión con opción de crear cuenta
        o entrar como invitado, el inv no tendrá la opción de subir comentarios
    - Los usuarios estarán almacenados en el fich \Misc\usrData\Oriental.txt
        la estructuara <nom. Comp>#<nick>#<pass>#<mail>
    - El menu después de inciar sesión mostrará los hilos en orden de creación
        pero se añadiran 2 opciones de búsqueda por fecha o por tema
    - Los usuarios podrán añadir comentarios a temas, pero los temas son fijos
        la estructura <nick>#<fecha(dd/mm/yy)>#<cont. Com>
#>
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
# Area principal
$foro = New-Object System.Windows.Forms.Form
$foro.Text = 'Foro'
$foro.Size = New-Object System.Drawing.Size(1600,1000)
$foro.StartPosition = 'centerscreen'
$foro.BackColor = 'Black'
#Etiqueta principal
$lblForo = New-Object System.Windows.Forms.Label
$lblForo.Text = 'Foro'
$lblForo.Font = New-Object System.Drawing.Font("Arial",36,[System.Drawing.FontStyle]::bold)
$lblForo.Size = New-Object System.Drawing.Size(150,50)
$lblForo.Location = New-Object System.Drawing.Point(25,25)
$lblForo.ForeColor = 'LightCyan'
$foro.Controls.Add($lblForo)
#Mostrar todo
$foro.ShowDialog()
