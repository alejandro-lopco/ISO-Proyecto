Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#Declaración de funcioness
function createAcc {
        $create = New-Object System.Windows.Forms.Form
        $create.Text = 'Creación de cuenta'
        $create.StartPosition = 'centerscreen'
        $create.BackColor = 'Black'
        $create.Size = New-Object System.Drawing.Size(500, 650)
    #Label creación de cuenta
        $lblCreate = New-Object System.Windows.Forms.Label
        $lblCreate.Text = 'Creación de cuenta'
        $lblCreate.ForeColor = 'White'
        $lblCreate.Font = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::bold)
        $lblCreate.Size = New-Object System.Drawing.Size(300, 25)
        $lblCreate.Location = New-Object System.Drawing.Point(110, 35)
        $create.Controls.Add($lblCreate)
    #Label Nombre completo
        $lblNomCom = New-Object System.Windows.Forms.Label
        $lblNomCom.Text = 'Nombre Completo: '
        $lblNomCom.ForeColor = 'White'
        $lblNomCom.Size = New-Object System.Drawing.Size(200,15)
        $lblNomCom.Location = New-Object System.Drawing.Point(100,100)
        $create.Controls.Add($lblNomCom)
    #Textbox Nombre Completo
        $txtNomCom = New-Object System.Windows.Forms.TextBox
        $txtNomCom.Size = New-Object System.Drawing.Size(300,15)
        $txtNomCom.Location = New-Object System.Drawing.Point(100,125)
        $create.Controls.Add($txtNomCom)
    #Label Nick
        $lblNick = New-Object System.Windows.Forms.Label
        $lblNick.Text = 'Nick: '
        $lblNick.Size = New-Object System.Drawing.Size(100, 20)
        $lblNick.Location = New-Object System.Drawing.Point(100, 175)
        $lblNick.ForeColor = 'White'
        $create.Controls.Add($lblNick)
    #Textbox Nick
        $txtnick = New-Object System.Windows.Forms.TextBox
        $txtnick.Size = New-Object System.Drawing.Size(300,15)
        $txtnick.Location = New-Object System.Drawing.Point(100,200)
        $create.Controls.Add($txtnick)
    #Label Pass
        $lblPswd = New-Object System.Windows.Forms.Label
        $lblPswd.Text = 'Contraseña: '
        $lblPswd.Size = New-Object System.Drawing.Size(100, 20)
        $lblPswd.Location = New-Object System.Drawing.Point(100, 250)
        $lblPswd.ForeColor = 'White'
        $create.Controls.Add($lblPswd)
    #TextBox Pass
        $txtPswd = New-Object System.Windows.Forms.TextBox
        $txtPswd.Size = New-Object System.Drawing.Size(300,15)
        $txtPswd.Location = New-Object System.Drawing.Point(100,275)
        $create.Controls.Add($txtPswd)
    #Label Mail
        $lblPswd = New-Object System.Windows.Forms.Label
        $lblPswd.Text = 'Correo Electrónico: '
        $lblPswd.Size = New-Object System.Drawing.Size(200, 20)
        $lblPswd.Location = New-Object System.Drawing.Point(100, 325)
        $lblPswd.ForeColor = 'White'
        $create.Controls.Add($lblPswd)
    #TextBox Mail
        $txtMail = New-Object System.Windows.Forms.TextBox
        $txtMail.Size = New-Object System.Drawing.Size(300,15)
        $txtMail.Location = New-Object System.Drawing.Point(100,350)
        $create.Controls.Add($txtMail)
    #Botón Crear Cuenta
        $btAdd = New-Object System.Windows.Forms.Button
        $btAdd.Text = 'Crear Cuenta:'
        $btAdd.Size = New-Object System.Drawing.Size(150, 50)
        $btAdd.Location = New-Object System.Drawing.Point(175, 400)
        $btAdd.BackColor = 'White'
        $btAdd.Add_Click({ bdAdd })
        $create.Controls.Add($btAdd)
    #Label Conf
        $lblConf = New-Object System.Windows.Forms.Label
        $lblConf.Text = ''
        $lblConf.Size = New-Object System.Drawing.Size(350, 100)
        $lblConf.Location = New-Object System.Drawing.Point(150, 500)
        $lblConf.ForeColor = 'White'
        $lblConf.Font = New-Object System.Drawing.Font("Arial", 20, [System.Drawing.FontStyle]::bold)
        $lblConf.ForeColor = 'Salmon'
        $create.Controls.Add($lblConf)
    #Mostrar
        $create.ShowDialog()
}
function bdAdd {
    $lblConf.Text = 'Usuario Creado'
    Write-Host ($txtNomCom.Text , $txtnick.Text , $txtPswd.Text , $txtMail.Text)
    $usuario = $txtNomCom.Text+"#"+$txtnick.Text+"#"+$txtPswd.Text+"#"+$txtMail.Text
    $usuario | Out-File ".\Misc\usrData\Oriental.txt" -Append -Encoding ascii
}
function checkAcc {
    foreach ($registro in Get-Content .\Misc\usrData\Oriental.txt) {
        $campos = $registro.Split('#')
        $nick = $campos[1]
        $pass = $campos[2]
        if ($nick -ieq $txtNom.Text -and $pass -ieq $txtPass.Text) {
            Write-Host "Usuario encontrado, permitiendo acceso"
            .\Apartados\Foro\Foro.ps1 $nick
        } else {
            Write-Host "Usuario no encontrado, ESTO NO VA"
        }
    }
}
#Area principal
    $login = New-Object System.Windows.Forms.Form
    $login.Text = 'Foro'
    $login.StartPosition = 'centerscreen'
    $login.BackColor = 'Black'
    $login.Size = New-Object System.Drawing.Size(300, 450)
