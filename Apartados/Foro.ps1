<#  - Menu de inicio de sesión con opción de crear cuenta
        o entrar como invitado, el inv no tendrá la opción de subir comentarios
    - Los usuarios estarán almacenados en el fich \Misc\usrData\Oriental.txt
        la estructuara <nom. Comp>#<nick>#<pass>#<mail
    - El menu después de inciar sesión mostrará los hilos en orden de creación
        pero se añadiran 2 opciones de búsqueda por fecha o por tema
    - Los usuarios podrán añadir comentarios a temas, pero los temas son fijos
        la estructura <nick>#<fecha(dd/mm/yy)>#<cont. Com>
#>
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawin
