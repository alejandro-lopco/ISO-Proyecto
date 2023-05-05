Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#Declaración de funcioness
function createAcc {
    
}
function checkAcc {
    foreach ($registro in Get-Content .\Misc\usrData\Oriental.txt) {
        $campos = $registro.Split('#')
        $nick = $campos[1]
        $pass = $campos[2]
        if ($nick -ieq $txtNom.Text -and $pass -ieq $txtPass.Text) {
            Write-Host "Usuario encontrado, permitiendo acceso"
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
$btLogin.Add_Click({ accForo })
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