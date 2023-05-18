Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
# Declaración de funciones
function mainPlant {
    #Etiqueta Principal
        $lblPlant = New-Object System.Windows.Forms.Label
        $lblPlant.Text = 'Plantas'
        $lblPlant.Font = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::bold)
        $lblPlant.Size = New-Object System.Drawing.Size(500, 55)
        $lblPlant.Location = New-Object System.Drawing.Point(25, 25)
        $lblPlant.ForeColor = 'LightCyan'
        $plant.Controls.Add($lblPlant)
    #Etiqueta Subprincipal
        $lblSubPlant = New-Object System.Windows.Forms.Label
        $lblSubPlant.Text = 'Si se siente raro'
        $lblSubPlant.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::bold)
        $lblSubPlant.Size = New-Object System.Drawing.Size(225, 50)
        $lblSubPlant.Location = New-Object System.Drawing.Point(25, 80)
        $lblSubPlant.ForeColor = 'Salmon'
        $plant.Controls.Add($lblSubPlant)
}
function subMenus {
    #Botones para otros apartados
        # Foro
            $btForo = New-Object System.Windows.Forms.Button
            $btForo.Text = 'Foro'
            $btForo.Size = New-Object System.Drawing.Size(400, 90)
            $btForo.Location = New-Object System.Drawing.Point(1120, 575)
            $btForo.BackColor = 'SpringGreen'
            $btForo.Add_Click({ .\Apartados\Foro\foroLogin.ps1 })
            $plant.Controls.Add($btForo)
        # Horóscopo
            $btHoro = New-Object System.Windows.Forms.Button
            $btHoro.Text = 'Horóscopo'
            $btHoro.Size = New-Object System.Drawing.Size(400, 90)
            $btHoro.Location = New-Object System.Drawing.Point(1120, 675)
            $btHoro.BackColor = 'YellowGreen'
            $btHoro.Add_Click({ .\Apartados\Horoscopo\Horoscopo.ps1 })
            $plant.Controls.Add($btHoro)
        # Salir
            $btExit = New-Object System.Windows.Forms.Button
            $btExit.Text = 'SALIR'
            $btExit.Size = New-Object System.Drawing.Size(400, 90)
            $btExit.Location = New-Object System.Drawing.Point(1120, 775)
            $btExit.BackColor = 'Salmon'
            $btExit.Add_Click({ $plant.Close() })
            $plant.Controls.Add($btExit)
    }
# Area Pricipal
    $plant = New-Object System.Windows.Forms.Form
    $plant.Text = 'Plantas Medicnales'
    $plant.Size = New-Object System.Drawing.Size(1600, 1000)
    $plant.StartPosition = 'centerscreen'
    $plant.BackColor = 'Black'
# Menu Dolencia
    # Etiqueta Dolencias
        $lblDol = New-Object System.Windows.Forms.Label
        $lblDol.Text = 'Escoga la dolencia que esté sufriendo'
        $lblDol.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::bold)
        $lblDol.Size = New-Object System.Drawing.Size(225, 50)
        $lblDol.Location = New-Object System.Drawing.Point(25, 150)
        $lblDol.ForeColor = 'DodgerBlue'
        $plant.Controls.Add($lblDol)
    # Lista Dolencias
        $listaDol = New-Object System.Windows.Forms.Listbox
    # Boton Dolencias
        $btDol = New-Object System.Windows.Forms.Button
# Inizialicación de funciones
    mainPlant
    subMenus
# Mostrar Todo
    $plant.ShowDialog()