Add-Type -AssemblyName system.windows.forms
Add-Type -AssemblyName system.drawing
#Crear un formulario con una caja de lista
function faltas{
    c:\scripts\agenda.ps1
}

function fbajas{
    C:\scripts\enobras.ps1
}

function fmodificaciones{
      C:\scripts\enobras.ps1
}

function fconsultas{
      C:\scripts\enobras.ps1
}

function flistados{
      C:\scripts\enobras.ps1
}

function fsalir{
    $form.Close()
}

function fmenu{
    $op = $lista.SelectedItem
    switch ($op){
        "ALTAS" { faltas }
        "BAJAS" { fbajas }
        "CONSULTAS" { fconsultas }
        "MODIFICACIONES" { fmodificaciones }
        "LISTADOS" { flistados }
        "SALIR" { fsalir }
    }
}

$form = New-Object System.Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size(200,300)
$form.Text = "Agenda"
$form.StartPosition='CenterScreen'

$lista = New-Object System.Windows.Forms.ListBox
$lista.Location = New-Object System.Drawing.Point(30,40)
$lista.Size = New-Object System.Drawing.Size(120,100)
#Cargamos los elementos de la caja de lista
$lista.Items.Add("ALTAS") > $null
$lista.Items.Add("BAJAS") > $null
$lista.Items.Add("MODIFICACIONES") > $null
$lista.Items.Add("CONSULTAS") > $null
$lista.Items.Add("LISTADOS") > $null
$lista.Items.Add("SALIR") > $null
#Añadimos el objeto lista creado, al formulario
$form.Controls.Add($lista)

$boton = New-Object System.Windows.Forms.Button
$boton.Location = New-Object System.Drawing.Point(40,170)
$boton.Size = New-Object System.Drawing.Size(100,20)
$boton.Text = "ACEPTAR"
$form.Controls.Add($boton)
$boton.add_click({fmenu})


$form.ShowDialog()
