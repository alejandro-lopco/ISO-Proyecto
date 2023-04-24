Clear-Host
#$alumnos=@{dni=@(nom,ape,edad,estudio,curso,@(nota1,nota2,nota3));
#           dni=............... }
$alumnos=@{'11111111A'=@('Jose','Lopez',19,'informatica',2,@(5.6,6.2,4,9));
           '22222222B'=@('Mercedes','Cubillo',20,'periodismo',2,@(7.9,3.4,8.0));
           '33333333C'=@('Federico','Martin',18,'informatica',1,@(8.0,7.9,9,2));
           '44444444D'=@('Eva','Vazquez',19,'informatica',2,@(7.8,8.2,5.7));
           }

#menú de la aplicación
$op = 0
while ($op -ne 5){
    Clear-Host
    Write-Host("1. MOSTRAR TABLA")
    Write-Host("2. BUSCAR ALUMNO")
    Write-Host("3. BUSCAR POR ESTUDIOS")
    Write-Host("4. CALCULAR NOTA MEDIA")
    WRITE-HOST("5. SALIR")
    $op = Read-Host("Selecciona opcion")
    switch ($op){
        1 {Clear-Host
           Write-Host ("Mostra contenido de la tabla")
           Write-Host ("============================")
           foreach ($dni in $alumnos.Keys){
                Write-Host "DNI: ",$dni
                Write-Host "NOMBRE: ",$alumnos[$dni][0]
                Write-Host "APELLIDO: ", $alumnos[$dni][1]
                Write-Host "EDAD: ", $alumnos[$dni][2]
                Write-Host "ESTUDIOS: ", $alumnos[$dni][3]
                Write-Host "CURSO: ", $alumnos[$dni][4]
                Write-Host "NOTA1: ", $alumnos[$dni][5][0]
                Write-Host "NOTA2: ", $alumnos[$dni][5][1]
                Write-Host "NOTA3: ", $alumnos[$dni][5][2]
                Write-Host "----------------------------------------------"
           }
           $x = Read-Host("Pulsa ")
           }
        2 {Clear-Host
           Write-Host "Buscar alumno"
           Write-Host "============="
           $dni=Read-Host("Introduce DNI")
           Write-Host "DNI: ",$dni
           Write-Host "NOMBRE: ",$alumnos[$dni][0]
           Write-Host "APELLIDO: ", $alumnos[$dni][1]
           Write-Host "EDAD: ", $alumnos[$dni][2]
           Write-Host "ESTUDIOS: ", $alumnos[$dni][3]
           Write-Host "CURSO: ", $alumnos[$dni][4]
           Write-Host "NOTA1: ", $alumnos[$dni][5][0]
           Write-Host "NOTA2: ", $alumnos[$dni][5][1]
           Write-Host "NOTA3: ", $alumnos[$dni][5][2]
           $x = Read-Host(" ")}
        3 {Clear-Host
            Write-Host "Buscar por estudios"
            Write-Host "==================="
            $estu = Read-Host("Indica estudio a buscar")
            foreach ($dni in $alumnos.Keys){
                if ($alumnos[$dni][3] -ieq $estu){
                    Write-Host "DNI: ",$dni
                    Write-Host "NOMBRE: ",$alumnos[$dni][0]
                    Write-Host "APELLIDO: ", $alumnos[$dni][1]
                    Write-Host "EDAD: ", $alumnos[$dni][2]
                    Write-Host "CURSO: ", $alumnos[$dni][4]
                    Write-Host "NOTA1: ", $alumnos[$dni][5][0]
                    Write-Host "NOTA2: ", $alumnos[$dni][5][1]
                    Write-Host "NOTA3: ", $alumnos[$dni][5][2]
                    Write-Host "---------------------------------------------"
                }
            }
           $x = Read-Host(" ")
           }
        4 { $oop=0
            while ($oop -ne 3){
                Clear-Host
                Write-Host "1. Calcular media por alumno"
                Write-Host "2. Calcular media por estudio"
                Write-Host "3. Volver al menú principal"
                $oop = Read-Host ("Selecciona opción")
                switch ($oop){
                    1 { Write-Host "Calcular media por alumno"
                        Write-Host "-------------------------"
                        $dni = Read-Host ("Indique dni")
                        $suma = $alumnos[$dni][5][0] + $alumnos[$dni][5][1] + $alumnos[$dni][5][2]
                        $media = $suma / 3
                        Write-Host "La nota media del alumno",$alumnos[$dni][1],","$alumnos[$dni][0], "es:", $media
                        $x = read-host(" ")
                      }
                    2 { Write-Host "Calcular media por estudio"
                        write-host "--------------------------"
                        $est = Read-Host("Indica estudio")
                        $suma = 0
                        foreach ($clave in $alumnos.keys){
                            if ($alumnos[$clave][3] -ieq $est){
                                $suma=$suma + $alumnos[$clave][5][0]+$alumnos[$clave][5][1]+$alumnos[$clave][5][2]
                                $cont+=3

                            }
                        }
                        $media=$suma/$cont
                        Write-Host "La nota media obtenida en",$est,"es:", $media
                        $x = read-host(" ")
                      }
                  }
                }
            
            }
           
    }
}