#Label Inicio de sesión
    $lblLogin = New-Object System.Windows.Forms.Label
    $lblLogin.Text = 'Inicio de Sesión'
    $lblLogin.Size = New-Object System.Drawing.Size(200, 40)
    $lblLogin.Location = New-Object System.Drawing.Point(55, 50)
    $lblLogin.ForeColor = 'White'
    $lblLogin.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::bold)
    $login.Controls.Add($lblLogin)
#Label Nombre
    $lblNom = New-Object System.Windows.Forms.Label
    $lblNom.Text = 'Nick:'
    $lblNom.Size = New-Object System.Drawing.Size(100, 20)
    $lblNom.Location = New-Object System.Drawing.Point(55, 100)
    $lblNom.ForeColor = 'White'
    $login.Controls.Add($lblNom)
#Nombre Login
    $txtNom = New-Object System.Windows.Forms.TextBox
    $txtNom.Size = New-Object System.Drawing.Size(175)
    $txtNom.Location = New-Object System.Drawing.Point(55, 125)
    $login.Controls.Add($txtNom)
#Label Pass
    $lblPass = New-Object System.Windows.Forms.Label
    $lblPass.Text = 'Contraseña'
    $lblPass.Size = New-Object System.Drawing.Size(100, 20)
    $lblPass.Location = New-Object System.Drawing.Point(55, 175)
    $lblPass.ForeColor = 'White'
    $login.Controls.Add($lblPass)
#Pass Login
    $txtPass = New-Object System.Windows.Forms.TextBox
    $txtPass.Size = New-Object System.Drawing.Size(175)
    $txtPass.Location = New-Object System.Drawing.Point(55, 200)
    $login.Controls.Add($txtPass)
#Botón Iniciar Sesión
    $btLogin = New-Object System.Windows.Forms.Button
    $btLogin.Text = 'Iniciar Sesión'
    $btLogin.Size = New-Object System.Drawing.Size(100, 25)
    $btLogin.Location = New-Object System.Drawing.Point(100, 275)
    $btLogin.BackColor = 'White'
    $btLogin.Add_Click({ checkAcc })
    $login.Controls.Add($btLogin)
#Botón Crear Cuenta
    $btCreate = New-Object System.Windows.Forms.Button
    $btCreate.Text = 'Crear Cuenta'
    $btCreate.Size = New-Object System.Drawing.Size(150, 25)
    $btCreate.Location = New-Object System.Drawing.Point(75, 325)
    $btCreate.BackColor = 'White'
    $btCreate.Add_Click({ createAcc })
    $login.Controls.Add($btCreate)
#Mostrar
    $login.ShowDialog()