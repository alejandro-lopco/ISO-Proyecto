<#  - Menu de inicio de sesión con opción de crear cuenta
        o entrar como invitado, el inv no tendrá la opción de subir comentarios
    - Los usuarios estarán almacenados en el fich \Misc\usrData\Oriental.txt
        la estructuara <nom. Comp>#<nick>#<pass>#<mail>
    - El menu después de inciar sesión mostrará los hilos en orden de creación
        pero se añadiran 2 opciones de búsqueda por fecha o por tema
    - Los usuarios podrán añadir comentarios a temas, pero los temas son fijos
        la estructura <nick>#<fecha(dd/mm/yy)>#<cont. Com>

    - Buscar una manera de dibujar rectangulos
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
#Etiqueta Subprincipal
    $lblSubForo = New-Object System.Windows.Forms.Label
    $lblSubForo.Text = 'Comente y Opine'
    $lblSubForo.Font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::bold)
    $lblSubForo.Size = New-Object System.Drawing.Size(225,50)
    $lblSubForo.Location = New-Object System.Drawing.Point(25,75)
    $lblSubForo.ForeColor = 'Salmon'
    $foro.Controls.Add($lblSubForo)
#Etiqueta Busqueda
    $lblSearch = New-Object System.Windows.Forms.Label
    $lblSearch.Text = 'Busqueda: '
    $lblSearch.ForeColor = 'LightCyan'
    $lblSearch.Font = New-Object System.Drawing.Font("Arial",20,[System.Drawing.FontStyle]::bold)
    $lblSearch.Location = New-Object System.Drawing.Point(425,50)
    $lblSearch.Size = New-Object System.Drawing.Size(175,50)
    $foro.Controls.Add($lblSearch)
#Combo Opción Busqueda
    $opcSearch = New-Object System.Windows.Forms.ComboBox
    $opcSearch.Location = New-Object System.Drawing.Point(600,50)
    $opcSearch.Size = New-Object System.Drawing.Size(100,40)
    $opcSearch.Text = 'Opción'
    $opcSearch.Font = New-Object System.Drawing.Font("Arial",16,[System.Drawing.FontStyle]::bold)
    $opcSearch.Items.Add("Fecha") > $null
    $opcSearch.Items.Add("Tema") > $null
    $foro.Controls.Add($opcSearch)
#Input Valor Búsqueda
    $txtSearch = New-Object System.Windows.Forms.TextBox
    $txtSearch.Size = New-Object System.Drawing.Size(200,50)
    $txtSearch.Location = New-Object System.Drawing.Point(710,52)
    $foro.Controls.Add($txtSearch)

#Label Opción
    $lblOpc = New-Object System.Windows.Forms.Label
    $lblOpc.Text = 'Formato Fecha (DD/MM/AA)'
    <#Buscar manera de cambiar el valor de label en función de la opción escogida
        SIN tener que pulsar un botón#>
    $lblOpc.Size = New-Object System.Drawing.Size(175,20)
    $lblOpc.Location = New-Object System.Drawing.Point(710,35)
    $lblOpc.ForeColor = 'LightCyan'
    $foro.Controls.Add($lblOpc)
#Mostrar todo
$foro.ShowDialog()
