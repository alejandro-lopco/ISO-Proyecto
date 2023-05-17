<#  - Menu de inicio de sesión con opción de crear cuenta
        o entrar como invitado, el inv no tendrá la opción de subir comentarios
    - Los usuarios estarán almacenados en el fich \Misc\usrData\Oriental.txt
        la estructuara <nick>#<nom. Comp>#<pass>#<mail>
    - El menu después de inciar sesión mostrará los hilos en orden de creación
        pero se añadiran 2 opciones de búsqueda por fecha o por tema
    - Los usuarios podrán añadir comentarios a temas, pero los temas son fijos
        la estructura <Tema>#<Id. Post>#<nick>#<fecha(dd/mm/yy)>#<cont. Com>
        (Los posts creo que van a ir mejor si hago una tabla hash y
            meto todo el contenido de posts.txt ahí dentro)
#>
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#Declaración de funciones
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
        $lblOpc.Text = 'Formato Fecha (AAAA-MM-DD)'
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
        $btSearch.Add_Click({ })
        $foro.Controls.Add($btSearch)
}
function postDisplay {
    #Etiqueta de posts
        $lblPosts = New-Object System.Windows.Forms.Label
        $lblPosts.Text = 'Últimos Hilos'
        $lblPosts.Font = New-Object System.Drawing.Font("Arial",18,[System.Drawing.FontStyle]::bold)
        $lblPosts.Size = New-Object System.Drawing.Size(175,30)
        $lblPosts.Location = New-Object System.Drawing.Point(350,130)
        $lblPosts.ForeColor = 'LightGreen'
        $foro.Controls.Add($lblPosts)
        #Plantilla de post
            #Deportes
                $lblDep = New-Object System.Windows.Forms.Label
                $lblDep.Text = 'Deportes'
                $lblDep.Font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::bold)
                $lblDep.Size = New-Object System.Drawing.Size(100,30)
                $lblDep.Location = New-Object System.Drawing.Point(390,185)
                $lblDep.ForeColor = 'LightGreen'
                $foro.Controls.Add($lblDep)
                #Comentario
                    $lblDepCom = New-Object System.Windows.Forms.Label
                    $lblDepCom.Text = 'Si Alonso no gana una este año dejo el grado'
                    $lblDepCom.Size = New-Object System.Drawing.Size(400,20)
                    $lblDepCom.Location = New-Object System.Drawing.Point(500,210)
                    $lblDepCom.ForeColor = 'LightGreen'
                    $foro.Controls.Add($lblDepCom)
            #Noticias
                $lblNot = New-Object System.Windows.Forms.Label
                $lblNot.Text = 'Noticias'
                $lblNot.Font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::bold)
                $lblNot.Size = New-Object System.Drawing.Size(100,30)
                $lblNot.Location = New-Object System.Drawing.Point(390,235)
                $lblNot.ForeColor = 'LightGreen'
                $foro.Controls.Add($lblNot)
                #Comentario
                    $lblNotCom = New-Object System.Windows.Forms.Label
                    $lblNotCom.Text = 'ULTIMA HORA | me duele la tripa'
                    $lblNotCom.Size = New-Object System.Drawing.Size(400,20)
                    $lblNotCom.Location = New-Object System.Drawing.Point(500,265)
                    $lblNotCom.ForeColor = 'LightGreen'
                    $foro.Controls.Add($lblNotCom)
            #Preguntas
                $lblAsk = New-Object System.Windows.Forms.Label
                $lblAsk.Text = 'Preguntas'
                $lblAsk.Font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::bold)
                $lblAsk.Size = New-Object System.Drawing.Size(175,30)
                $lblAsk.Location = New-Object System.Drawing.Point(390,285)
                $lblAsk.ForeColor = 'LightGreen'
                $foro.Controls.Add($lblAsk)
                    #Comentario
                        $lblAskCom = New-Object System.Windows.Forms.Label
                        $lblAskCom.Text = 'JavaScript ¿Desarrolo web o tortura china?'
                        $lblAskCom.Size = New-Object System.Drawing.Size(400,20)
                        $lblAskCom.Location = New-Object System.Drawing.Point(500,315)
                        $lblAskCom.ForeColor = 'LightGreen'
                        $foro.Controls.Add($lblAskCom)
            #Tecnología
                $lblTech = New-Object System.Windows.Forms.Label
                $lblTech.Text = 'Tecnología'
                $lblTech.Font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::bold)
                $lblTech.Size = New-Object System.Drawing.Size(175,30)
                $lblTech.Location = New-Object System.Drawing.Point(390,335)
                $lblTech.ForeColor = 'LightGreen'
                $foro.Controls.Add($lblTech)
                    #Comentario
                        $lblTechCom = New-Object System.Windows.Forms.Label
                        $lblTechCom.Text = 'Le has hecho rm -f al repositorio ¿Ahora qué?'
                        $lblTechCom.Size = New-Object System.Drawing.Size(400,20)
                        $lblTechCom.Location = New-Object System.Drawing.Point(500,365)
                        $lblTechCom.ForeColor = 'LightGreen'
                        $foro.Controls.Add($lblTechCom)
            #Opinión
                $lblOpi = New-Object System.Windows.Forms.Label
                $lblOpi.Text = 'Opinión'
                $lblOpi.Font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::bold)
                $lblOpi.Size = New-Object System.Drawing.Size(175,30)
                $lblOpi.Location = New-Object System.Drawing.Point(390,395)
                $lblOpi.ForeColor = 'LightGreen'
                $foro.Controls.Add($lblOpi)
                    #Comentario
                        $lblOpiCom = New-Object System.Windows.Forms.Label
                        $lblOpiCom.Text = '¿Es VSC la mejor cosa desde el pan bimbo?'
                        $lblOpiCom.Size = New-Object System.Drawing.Size(400,20)
                        $lblOpiCom.Location = New-Object System.Drawing.Point(500,425)
                        $lblOpiCom.ForeColor = 'LightGreen'
                        $foro.Controls.Add($lblOpiCom)
}
function btCrearPost {
    # Etiqueta Confirmación 
        $lblConfCreate = New-Object System.Windows.Forms.Label
        $lblConfCreate.Text = 'Post'
        $lblConfCreate.Size = New-Object System.Drawing.Size(500,300)
        $lblConfCreate.Location = New-Object System.Drawing.Point(390,720)
        $lblConfCreate.Font = New-Object System.Drawing.Font("Arial",18,[System.Drawing.FontStyle]::bold)
        $lblConfCreate.ForeColor = 'plum'
        $foro.Controls.Add($lblConfCreate)
    # Extraer información
        [string]$tema = $opcTema.SelectedItem
        [string]$fecha = Get-Date -Format "dd/MM/yyyy"
            Write-Host $fecha
        [string]$comentario = $txtCom.Text
            Write-Host $comentario
        $idMin = 0
        foreach ($registroPosts in Get-Content .\Misc\usrData\Posts.txt) {
            $idMin += 1
        }
        [string]$id = $idMin + 1
            Write-Host $id
    # Añadir información
        [string]$post = $id+"#"+$tema+"#"+$nick+"#"+$fecha+"#"+$comentario
        $post | Out-File ".\Misc\usrData\Posts.txt" -Append -Encoding utf8
        $lblConfCreate.Text = (
            '-Post Creado-'+
            ' // ID: '+ $id +
            ' // Tema: '+ $tema +
            ' // Nick: '+ $nick +
            ' // Fecha: '+ $fecha +
            ' // Comentario: '+ $comentario
            )
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
            $btHoros.Add_Click({ .\Apartados\Horoscopo\Horoscopo.ps1 })
            $foro.Controls.Add($btHoros)
        #Plantas
            $btPlants = New-Object System.Windows.Forms.Button
            $btPlants.Text = 'Plantas Medicinales'
            $btPlants.Size = New-Object System.Drawing.Size(400,90)
            $btPlants.Location = New-Object System.Drawing.Point(1120, 675)
            $btPlants.BackColor = 'YellowGreen'
            $btPlants.Add_Click({ .\Apartados\Plantas\Plantas.ps1 })
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
# Area principal
    $foro = New-Object System.Windows.Forms.Form
    $foro.Text = 'Foro'
    $foro.Size = New-Object System.Drawing.Size(1600,1000)
    $foro.StartPosition = 'centerscreen'
    $foro.BackColor = 'Black'
    $nick = $args[0]
# Inicialización de Menus
    loadData
    main
    userGreet
    search
    postDisplay
    temasYSubmenu
# Crear Post
    #Etiqueta Principal
    $lblCreate = New-Object System.Windows.Forms.Label
    $lblCreate.Text = 'Últimos Hilos'
    $lblCreate.Font = New-Object System.Drawing.Font("Arial",18,[System.Drawing.FontStyle]::bold)
    $lblCreate.Size = New-Object System.Drawing.Size(175,30)
    $lblCreate.Location = New-Object System.Drawing.Point(350,475)
    $lblCreate.ForeColor = 'LightCyan'
    $foro.Controls.Add($lblCreate)
        # Etiquetas Inputs Campos
            # Tema
            $lblTema = New-Object System.Windows.Forms.Label
            $lblTema.Text = 'Tema:'
            $lblTema.Font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::bold)
            $lblTema.Size = New-Object System.Drawing.Size(125,30)
            $lblTema.Location = New-Object System.Drawing.Point(390,520)
            $lblTema.ForeColor = 'LightCyan'
            $foro.Controls.Add($lblTema)
            # Etiqueta explicacion
            $lblExp = New-Object System.Windows.Forms.Label
            $lblExp.Text = 'CLICK PARA CONFIRMAR EL TEMA'
            $lblExp.Size = New-Object System.Drawing.Size(200,40)
            $lblExp.Location = New-Object System.Drawing.Point(700,525)
            $lblExp.ForeColor = 'LightCyan'
            $foro.Controls.Add($lblExp)
            # Comentario
            $lblCom = New-Object System.Windows.Forms.Label
            $lblCom.Text = 'Comentario:'
            $lblCom.Font = New-Object System.Drawing.Font("Arial",14,[System.Drawing.FontStyle]::bold)
            $lblCom.Size = New-Object System.Drawing.Size(125,30)
            $lblCom.Location = New-Object System.Drawing.Point(390,580)
            $lblCom.ForeColor = 'LightCyan'
            $foro.Controls.Add($lblCom)
        # Inputs Campos
            # Temas
            $opcTema = New-Object System.Windows.Forms.ListBox
            $opcTema.Location = New-Object System.Drawing.Point(550,520)
            $opcTema.Size = New-Object System.Drawing.Size(135,40)
            $opcTema.Font = New-Object System.Drawing.Font("Arial",16,[System.Drawing.FontStyle]::bold)
            $opcTema.Items.Add("Deportes") > $null
            $opcTema.Items.Add("Noticias") > $null
            $opcTema.Items.Add("Preguntas") > $null
            $opcTema.Items.Add("Tecnología") > $null
            $opcTema.Items.Add("Opinión") > $null
            $opcTema.Items
            $foro.Controls.Add($opcTema)
            # Comentario
            $txtCom = New-Object System.Windows.Forms.TextBox
            $txtCom.Size = New-Object System.Drawing.Size(450,40)
            $txtCom.Text = ' '
            $txtCom.Location = New-Object System.Drawing.Point(550,580)
            $foro.Controls.Add($txtCom)
        # Botón Crear
        $btCreate = New-Object System.Windows.Forms.Button
        $btCreate.Location = New-Object System.Drawing.Point(390,620)
        $btCreate.Size = New-Object System.Drawing.Size(610,60)
        $btCreate.BackColor = 'dodgerBlue'
        $btCreate.Text = 'Crear Post'
        $btCreate.Add_Click({ btCrearPost })
        $foro.Controls.Add($btCreate)
#Mostrar todo
$foro.ShowDialog()