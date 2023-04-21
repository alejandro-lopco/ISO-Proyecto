# ISO-Proyecto
Proyecto horóscopo con plantas medicinales e integración Reddit en Powershell
Crear en PowerShell un script que nos muestre una página de entretenimiento con:
  -     Horóscopo Occidental
  -     Horóscopo chino
  -     Número mágico
  -     Plantas Medicinales
  -     Foro
  
Para las 3 primeras opciones, tendremos que introducir nuestra fecha de nacimiento y 
    seleccionar la opción que deseamos consultar
 
En la opción de plantas medicinales, indicaremos la dolencia de la que queremos obtener y 
    que plantas podemos utilizar para solucionarlas, Por ejemplo:
    
        DOLENCIA: Antiinflamatorio -> PLANTA: Cúrucuma, Girasol, Romero, etc...
        
En la opción de foro tendremos en cuenta los siguientes puntos:

    -   Verificar la existencia del usuario. Para ello solicitaremos su nick y contraseña.
    
    -   Los usuarios registrados se encontrarán en la tabla "Usuarios", de la base de datos Oriental,
            con la siguiente estructura:                
                -   Nombre Completo
                -   Nick
                -   Contraseña
                -   Correo
                
    -   Si el usuario no existe se procederá a darle de alta.
    
    -   Incluir nuevos comentarios en la tabla "foro.txt", 
            incluyendo la siguiente información:
                -   Nick
                -   Fecha
                -   Tema
                -   Comentario
                
    -   Visualizar comentarios, 
            eligiendo si queremos ver los comentarios:
                -   De una determinada fecha
                -   De un tema determinado
                
Crea el entorno gráfico necesario para utilizar el script        
