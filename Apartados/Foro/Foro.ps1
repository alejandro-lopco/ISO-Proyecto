<#  - Menu de inicio de sesión con opción de crear cuenta
        o entrar como invitado, el inv no tendrá la opción de subir comentarios
    - Los usuarios estarán almacenados en el fich \Misc\usrData\Oriental.txt
        la estructuara <nick>#<nom. Comp>#<pass>#<mail>
    - El menu después de inciar sesión mostrará los hilos en orden de creación
        pero se añadiran 2 opciones de búsqueda por fecha o por tema
    - Los usuarios podrán añadir comentarios a temas, pero los temas son fijos
        la estructura <Tema>#<Id. Post>#<nick>#<fecha(dd/mm/yy)>#<cont. Com>
        (Los posts creo que van a ir mejor si hago una tabla hash)

    - Buscar una manera de dibujar rectangulos
        o si no directamente juega con el color del fondo 
#>
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#Declaración de funciones
    # Area principal
    $foro = New-Object System.Windows.Forms.Form
    $foro.Text = 'Foro'
    $foro.Size = New-Object System.Drawing.Size(1600,1000)
    $foro.StartPosition = 'centerscreen'
    $foro.BackColor = 'Black'
    $nick = $args[0]
function main {
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
}
function userGreet {
    #Etiqueta de saludo
        $lblGreet = New-Object System.Windows.Forms.Label
        $lblGreet.Text = 'Bienvenido '
        $lblGreet.ForeColor = 'LightCyan'
        $lblGreet.Font = New-Object System.Drawing.Font("Arial",16,[System.Drawing.FontStyle]::bold)
        $lblGreet.Location = New-Object System.Drawing.Point(25,150)
        $lblGreet.Size = New-Object System.Drawing.Size(130,50)
        $foro.Controls.Add($lblGreet)
    #Etiqueta Nick del login
        $lbluser = New-Object System.Windows.Forms.Label
        $lbluser.Text = $nick
        $lbluser.ForeColor = 'Salmon'
        $lbluser.Font = New-Object System.Drawing.Font("Arial",16,[System.Drawing.FontStyle]::bold)
        $lbluser.Location = New-Object System.Drawing.Point(150,150)
        $lbluser.Size = New-Object System.Drawing.Size(100,50)
        $foro.Controls.Add($lbluser)
    # Botón para cambiar de usuario
        $btUser = New-Object System.Windows.Forms.Button
        $btUser.Text = 'Cambiar de usuario'
        $btUser.Size = New-Object System.Drawing.Size(200,45)
        $btUser.Location = New-Object System.Drawing.Point(25,200)
        $btUser.BackColor = 'White'
        $btUser.Add_Click({ 
            $foro.Close()
            .\Apartados\Foro\foroLogin.ps1 
        })
        $foro.Controls.Add($btUser)
}
function loadData {
        $usuarios = @{}
        foreach ($registroUser in Get-Content ".\Misc\usrData\Oriental.txt") {
            $valoresUser= @()
            $camposUser = $registroUser.Split("#")
            for ($i = 1; $i -lt 4; $i++) {
                $valoresUser += $camposUser[$i]
            }
            $usuarios[$camposUser[0]] = $valoresUser
        }
        $posts = @{}
        foreach ($registroPosts in Get-Content ".\Misc\usrData\Posts.txt") {
            $valoresPosts = @()
            $camposPosts = $registroPosts.Split("#")
            for ($j = 1; $j -lt 5; $j++) {
                $valoresPosts += $camposPosts[$j]
            }
            $posts[[int]$camposPosts[0]] = $valoresPosts
        }
}
function search {
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
        $btSearch.Add_Click({ 
    <#
        1º Comprobar el modo de busqueda
        2º Revisar el archivo y ver si la fecha es igual al input (for)
        3º Si coincide añadirlo a la tabla has $resSearch con sus datos
            en el array $valoresSearch
    #>
            if ($opcSearch.SelectedItem -ieq 'Tema') {
                $search = @{}
                foreach ($datos in Get-Content ".\Misc\usrData\Posts.txt") {
                    $linea = @()
                    $catPost = $datos.Split("#")
                    for ($i = 0; $i -lt 5; $i++) {
                        if ($catPost[1] -ieq $txtSearch.Text) {
                            $linea += $catPost[$i]
                        }
                    }
                    $search[[int]$camposAsig[0]] = $linea
                }
            } else {
                $search = @{}
                foreach ($datos in Get-Content ".\Misc\usrData\Posts.txt") {
                    $linea = @()
                    $catPost = $datos.Split("#")
                    for ($i = 0; $i -lt 5; $i++) {
                        if ($catPost[3] -ieq $txtSearch.Text) {
                            $linea += $catPost[$i]
                        }
                    }
                    $search[[int]$catPost[0]] = $linea
                }
            }
            for ($i = 0; $i -lt $search.Count; $i++) {
                Write-Host ( "ID: " + $search[$i] )
                Write-Host ( "Tema: " + $search[$i][1] )
                Write-Host ( "Nick: " + $search[$i][2] )
                Write-Host ( "Fecha: " + $search[$i][3] )
                Write-Host ( "Comentario:  " + $search[$i][4] )
                Write-Host ( "-------------" )
            }
        })
        $foro.Controls.Add($btSearch)
}
function searchEngine {
    
}
function addComm {
    <#
    $temporal = @{ 'tormonso18'=('sonia','torres','montero','embajadores, 14','656879220',3,2,4);
    'marserlu17'=('luis','martin','serrano','fuentecilla, 33','936863301',1,4,5);
    'alvberro19'=('rocio','alvarez','bermejo','calatrava, 2','626854991',3,5,7);
    'huemolpe17'=('pedro','huerta','molina','don pedro, 15','912896355',2,10,5);
    'marrocpa15'=('pablo','marmol','roca','la pedriza, 7','915896600',1,9,2);
    'berrojma16'=('maria','bermejo','rojo','antonio lopez, 120','916301213',1,3,6);
    'rammarru18'=('ruben','ramos','martinez','o donnell, 30','917546494',3,10,7);
    'suatorra16'=('raul','suarez','torres','camarena, 34','916253880',10,1,2);
    'berrojan18'=('antonio','bermejo','rojo','antonio lopez, 120','916301213',2,4,5)
}
foreach ($ele in $temporal.Keys) {
    $registro = ($ele + ":" + 
        $temporal[$ele][0] + ":" + 
        $temporal[$ele][1] + ":" + 
        $temporal[$ele][2] + ":" + 
        $temporal[$ele][3] + ":" +
        $temporal[$ele][4] + ":" +
        $temporal[$ele][5] + ":" +
        $temporal[$ele][6] + ":" +
        $temporal[$ele][7] + ":")
    $registro | Out-File ".\alumnos2\usuarios.txt" -Append -Encoding utf8
}
    Me puede servir para crear posts y añadirlos al fichero de posts.txt
    #>
}
function temasYSubmenu {
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
    # Submenu para otros apartados
        $lblMenu = New-Object System.Windows.Forms.Label
        $lblMenu.Text = 'Accede a: '
        $lblMenu.ForeColor = 'LightCyan'
        $lblMenu.Font = New-Object System.Drawing.Font("Arial",20,[System.Drawing.FontStyle]::bold)
        $lblMenu.Location = New-Object System.Drawing.Point(1110,500)
        $lblMenu.Size = New-Object System.Drawing.Size(300,50)
        $foro.Controls.Add($lblMenu)
    #Botones para otros apartados
        #Horoscopo
            $btHoros = New-Object System.Windows.Forms.Button
            $btHoros.Text = 'Horóscopo'
            $btHoros.Size = New-Object System.Drawing.Size(400,90)
            $btHoros.Location = New-Object System.Drawing.Point(1120, 575)
            $btHoros.BackColor = 'SpringGreen'
            $btHoros.Add_Click({ .\Apartados\PlaceHolder.ps1 })
            $foro.Controls.Add($btHoros)
        #Plantas
            $btPlants = New-Object System.Windows.Forms.Button
            $btPlants.Text = 'Plantas Medicinales'
            $btPlants.Size = New-Object System.Drawing.Size(400,90)
            $btPlants.Location = New-Object System.Drawing.Point(1120, 675)
            $btPlants.BackColor = 'YellowGreen'
            $btPlants.Add_Click({ .\Apartados\PlaceHolder.ps1 })
            $foro.Controls.Add($btPlants)
        #Salir
            $btExit = New-Object System.Windows.Forms.Button
            $btExit.Text = 'SALIR'
            $btExit.Size = New-Object System.Drawing.Size(400,90)
            $btExit.Location = New-Object System.Drawing.Point(1120, 775)
            $btExit.BackColor = 'Salmon'
            $btExit.Add_Click({ $foro.Close() })
            $foro.Controls.Add($btExit)
    }
loadData
main
userGreet
search
temasYSubmenu
#Mostrar todo
$foro.ShowDialog()
