<#  - Menu de inicio de sesión con opción de crear cuenta
        o entrar como invitado, el inv no tendrá la opción de subir comentarios
    - Los usuarios estarán almacenados en el fich \Misc\usrData\Oriental.txt
        la estructuara <nom. Comp>#<nick>#<pass>#<mail>
    - El menu después de inciar sesión mostrará los hilos en orden de creación
        pero se añadiran 2 opciones de búsqueda por fecha o por tema
    - Los usuarios podrán añadir comentarios a temas, pero los temas son fijos
        la estructura <Tema>#<Id. Post>#<nick>#<fecha(dd/mm/yy)>#<cont. Com>
        (Los posts creo que van a ir mejor si hago una tabla hash)

    - Buscar una manera de dibujar rectangulos
        o si no directamente juega con el color del fondo 
#>
<#
        foreach ($registro in Get-Content .\Misc\usrData\Posts.txt) {
            $campos = $registro.Split('#')
            $tema = $campos[0]
            $nick = $campos[1]
            $fecha = $campos[2]
            $cont = $campos[3]
            $spacing = 75
            for ($i = 0; $i -lt $tema.Count; $i++) {
                #Label Tema
                    Write-Host $tema
                    $lblTema = New-Object System.Windows.Forms.Label
                    $lblTema.Text = $tema
                    $lblTema.ForeColor = 'LightGreen'
                    $lblTema.Font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::bold)
                    $lblTema.Location = New-Object System.Drawing.Point(1100,$spacing)
                    $lblTema.Size = New-Object System.Drawing.Size(300,50)
                    $foro.Controls.Add($lblTema)
            }
        }

        Esta función recorre el archivo de post y los intenta mostrar,
            creo que no va por la variable $spacing
#>
<#
    function loadArray {
        $alumnos = @{}
        foreach ($registroAlum in Get-Content ".\alumnos\alumnos.txt") {
            $valoresAlum= @()
            $camposAlum = $registroAlum.Split(":")
            for ($i = 1; $i -lt 8; $i++) {
                $valoresAlum += $camposAlum[$i]
            }
            $alumnos[$camposAlum[0]] = $valoresAlum
        }
        $asignaturas = @{}
        foreach ($registroAsig in Get-Content ".\alumnos\asignaturas.txt") {
            $valoresAsig = @()
            $camposAsig = $registroAsig.Split(":")
            for ($j = 1; $j -lt 3; $j++) {
                $valoresAsig += $camposAsig[$j]
            }
            $asignaturas[[int]$camposAsig[0]] = $valoresAsig
        }
    }
    
    Esta función me puede servir para cargar los datos del archivo posts.txt
        solo hay que adapatarla
#>
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#Declaración de funciones
    function postDisplay {
        
    }
    function search {
        <#
        
        #>
    }
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
#Botón de buscar
    $btSearch = New-Object System.Windows.Forms.Button
    $btSearch.Text = 'Buscar'
    $btSearch.Size = New-Object System.Drawing.Size(75,37)
    $btSearch.Location = New-Object System.Drawing.Point(925, 45)
    $btSearch.BackColor = 'White'
    $btSearch.Add_Click({ search })
    $foro.Controls.Add($btSearch)
#Label Temas Disponibles
    $lblTemas = New-Object System.Windows.Forms.Label
    $lblTemas.Text = 'Temas Disponibles : '
    $lblTemas.ForeColor = 'LightGreen'
    $lblTemas.Font = New-Object System.Drawing.Font("Arial",20,[System.Drawing.FontStyle]::bold)
    $lblTemas.Location = New-Object System.Drawing.Point(1100,50)
    $lblTemas.Size = New-Object System.Drawing.Size(300,50)
    $foro.Controls.Add($lblTemas)
#Lista Temas Disponibles
    #1
    $lblTema1 = New-Object System.Windows.Forms.Label
    $lblTema1.Text = 'Deportes'
    $lblTema1.ForeColor = 'LightGreen'
    $lblTema1.Font = New-Object System.Drawing.Font("Arial",16,[System.Drawing.FontStyle]::bold)
    $lblTema1.Location = New-Object System.Drawing.Point(1125,150)
    $lblTema1.Size = New-Object System.Drawing.Size(300,50)
    $foro.Controls.Add($lblTema1)
    #2
    $lblTema1 = New-Object System.Windows.Forms.Label
    $lblTema1.Text = 'Noticias'
    $lblTema1.ForeColor = 'LightGreen'
    $lblTema1.Font = New-Object System.Drawing.Font("Arial",16,[System.Drawing.FontStyle]::bold)
    $lblTema1.Location = New-Object System.Drawing.Point(1125,200)
    $lblTema1.Size = New-Object System.Drawing.Size(300,50)
    $foro.Controls.Add($lblTema1)
    #3
    $lblTema1 = New-Object System.Windows.Forms.Label
    $lblTema1.Text = 'Preguntas'
    $lblTema1.ForeColor = 'LightGreen'
    $lblTema1.Font = New-Object System.Drawing.Font("Arial",16,[System.Drawing.FontStyle]::bold)
    $lblTema1.Location = New-Object System.Drawing.Point(1125,250)
    $lblTema1.Size = New-Object System.Drawing.Size(300,50)
    $foro.Controls.Add($lblTema1)
    #4
    $lblTema1 = New-Object System.Windows.Forms.Label
    $lblTema1.Text = 'Tecnología'
    $lblTema1.ForeColor = 'LightGreen'
    $lblTema1.Font = New-Object System.Drawing.Font("Arial",16,[System.Drawing.FontStyle]::bold)
    $lblTema1.Location = New-Object System.Drawing.Point(1125,300)
    $lblTema1.Size = New-Object System.Drawing.Size(300,50)
    $foro.Controls.Add($lblTema1)
    #5
    $lblTema1 = New-Object System.Windows.Forms.Label
    $lblTema1.Text = 'Opinion'
    $lblTema1.ForeColor = 'LightGreen'
    $lblTema1.Font = New-Object System.Drawing.Font("Arial",16,[System.Drawing.FontStyle]::bold)
    $lblTema1.Location = New-Object System.Drawing.Point(1125,350)
    $lblTema1.Size = New-Object System.Drawing.Size(300,50)
    $foro.Controls.Add($lblTema1)
#Mostrar todo
$foro.ShowDialog()
