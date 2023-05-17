Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#   Declaración de funciones
function main {
    #Etiqueta principal
        $lblHoro = New-Object System.Windows.Forms.Label
        $lblHoro.Text = 'Horóscopo'
        $lblHoro.Font = New-Object System.Drawing.Font("Arial",36,[System.Drawing.FontStyle]::bold)
        $lblHoro.Size = New-Object System.Drawing.Size(500,55)
        $lblHoro.Location = New-Object System.Drawing.Point(25,25)
        $lblHoro.ForeColor = 'LightCyan'
        $horo.Controls.Add($lblHoro)
    #Etiqueta Subprincipal
        $lblSubHoro = New-Object System.Windows.Forms.Label
        $lblSubHoro.Text = 'Mire y Pruebe'
        $lblSubHoro.Font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::bold)
        $lblSubHoro.Size = New-Object System.Drawing.Size(225,50)
        $lblSubHoro.Location = New-Object System.Drawing.Point(25,75)
        $lblSubHoro.ForeColor = 'Salmon'
        $horo.Controls.Add($lblSubHoro)
}
function curDate {
    #Etiqueta principal
        $lblGreet = New-Object System.Windows.Forms.Label
        $lblGreet.Text = 'La fecha actual es: '
        $lblGreet.ForeColor = 'LightCyan'
        $lblGreet.Font = New-Object System.Drawing.Font("Arial",16,[System.Drawing.FontStyle]::bold)
        $lblGreet.Location = New-Object System.Drawing.Point(25,150)
        $lblGreet.Size = New-Object System.Drawing.Size(210,50)
        $horo.Controls.Add($lblGreet)
    #Etiqueta Fecha
        [string]$date = Get-Date -Format 'dd/MM/yyyy'
        $lbldate = New-Object System.Windows.Forms.Label
        $lbldate.Text = $date
        $lbldate.ForeColor = 'Salmon'
        $lbldate.Font = New-Object System.Drawing.Font("Arial",16,[System.Drawing.FontStyle]::bold)
        $lbldate.Location = New-Object System.Drawing.Point(25,200)
        $lbldate.Size = New-Object System.Drawing.Size(200,50)
        $horo.Controls.Add($lbldate)
}
function Occidental {
    # Etiqueta Principal
}
function Chino {
    # Etiqueta Principal
}
function Numero {
    # Etiqueta Principal
}
function subMenus {
    #Botones para otros apartados
        # Foro
            $btForo = New-Object System.Windows.Forms.Button
            $btForo.Text = 'Foro'
            $btForo.Size = New-Object System.Drawing.Size(400,90)
            $btForo.Location = New-Object System.Drawing.Point(1120, 575)
            $btForo.BackColor = 'SpringGreen'
            $btForo.Add_Click({ .\Apartados\Foro\foroLogin.ps1 })
            $horo.Controls.Add($btForo)
        # Plantas
            $btPlants = New-Object System.Windows.Forms.Button
            $btPlants.Text = 'Plantas Medicinales'
            $btPlants.Size = New-Object System.Drawing.Size(400,90)
            $btPlants.Location = New-Object System.Drawing.Point(1120, 675)
            $btPlants.BackColor = 'YellowGreen'
            $btPlants.Add_Click({ .\Apartados\Plantas\Plantas.ps1 })
            $horo.Controls.Add($btPlants)
        # Salir
            $btExit = New-Object System.Windows.Forms.Button
            $btExit.Text = 'SALIR'
            $btExit.Size = New-Object System.Drawing.Size(400,90)
            $btExit.Location = New-Object System.Drawing.Point(1120, 775)
            $btExit.BackColor = 'Salmon'
            $btExit.Add_Click({ $horo.Close() })
            $horo.Controls.Add($btExit)
}
# Area Principal
    $horo = New-Object System.Windows.Forms.Form
    $horo.Text = 'Foro'
    $horo.Size = New-Object System.Drawing.Size(1600,1000)
    $horo.StartPosition = 'centerscreen'
    $horo.BackColor = 'Black'
# Inicialización de Menus
    main
    curDate
    Occidental
    Chino
    Numero
    subMenus
# Mostrar todo
    $horo.ShowDialog()