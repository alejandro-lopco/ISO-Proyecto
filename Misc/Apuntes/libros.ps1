function fnuevo(){
    $tit = Read-Host("TITULO")
    $aut = Read-Host("AUTOR")
    $edit = Read-Host("EDITORIAL")
    [int]$npag = Read-Host("PAGINAS")
    [float]$precio = Read-Host("PRECIO")
    $gen = Read-Host("GENERO")

    $registro=$tit+"#"+$aut+"#"+$edit+"#"+$npag+"#"+$precio+"#"+$gen
    $registro | Out-File libros.txt -Append -encoding ascii

    $x = Read-Host "Registro dado de alta"
}

function flista(){
    foreach($registro in Get-Content .\libros.txt){
        $campos = $registro.split("#")
        Write-Host "TITULO:" $campos[0]
        Write-Host "AUTOR:" $campos[1]
        Write-Host "EDITORIAL:" $campos[2]
        Write-Host "PAGINAS:" $campos[3]
        write-host "PRECIO:" $campos[4]
        Write-Host "GENERO:" $campos[5]
        Write-Host "------------------------------------"
    }
    $x = Read-Host " "
}

function fconsulta(){
    $titulo = Read-Host("TITULO")

    foreach ($reg in Get-Content .\libros.txt){
        $campos = $reg.split("#")
        if($campos[0] -ieq $titulo){
            Write-Host "TITULO:" $campos[0]
            Write-Host "AUTOR:" $campos[1]
            Write-Host "EDITORIAL:" $campos[2]
            Write-Host "PAGINAS:" $campos[3]
            write-host "PRECIO:" $campos[4]
            Write-Host "GENERO:" $campos[5]
        }
    }
    $x = Read-Host " "
}

function fborrar(){
    $titulo = Read-Host("TITULO")

    foreach ($reg in Get-Content .\libros.txt){
        $campos = $reg.split("#")
        if($campos[0] -ne $titulo){
            $reg | Out-File .\temporal.txt -Append -encoding ascii
        }
    }
    Remove-Item .\libros.txt
    Rename-Item .\temporal.txt -newname libros.txt
    $x = Read-Host "Libro borrado"
}

function fmodificar(){
    $titulo = Read-Host("TITULO")
    foreach ($registro in Get-Content .\libros.txt){
        $campos = $registro.Split("#")
        if ($campos[0] -ne $titulo){
            $registro | Out-File .\temporal.txt -Append -encoding ascii
        }else{
            $precio=Read-Host("Introduce nuevo precio")
            $nuevoreg = $campos[0]+"#"+$campos[1]+"#"+$campos[2]+"#"+$campos[3]+"#"+$precio+"#"+$campos[5]
            $nuevoreg | Out-File .\temporal.txt -Append -encoding ascii
        }
    }
    Remove-Item .\libros.txt
    Rename-Item .\temporal.txt libros.txt
    $x = Read-Host "Libro modificado"
}

$op=0
while($op -ne 6){
    Clear-Host
    Write-Host "1. Nuevo libro"
    Write-Host "2. Listar libros"
    Write-Host "3. Consultar libro"
    Write-Host "4. Borrar libro"
    Write-Host "5. Modificar libro"
    Write-Host "6. Salir"
    $op = Read-Host "Elige opción"
    switch ($op){
        1 { fnuevo }
        2 { flista }
        3 { fconsulta }
        4 { fborrar }
        5 { fmodificar }
    }
}