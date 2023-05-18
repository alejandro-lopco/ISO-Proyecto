Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#   Declaración de funciones
function mainHoro {
    #Etiqueta principal
        $lblHoro = New-Object System.Windows.Forms.Label
        $lblHoro.Text = 'Horóscopo'
        $lblHoro.Font = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::bold)
        $lblHoro.Size = New-Object System.Drawing.Size(500, 55)
        $lblHoro.Location = New-Object System.Drawing.Point(25, 25)
        $lblHoro.ForeColor = 'LightCyan'
        $horo.Controls.Add($lblHoro)
    #Etiqueta Subprincipal
        $lblSubHoro = New-Object System.Windows.Forms.Label
        $lblSubHoro.Text = 'Mire y Pruebe'
        $lblSubHoro.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::bold)
        $lblSubHoro.Size = New-Object System.Drawing.Size(225, 50)
        $lblSubHoro.Location = New-Object System.Drawing.Point(25, 75)
        $lblSubHoro.ForeColor = 'Salmon'
        $horo.Controls.Add($lblSubHoro)
}
function curDate {
    #Etiqueta principal
    $lblGreet = New-Object System.Windows.Forms.Label
    $lblGreet.Text = 'La fecha actual es: '
    $lblGreet.ForeColor = 'LightCyan'
    $lblGreet.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::bold)
    $lblGreet.Location = New-Object System.Drawing.Point(25, 150)
    $lblGreet.Size = New-Object System.Drawing.Size(210, 50)
    $horo.Controls.Add($lblGreet)
    #Etiqueta Fecha
    [string]$date = Get-Date -Format 'dd/MM/yyyy'
    $lbldate = New-Object System.Windows.Forms.Label
    $lbldate.Text = $date
    $lbldate.ForeColor = 'Salmon'
    $lbldate.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::bold)
    $lbldate.Location = New-Object System.Drawing.Point(25, 200)
    $lbldate.Size = New-Object System.Drawing.Size(200, 50)
    $horo.Controls.Add($lbldate)
}
function Occidental {
    $lblRes.ForeColor = 'Plum'
    $res.ForeColor = 'Plum'
    $occDate = Get-Date -Format 'MM-dd' $txtDate.Text
    [int]$mes = Get-Date -Format 'MM' $occDate
    [int]$dia = Get-Date -Format 'dd' $occDate
    if (($mes -eq 3 -and $dia -ge 21) -or ($mes -eq 4 -and $dia -le 19)) {
        $usrSignoOcc = 'Aries'
    }
    elseif (($mes -eq 4 -and $dia -ge 20) -or ($mes -eq 5 -and $dia -le 20)) {
        $usrSignoOcc = 'Tauro'
    }
    elseif (($mes -eq 5 -and $dia -ge 21) -or ($mes -eq 6 -and $dia -le 20)) {
        $usrSignoOcc = 'Géminis'
    }
    elseif (($mes -eq 6 -and $dia -ge 21) -or ($mes -eq 7 -and $dia -le 22)) {
        $usrSignoOcc = 'Cáncer'
    }
    elseif (($mes -eq 7 -and $dia -ge 23) -or ($mes -eq 8 -and $dia -le 22)) {
        $usrSignoOcc = 'Leo'
    }
    elseif (($mes -eq 8 -and $dia -ge 23) -or ($mes -eq 9 -and $dia -le 22)) {
        $usrSignoOcc = 'Virgo'
    }
    elseif (($mes -eq 9 -and $dia -ge 23) -or ($mes -eq 10 -and $dia -le 22)) {
        $usrSignoOcc = 'Libra'
    }
    elseif (($mes -eq 10 -and $dia -ge 23) -or ($mes -eq 11 -and $dia -le 21)) {
        $usrSignoOcc = 'Escorpio'
    }
    elseif (($mes -eq 11 -and $dia -ge 22) -or ($mes -eq 12 -and $dia -le 21)) {
        $usrSignoOcc = 'Sagitario'
    }
    elseif (($mes -eq 12 -and $dia -ge 22) -or ($mes -eq 1 -and $dia -le 20)) {
        $usrSignoOcc = 'Capricornio'
    }
    elseif (($mes -eq 1 -and $dia -ge 21) -or ($mes -eq 2 -and $dia -le 19)) {
        $usrSignoOcc = 'Acuario'
    }
    elseif (($mes -eq 2 -and $dia -ge 20) -or ($mes -eq 3 -and $dia -le 20)) {
        $usrSignoOcc = 'Piscis'
    }
    else {
        Write-Host "INÚTIL."
    }
    switch ($usrSignoOcc) {
        'Aries' {
            <#Aries#>
            $res.Text = (
                '¡Prepárate para una semana llena de acción y energía desbordante, querido Aries! 
                En los próximos días, te encontrarás en tu elemento, listo para enfrentar cualquier desafío que se presente en tu camino. 
                Tu confianza y determinación serán inquebrantables, lo que te permitirá superar obstáculos y lograr grandes avances en tus metas. 
                Además, tu carisma estará en su punto máximo, lo que te abrirá puertas y te ayudará a establecer conexiones significativas tanto en el ámbito personal como profesional. 
                No obstante, recuerda mantener un equilibrio entre el trabajo y el descanso, ya que tu entusiasmo puede llevarte a agotarte rápidamente. 
                Aprovecha este impulso favorable para iniciar nuevos proyectos y tomar decisiones audaces. ¡Este será tu momento para brillar, Aries!'
            )
        }
        'Tauro' { 
            <#Tauro#> 
            $res.Text = (
                'Querido Tauro, prepárate para una semana llena de estabilidad y perseverancia. 
                En los próximos días, te encontrarás en un estado de calma y determinación, lo que te permitirá superar cualquier obstáculo que se presente en tu camino. 
                Tu enfoque y paciencia serán tus mejores aliados mientras trabajas diligentemente hacia tus metas. 
                Además, tu sensibilidad y lealtad serán apreciadas por aquellos que te rodean, fortaleciendo tus relaciones personales y profesionales. 
                Es posible que encuentres oportunidades para mejorar tu bienestar físico y emocional, así que aprovecha estos momentos para cuidarte y mimarte. 
                Recuerda mantener un equilibrio entre el trabajo y el descanso, ya que tu dedicación incansable puede llevarte a agotarte. 
                Confía en tu intuición y sigue avanzando con confianza, querido Tauro, ¡grandes cosas te esperan!'
            )
        }
        'Géminis' { 
            <#Géminis#>
            $res.Text = (
                'Querido Géminis, prepárate para una semana llena de cambios y oportunidades emocionantes. 
                En los próximos días, sentirás una energía vibrante y una curiosidad insaciable que te impulsarán a explorar nuevos horizontes. 
                Tu mente ágil y versátil te permitirá adaptarte fácilmente a cualquier situación que se presente. 
                Aprovecha esta fase para expandir tus conocimientos y habilidades, ya que estarás en tu mejor momento para aprender y comunicarte eficazmente. 
                Tu encanto y carisma estarán en su punto máximo, lo que te abrirá puertas en el ámbito social y te permitirá establecer conexiones valiosas. 
                Sin embargo, recuerda mantener un equilibrio y no dispersarte en demasiadas direcciones. Mantén el enfoque en tus metas principales y establece prioridades claras. 
                Confía en tu intuición y sigue tu corazón mientras tomas decisiones importantes. Este será un período emocionante y lleno de oportunidades para crecer y prosperar, querido Géminis. 
                ¡Aprovecha al máximo!'
            )
        }
        'Cáncer' { 
            <#Cáncer#>
            $res.Text = (
                'Querido Cáncer, prepárate para una semana llena de emociones y conexión profunda. 
                En los próximos días, te encontrarás en sintonía con tus sentimientos y necesidades emocionales, lo que te permitirá explorar y nutrir tu mundo interior. 
                Tu intuición estará fuerte y te guiará en la toma de decisiones importantes. 
                Es un momento propicio para enfocarte en tu bienestar emocional y buscar equilibrio en todas las áreas de tu vida.
                Además, tu sensibilidad y empatía serán valoradas por aquellos que te rodean, fortaleciendo tus relaciones personales. 
                No dudes en expresar tus emociones y comunicarte abiertamente con tus seres queridos, ya que esto fortalecerá los vínculos existentes. 
                Además, es posible que encuentres oportunidades para nutrir tus pasiones creativas, lo que te brindará una profunda satisfacción y expresión personal. 
                Recuerda cuidar de ti mismo y tomar tiempo para descansar y recargarte. Este será un período de crecimiento emocional y conexión profunda para ti, querido Cáncer. 
                ¡Aprovecha cada momento!'
            )
        }
        'Leo' { 
            <#Leo#>
            $res.Text = (
                'Querido Leo, prepárate para una semana llena de confianza y brillo deslumbrante. 
                En los próximos días, te encontrarás en tu elemento, listo para destacar y brillar con todo tu esplendor. 
                Tu carisma magnético y tu energía radiante atraerán la atención de todos a tu alrededor. 
                Es el momento perfecto para demostrar tus talentos y habilidades únicas, ya sea en el trabajo, en el amor o en cualquier proyecto que te apasione. 
                Tu liderazgo natural y tu determinación te permitirán alcanzar nuevas alturas y conquistar desafíos que se te presenten. 
                Además, tu generosidad y lealtad serán reconocidas y apreciadas por aquellos que te rodean, fortaleciendo aún más tus lazos emocionales. 
                Recuerda también cuidar de ti mismo y encontrar momentos de descanso y relajación para recargar tus energías. 
                Este será un período emocionante y gratificante en el que verás cómo tus sueños se vuelven realidad. 
                ¡Brilla con todo tu esplendor, querido Leo!'
            ) 
        }
        'Virgo' { 
            <#Virgo#> 
            $res.Text = (
                'Querido Virgo, prepárate para una semana llena de perfección y organización. 
                En los próximos días, tu mente analítica y meticulosa estará en su mejor momento, permitiéndote abordar cada tarea con precisión y eficiencia. 
                Tu capacidad para planificar y estructurar te ayudará a superar desafíos y alcanzar tus objetivos con éxito. 
                Además, tu sentido práctico y atención al detalle te harán destacar en el trabajo y en cualquier proyecto que emprendas. 
                Asegúrate de aprovechar esta energía constructiva para resolver cualquier asunto pendiente y establecer rutinas saludables. 
                Tu enfoque en el bienestar físico y emocional será fundamental, así que no olvides cuidar de ti mismo y encontrar tiempo para el descanso. 
                En el ámbito personal, tu naturaleza leal y comprensiva te permitirá brindar apoyo a tus seres queridos cuando más lo necesiten. 
                Recuerda mantener un equilibrio entre tu perfeccionismo y la flexibilidad, permitiéndote fluir con los cambios inesperados. 
                Este será un período de logros y crecimiento para ti, querido Virgo. ¡Avanza con confianza y alcanza nuevas alturas!'
            )
        }
        'Libra' { 
            <#Libra#> 
            $res.Text = (
                'Querido Libra, prepárate para una semana llena de armonía y equilibrio en todas las áreas de tu vida. 
                En los próximos días, encontrarás una mayor estabilidad emocional y mental, lo que te permitirá tomar decisiones con confianza y claridad. 
                Tu habilidad innata para ver diferentes perspectivas te ayudará a resolver conflictos y encontrar soluciones justas en cualquier situación. 
                Además, tu encanto y amabilidad serán una fuerza magnética, atrayendo a personas positivas y relaciones significativas hacia tu vida. 
                Este es el momento perfecto para fortalecer los lazos existentes y crear nuevas conexiones que enriquezcan tu vida social y profesional. 
                En términos de trabajo, se presentarán oportunidades para demostrar tu habilidad diplomática y tu capacidad para colaborar eficientemente en equipo. 
                No olvides cuidar de ti mismo/a también, y dedicar tiempo a actividades que te llenen de alegría y bienestar. 
                Confía en tu intuición y sigue tu corazón mientras sigues en busca de la armonía y la belleza en todas las áreas de tu vida, querido Libra. 
                ¡Grandes cosas están por venir!'
            )
        }
        'Escorpio' { 
            <#Escorpio#> 
            $res.Text = (
                'Querido Escorpio, prepárate para una semana de intensidad y transformación. 
                En los próximos días, te enfrentarás a profundas revelaciones y cambios significativos en tu vida. 
                Tu naturaleza apasionada y determinada te permitirá superar cualquier desafío que se presente en tu camino. 
                Es posible que te encuentres en una etapa de autodescubrimiento, donde explorarás tus emociones más profundas y te enfrentarás a tus miedos internos. 
                A medida que te adentres en este viaje emocional, encontrarás un poder y una fuerza interna que te ayudarán a reinventarte y renacer. 
                Es posible que experimentes una mayor intuición y una conexión más profunda con tu espiritualidad. 
                Además, tus habilidades de observación y análisis estarán afiladas, permitiéndote descubrir información oculta y resolver problemas complejos. 
                Recuerda cuidar de ti mismo durante este proceso de transformación y rodearte de personas que te brinden apoyo y comprensión. 
                A medida que abrazas tu poder interior, encontrarás una renovada claridad y propósito en tu vida, querido Escorpio. 
                ¡Adelante hacia un nuevo y emocionante capítulo!'
            )
        }
        'Sagitario' { 
            <#Sagitario#> 
            $res.Text = (
                'Querido Sagitario, prepárate para un período lleno de aventuras y expansión. 
                En los próximos días, te encontrarás en tu elemento, ansioso por explorar nuevos horizontes y descubrir lo desconocido. 
                Tu espíritu aventurero te llevará a vivir experiencias emocionantes y enriquecedoras. 
                Es el momento perfecto para planificar viajes, aventurarte en nuevas oportunidades y ampliar tus horizontes tanto física como mentalmente. 
                Tu optimismo y entusiasmo contagiarán a quienes te rodean, convirtiéndote en el alma de cualquier reunión social. 
                Además, tus habilidades comunicativas estarán en su máximo esplendor, permitiéndote expresar tus ideas y opiniones con claridad y persuasión. 
                Sin embargo, recuerda mantener un equilibrio entre la diversión y la responsabilidad. 
                No te pierdas en la búsqueda constante de emociones, sino que canaliza tu energía hacia metas concretas y duraderas. 
                Confía en tu intuición y sigue tu corazón mientras te aventuras hacia nuevos horizontes. 
                Este será un período emocionante y transformador en el que podrás alcanzar nuevas alturas, querido Sagitario. 
                ¡Disfruta del viaje!'
            )
        }
        'Capricornio' { 
            <#Capricornio#> 
            $res.Text = (
                'Querido Capricornio, prepárate para una semana llena de determinación y logros significativos. 
                En los próximos días, tu dedicación y disciplina serán recompensadas, ya que te encontrarás en un período propicio para alcanzar tus metas a largo plazo. 
                Tu enfoque será inquebrantable, y tu capacidad para planificar y tomar decisiones estratégicas te conducirá hacia el éxito. 
                Es posible que te enfrentes a desafíos, pero no te desanimes, ya que tu perseverancia te llevará a superar cualquier obstáculo que se presente en tu camino. 
                Además, tu habilidad para trabajar en equipo y liderar será altamente valorada, lo que te abrirá oportunidades para colaboraciones fructíferas y reconocimiento profesional. 
                Recuerda también cuidar de tu bienestar físico y emocional, reservando tiempo para el descanso y la relajación. 
                Confía en tus habilidades y continúa esforzándote, querido Capricornio, ya que este período te llevará hacia grandes logros y realizaciones.'
            )
        }
        'Acuario' { 
            <#Acuario#> 
            $res.Text = (
                'Querido Acuario, prepárate para una semana llena de innovación y originalidad. 
                En los próximos días, tu mente brillante y visionaria estará en pleno auge, permitiéndote pensar fuera de lo convencional y encontrar soluciones creativas a los desafíos que se te presenten. 
                Te sentirás inspirado y motivado para llevar a cabo proyectos que reflejen tu individualidad y tu deseo de cambiar el mundo. 
                Aprovecha este momento para conectarte con personas afines a ti, ya que podrías descubrir nuevos colaboradores o amigos que compartan tus ideales. 
                Si bien tu enfoque estará en el futuro, recuerda también valorar y nutrir tus relaciones actuales, ya que el apoyo de tus seres queridos será fundamental en tu camino hacia el éxito. 
                No temas mostrar tu autenticidad y singularidad, ya que es precisamente eso lo que te distingue. Mantén tu mente abierta y dispuesta a aprender de las experiencias que se presenten. 
                Este será un momento emocionante para explorar nuevas posibilidades y dejar una huella única en el mundo, querido Acuario. 
                ¡Ve y hazlo realidad!'
            )
        }
        'Piscis' { 
            <#Piscis#> 
            $res.Text = (
                'Querido Piscis, prepárate para una semana llena de sensibilidad y conexión emocional profunda. 
                En los próximos días, sentirás una intensidad emocional que te guiará hacia un mayor autoconocimiento y crecimiento espiritual. 
                Tu intuición estará en su punto máximo, lo que te permitirá sintonizar con las energías sutiles que te rodean. 
                Aprovecha este tiempo para buscar momentos de tranquilidad y reflexión, ya que encontrarás respuestas a preguntas que han estado rondando en tu mente. 
                Tu empatía y compasión hacia los demás serán reconocidas y apreciadas, permitiéndote brindar apoyo y consuelo a aquellos que lo necesitan. 
                Sin embargo, recuerda también cuidar de ti mismo y establecer límites saludables. 
                Es posible que te enfrentes a decisiones difíciles, pero confía en tu sabiduría interna para tomar las elecciones correctas. 
                Este será un período de transformación y sanación para ti, querido Piscis. Acepta tus emociones y déjate llevar por la corriente del amor y la creatividad. 
                ¡El universo te guiará hacia la armonía y la realización!'
            )
        }
        Default {
            $res.Text = (
                'no aguanto más'
            )
        }
    }
}
function Chino {
    $lblRes.ForeColor = 'LightSeaGreen'
    $res.ForeColor = 'LightSeaGreen'
    $tableAnyos = @{
        'Rata'      =   @(1900, 1912, 1924, 1936, 1948, 1960, 1972, 1984, 1996, 2008, 2020)
        'Buey'      =   @(1901, 1913, 1925, 1937, 1949, 1961, 1973, 1985, 1997, 2009, 2021)
        'Tigre'     =   @(1902, 1914, 1926, 1938, 1950, 1962, 1974, 1986, 1998, 2010, 2022)
        'Conejo'    =   @(1903, 1914, 1927, 1939, 1951, 1963, 1975, 1987, 1998, 2011, 2023)
        'Dragón'    =   @(1904, 1916, 1928, 1940, 1952, 1964, 1976, 1988, 2000, 2012, 2024)
        'Serpiente' =   @(1905, 1917, 1929, 1941, 1953, 1965, 1977, 1989, 2001, 2013, 2025)
        'Caballo'   =   @(1906, 1918, 1930, 1942, 1954, 1966, 1978, 1990, 2002, 2014, 2026)
        'Cabra'     =   @(1907, 1919, 1931, 1943, 1955, 1967, 1979, 1991, 2003, 2015, 2027)
        'Mono'      =   @(1908, 1920, 1932, 1944, 1956, 1968, 1980, 1992, 2004, 2016, 2028)
        'Gallo'     =   @(1909, 1921, 1933, 1945, 1957, 1969, 1981, 1993, 2005, 2017, 2029)
        'Perro'     =   @(1910, 1922, 1934, 1946, 1958, 1970, 1982, 1994, 2006, 2018, 2030)
        'Cerdo'     =   @(1911, 1923, 1935, 1947, 1959, 1971, 1983, 1995, 2007, 2019, 2031)
    }
    [int]$anyo = Get-Date -Format 'yyyy' $txtDate.Text
    $usrSignoChi = 'Adios'
    foreach ($signoHash in $tableAnyos.Keys) {
        Write-Host "    SIGNO" $signoHash
        for ($i = 0; $i -le 10; $i++) {
            Write-Host "Bucle #" $i
            if ($tableAnyos[$signoHash][$i] -ieq $anyo) {
                [string]$usrSignoChi = $signoHash
            } else {
                Write-Host "Año distinto"
            }
        }
    }
    switch ($usrSignoChi) {
        'Rata' {
            <#Rata#>
            Write-Host 'Rata'
            $res.Text = 'El año de la Rata en el horóscopo chino se caracteriza por la astucia, la agudeza mental y la capacidad para adaptarse a diferentes situaciones. 
            Las personas nacidas bajo este signo son ingeniosas y tienen una mente rápida, lo que les permite tomar decisiones inteligentes y resolver problemas con facilidad.
            Son encantadores y carismáticos, lo que les ayuda a establecer buenas relaciones con los demás. 
            La Rata también simboliza la prosperidad y la buena fortuna, por lo que aquellos que nacen en este año tienen grandes posibilidades de alcanzar el éxito en su vida personal y profesional. 
            Sin embargo, también se les aconseja mantenerse alerta y no confiar demasiado en los demás, ya que su naturaleza astuta puede hacerlos vulnerables a posibles engaños. 
            En resumen, el año de la Rata promete ser un período emocionante y lleno de oportunidades para aquellos que se identifican con este signo.'
        }
        'Buey' {
            <#Rata#>
            Write-Host 'Buey'
            $res.Text = 'El año del Buey, trae consigo una energía poderosa y estable. 
            Representando la tenacidad y el trabajo duro, este año promete recompensas para aquellos que perseveren. 
            Los nacidos bajo el signo del Buey se verán beneficiados, ya que su paciencia y dedicación los llevarán hacia el éxito. 
            Sin embargo, es importante recordar que el Buey también simboliza la prudencia y la tranquilidad, por lo que este será un año propicio para reflexionar y planificar cuidadosamente los próximos pasos. 
            En general, el año del Buey nos invita a ser persistentes y comprometidos con nuestros objetivos, sabiendo que la constancia y la determinación serán las llaves para alcanzar el triunfo en todas las áreas de nuestra vida.'
        }
        'Tigre' {
            <#Tigre#>
            Write-Host 'Tigre'
            $res.Text = 'El año del Tigre es un período lleno de pasión, fuerza y valentía. 
            Este majestuoso felino trae consigo una energía ardiente que impulsa a las personas a perseguir sus objetivos con determinación y audacia. 
            Durante este año, se espera que la gente se muestre valiente al enfrentar desafíos y tomar riesgos calculados. 
            El Tigre también inspira a las personas a confiar en sus instintos y a confiar en su intuición para tomar decisiones acertadas. 
            Este es un momento propicio para manifestar su lado más creativo y expresivo, ya que el Tigre fomenta el individualismo y la originalidad. 
            Sin embargo, es importante recordar que esta fuerza interior también debe ir acompañada de paciencia y autocontrol, ya que el carácter enérgico del Tigre puede volverse dominante si no se maneja adecuadamente. 
            En general, el año del Tigre promete ser un período emocionante y desafiante, pero aquellos que logren aprovechar su energía podrán cosechar grandes recompensas en todos los aspectos de la vida.'
        }
        'Conejo' {
            <#Conejo#>
            Write-Host 'Conejo'
            $res.Text = 'El año del Conejo se caracteriza por una energía suave y armoniosa que trae consigo un sentido de tranquilidad y serenidad. 
            Los nacidos en este año son conocidos por su naturaleza amable y gentil, y su capacidad para cultivar relaciones saludables y duraderas. 
            El Conejo es considerado un símbolo de buena suerte y fortuna, y aquellos que están bajo su influencia suelen tener una vida equilibrada y próspera. 
            Durante este año, se alienta a los individuos a confiar en su intuición y a seguir su corazón en la toma de decisiones. 
            La paciencia y la diplomacia son cualidades valoradas, ya que permiten resolver conflictos y encontrar soluciones amigables. 
            En resumen, el año del Conejo promete un tiempo de armonía, éxito y estabilidad para aquellos que se conecten con su lado compasivo y aprecien la belleza de la vida.'
        }
        'Dragón' {
            <#Dragón#>
            Write-Host 'Dragón'
            $res.Text = 'El año del Dragón es un periodo lleno de poder, pasión y éxito. 
            Los nacidos bajo este signo son conocidos por su valentía y su capacidad para liderar. 
            Durante este año, los dragones pueden esperar un impulso en su carrera y alcanzar grandes logros. 
            Su creatividad y carisma serán destacados, lo que les brindará numerosas oportunidades tanto en el ámbito profesional como en el personal. 
            Sin embargo, también se les aconseja mantener un equilibrio entre su ambición y su vida personal, ya que pueden volverse demasiado absorbidos por su trabajo. 
            En el amor, los dragones serán irresistibles y cautivadores, atrayendo a posibles parejas con su magnetismo innato. 
            En general, el año del Dragón les presenta un escenario favorable para hacer realidad sus sueños y brillar con luz propia.'
        }
        'Serpiente' {
            <#Serpiente#>
            Write-Host 'Serpiente'
            $res.Text = 'El año de la Serpiente es un período lleno de misterio y transformación. 
            Aquellos nacidos bajo este signo experimentarán un año de profundos cambios internos y renovación personal. 
            La serpiente es conocida por su astucia y su habilidad para adaptarse a diferentes situaciones, lo que brinda a las personas nacidas en este año una gran capacidad para enfrentar desafíos y superar obstáculos. 
            Durante este año, se fomentará la introspección y se despertará una mayor conciencia espiritual. 
            La serpiente simboliza la sabiduría y la intuición, por lo que aquellos que abracen estas cualidades estarán en sintonía con las energías del universo y encontrarán oportunidades para el crecimiento personal y el éxito. 
            Es importante mantener la calma y la paciencia durante este año, ya que la serpiente tiende a moverse lentamente pero de manera estratégica. 
            Con una mente enfocada y una actitud positiva, el año de la Serpiente puede traer consigo cambios positivos y transformaciones profundas en diferentes aspectos de la vida.'
        }
        'Caballo' {
            <#Caballo#>
            Write-Host 'Caballo'
            $res.Text = 'El año del Caballo es un período lleno de energía y dinamismo en el horóscopo chino. 
            Las personas nacidas bajo este signo son conocidas por su espíritu libre y su pasión desenfrenada por la vida. 
            Durante este año, se espera que el Caballo muestre su valentía y determinación en todas las áreas de su vida. 
            Será un año propicio para emprender nuevos proyectos y perseguir metas audaces. La suerte estará de su lado, especialmente en asuntos profesionales y financieros. 
            Sin embargo, también se les aconseja mantenerse alerta y evitar caer en la impulsividad, ya que la energía del Caballo puede llevarlos a tomar decisiones apresuradas. 
            En el amor, el Caballo experimentará momentos emocionantes y románticos, pero es importante que cultiven la comunicación y la paciencia para mantener relaciones sólidas. 
            En general, el año del Caballo será una montaña rusa de experiencias, pero con el coraje y la perseverancia adecuados, se pueden lograr grandes triunfos.'
        }
        'Cabra' {
            <#Cabra#>
            Write-Host 'Cabra'
            $res.Text = 'El año de la Cabra es un tiempo lleno de encanto, delicadeza y armonía. 
            Las personas nacidas en este año exhiben una personalidad amable, compasiva y creativa. 
            La energía de la Cabra trae consigo una sensibilidad especial hacia los demás, lo que las convierte en grandes oyentes y consejeras. 
            Durante este año, se promueve la colaboración y la cooperación, lo que fomenta el trabajo en equipo y el desarrollo de relaciones sólidas. 
            Las personas bajo la influencia de la Cabra tienden a ser pacíficas y buscan la armonía en todas las áreas de su vida. 
            Es un año propicio para la expresión artística y el cultivo de la belleza en todas sus formas. 
            Sin embargo, también es importante tener en cuenta que la Cabra puede ser un poco indecisa en ocasiones, por lo que es fundamental encontrar un equilibrio entre la amabilidad y la toma de decisiones firmes. 
            En general, el año de la Cabra es un momento para cultivar la empatía, la amistad y la generosidad, creando un ambiente de calidez y dulzura a su alrededor.'
        }
        'Mono' {
            <#Mono#>
            Write-Host 'Mono'
            $res.Text = '
            El año del Mono es un período lleno de energía y oportunidades para aquellos nacidos bajo este signo del horóscopo chino. 
            Con su naturaleza ingeniosa y astuta, los monos tienen la capacidad de enfrentar desafíos con destreza y encontrar soluciones creativas. 
            Durante este año, se espera que los monos se destaquen en todas las áreas de su vida, ya sea en su carrera profesional, relaciones personales o desarrollo personal. 
            Su inteligencia y habilidades sociales serán clave para establecer conexiones significativas y alcanzar el éxito en sus objetivos. 
            Sin embargo, también es importante que los monos controlen su impulsividad y eviten caer en la tentación de tomar atajos o actuar de manera imprudente. 
            Con una planificación cuidadosa y un enfoque disciplinado, el año de la Mono promete ser un año próspero y lleno de logros para aquellos que estén dispuestos a trabajar duro y aprovechar al máximo las oportunidades que se les presenten.'
        }
        'Gallo' {
            <#Gallo#>
            Write-Host 'Gallo'
            $res.Text = 'El año del Gallo, según el horóscopo chino, trae consigo una energía vibrante y llena de entusiasmo. 
            Representando la fuerza y la valentía, este año promete oportunidades emocionantes y desafíos estimulantes para aquellos bajo su influencia. 
            Al igual que el gallo, las personas nacidas en este año son conocidas por su diligencia y capacidad para liderar. 
            Serán impulsados por la determinación y la pasión, lo que les permitirá alcanzar grandes logros en sus proyectos y metas. 
            Sin embargo, es importante que mantengan un equilibrio entre su audacia y su cautela, ya que el Gallo también trae consigo una propensión a la impaciencia y a tomar decisiones apresuradas. 
            Con astucia y perseverancia, aquellos que se sumerjan en el año del Gallo cosecharán recompensas significativas y fortalecerán su confianza en sí mismos. 
            Es un momento propicio para destacar, brillar y emprender nuevas aventuras con coraje y determinación.'
        }
        'Perro' {
            <#Perro#>
            Write-Host 'Perro'
            $res.Text = 'El año del Perro en el horóscopo chino trae consigo una energía protectora y leal. 
            Los nacidos bajo este signo se destacarán por su fidelidad, valentía y sentido del deber. 
            Serán guardianes incansables de aquellos que aman, mostrando un amor incondicional y una lealtad sin igual. 
            Su honestidad y confiabilidad serán apreciadas por todos los que los rodean. 
            Además, el año del Perro también traerá una mayor sensibilidad hacia las necesidades de los demás y una voluntad de ayudar y apoyar a aquellos en dificultades. 
            Los nacidos en este año encontrarán fuerza y estabilidad en sus relaciones personales y profesionales, y serán capaces de superar los obstáculos con determinación y persistencia. 
            En general, el año del Perro promete ser un período de protección, compañerismo y triunfos duraderos.'
        }
        'Cerdo' {
            <#Cerdo#>
            Write-Host 'Cerdo'
            $res.Text = 'El año del Cerdo es un tiempo de abundancia y suerte en el horóscopo chino. 
            El Cerdo es un signo que simboliza la generosidad, la amabilidad y la sensualidad. 
            Durante este año, se espera que las personas experimenten un período de estabilidad financiera y emocional. 
            El Cerdo también trae consigo una energía calmada y pacífica, lo que significa que este año será propicio para las relaciones personales y la armonía familiar. 
            Además, se espera que haya un enfoque renovado en la gratificación y el disfrute de las cosas simples de la vida. 
            Es un momento favorable para establecer metas realistas y trabajar de manera constante hacia su logro. 
            En general, el año del Cerdo promete ser un año de bienestar, éxito y satisfacción personal para aquellos que sigan su ritmo tranquilo y aprovechen las oportunidades que se les presenten.'
        }
        Default {
            $res.Text = (
                'no aguanto más'
            )
        }
    }
}
function Numero {
    $lblRes.ForeColor = 'Coral'
    $res.ForeColor = 'Coral'
    $res.Font = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::bold)
    # Obtención Conversion de números
        $fecha      = [string]$txtDate.Text
            $tFecha     = $fecha.Split('-')
                $anyoNum    = $tFecha[0]
                $mesNumPre  = $tFecha[1]
                $diaNumPre  = $tFecha[2]
                    $mesNum     = $mesNumPre.PadLeft(2,'0')
                    $diaNum     = $diaNumPre.PadLeft(2,'0')
    # Obtención de carácteres
        # Año
            [int]$anyoNum1  = [convert]::ToInt32($anyoNum[0],10)
            [int]$anyoNum2  = [convert]::ToInt32($anyoNum[1],10)
            [int]$anyoNum3  = [convert]::ToInt32($anyoNum[2],10)
            [int]$anyoNum4  = [convert]::ToInt32($anyoNum[3],10)
        # Mes
            [int]$mesNum1   = [convert]::ToInt32($mesNum[0],10)
            [int]$mesNum2   = [convert]::ToInt32($mesNum[1],10)
        # Día
            [int]$diaNum1   = [convert]::ToInt32($diaNum[0],10)
            [int]$diaNum2   = [convert]::ToInt32($diaNum[1],10)
    # Calculo del número mágico
    $resNum = (
        $anyoNum1 + $anyoNum2 + $anyoNum3 + $anyoNum4 + 
        $mesNum1 + $mesNum2 + 
        $diaNum1 + $diaNum2
    )
    Write-Host 'res #' $resNum
    do {
        $resSt      = $resNum.ToString()
        $resNum1    = [convert]::ToInt32($resSt[0],10)
        Write-Host '1#' $resNum1
        $resNum2    = [convert]::ToInt32($resSt[1],10) 
        Write-Host '2#' $resNum2
        $resNum = $resNum1 + $resNum2
        Write-Host $resNum
    } while ($resNum -gt 10)
    switch ($resNum) {
        1   { 
            $res.Text = 'Número Mágico:' + $resNum + ' // ' + 'Si este es tu número significa que eres un líder por naturaleza, siempre das un paso adelante y disfrutas de tu independencia. 
            Eres muy entusiasta y sociable, pero no sabes obedecer y seguir órdenes.'
         }
        2   { 
            $res.Text = 'Número Mágico:' + $resNum + ' // ' + 'Te gusta estar en armonía y quieres cumplir con las expectativas de todos. 
            Si no lo hacer puedes llegar a sentirte triste e insegura. Además, suelen depender mucho de otras personas.'
         }
        3   { 
            $res.Text = 'Número Mágico:' + $resNum + ' // ' + 'Eres una persona que se deja llevar por los celos y critica a otras personas, ya que no puedes evitar ser imprudente y decir lo que piensas, aunque estés equivocada.'
         }
        4   { 
            $res.Text = 'Número Mágico:' + $resNum + ' // ' +  'Eres una persona muy disciplinada, te fijas en todos los mínimos detalles y sueles ser precavida. 
            Puedes llegar a cumplir con tus metas con tu esfuerzo y dedicación. Sin embargo, deberías ser más espontánea y disfrutar de las sorpresas.'
         }
        5   { 
            $res.Text = 'Número Mágico:' + $resNum + ' // ' +  'Eres amante de la aventura, te gusta vivir nuevas experiencias y viajar cada vez que puedas. 
            Esto puede distraerte de tus tareas y de tus objetivos a futuro.'
         }
        6   { 
            $res.Text = 'Número Mágico:' + $resNum + ' // ' +  'Amas pasar tiempo con tu familia y disfrutas de la naturaleza, también puedes ser idealista y posesivo con las personas que estimas.'
         }  
        7   { 
            $res.Text = 'Número Mágico:' + $resNum + ' // ' +  'Aprovechas mucho tu tiempo en soledad para reflexionar sobre tu vida y pensar en ti. 
            Te gusta la filosofía y encontrarle sentido a tu vida. Aunque esto te puede llevar a aislarte de los demás y ser muy melancólico.'
         }
        8   { 
            $res.Text = 'Número Mágico:' + $resNum + ' // ' +  'Te gusta motivar a las personas a tu alrededor, eres una persona muy perseverante y cualquier negocio que manejes los sacarás adelante.'
         }
        9   { 
            $res.Text = 'Número Mágico:' + $resNum + ' // ' +  'Eres una persona sensible y compasiva, sin embargo, puedes llegar a decepcionarte de las personas con mucha facilidad.'
         }
        Default { Write-Host 'EING2'}
    }
}
function subMenus {
    #Botones para otros apartados
    # Foro
    $btForo = New-Object System.Windows.Forms.Button
    $btForo.Text = 'Foro'
    $btForo.Size = New-Object System.Drawing.Size(400, 90)
    $btForo.Location = New-Object System.Drawing.Point(1120, 575)
    $btForo.BackColor = 'SpringGreen'
    $btForo.Add_Click({ .\Apartados\Foro\foroLogin.ps1 })
    $horo.Controls.Add($btForo)
    # Plantas
    $btPlants = New-Object System.Windows.Forms.Button
    $btPlants.Text = 'Plantas Medicinales'
    $btPlants.Size = New-Object System.Drawing.Size(400, 90)
    $btPlants.Location = New-Object System.Drawing.Point(1120, 675)
    $btPlants.BackColor = 'YellowGreen'
    $btPlants.Add_Click({ .\Apartados\Plantas\Plantas.ps1 })
    $horo.Controls.Add($btPlants)
    # Salir
    $btExit = New-Object System.Windows.Forms.Button
    $btExit.Text = 'SALIR'
    $btExit.Size = New-Object System.Drawing.Size(400, 90)
    $btExit.Location = New-Object System.Drawing.Point(1120, 775)
    $btExit.BackColor = 'Salmon'
    $btExit.Add_Click({ $horo.Close() })
    $horo.Controls.Add($btExit)
}
# Area Principal
    $horo = New-Object System.Windows.Forms.Form
    $horo.Text = 'Foro'
    $horo.Size = New-Object System.Drawing.Size(1600, 1000)
    $horo.StartPosition = 'centerscreen'
    $horo.BackColor = 'Black'
# Input
    # Etiqueta Principal
        $lblInput = New-Object System.Windows.Forms.Label
        $lblInput.Text = "Introduzca su fecha de nacimiento:"
        $lblInput.ForeColor = 'YellowGreen'
        $lblInput.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::bold)
        $lblInput.Location = New-Object System.Drawing.Point(375, 100)
        $lblInput.Size = New-Object System.Drawing.Size(375, 50)
        $horo.Controls.Add($lblInput)
# Inputs
    # Inputs Fecha
        $txtDate = New-Object System.Windows.Forms.TextBox
        $txtDate.Size = New-Object System.Drawing.Size(200, 50)
        $txtDate.Location = New-Object System.Drawing.Point(775, 100)
        $horo.Controls.Add($txtDate)
    # Etiqueta Explicación
        $lblExp = New-Object System.Windows.Forms.Label
        $lblExp.Text = 'Formato Fecha (AAAA-MM-DD)'
        $lblExp.Size = New-Object System.Drawing.Size(200, 20)
        $lblExp.Location = New-Object System.Drawing.Point(775, 80)
        $lblExp.ForeColor = 'YellowGreen'
        $horo.Controls.Add($lblExp)
# Botones
    # Boton Occidental
        $btOcc = New-Object System.Windows.Forms.Button
        $btOcc.Text = 'Occidental'
        $btOcc.Size = New-Object System.Drawing.Size(180, 60)
        $btOcc.Location = New-Object System.Drawing.Point(375, 150)
        $btOcc.BackColor = 'Plum'
        $btOcc.Add_Click({ Occidental })
        $horo.Controls.Add($btOcc)  
    # Boton Chino
        $btChi = New-Object System.Windows.Forms.Button
        $btChi.Text = 'Chino'
        $btChi.Size = New-Object System.Drawing.Size(180, 60)
        $btChi.Location = New-Object System.Drawing.Point(585, 150)
        $btChi.BackColor = 'LightSeaGreen'
        $btChi.Add_Click({ Chino })
        $horo.Controls.Add($btChi)  
    # Botón Numero Mágico
        $btNum = New-Object System.Windows.Forms.Button
        $btNum.Text = 'Numero Mágico'
        $btNum.Size = New-Object System.Drawing.Size(180, 60)
        $btNum.Location = New-Object System.Drawing.Point(795, 150)
        $btNum.BackColor = 'Coral'
        $btNum.Add_Click({ Numero })
        $horo.Controls.Add($btNum)
# Etiqueta Resultado
    $lblRes = New-Object System.Windows.Forms.Label
    $lblRes.Text = 'Resultado: '
    $lblRes.ForeColor = 'YellowGreen'
    $lblRes.Font = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::bold)
    $lblRes.Location = New-Object System.Drawing.Point(300, 250)
    $lblRes.Size = New-Object System.Drawing.Size(150, 50)
    $horo.Controls.Add($lblRes)
# Texto Resultado
    $res = New-Object System.Windows.Forms.Label
    $res.Text = ' '
    $res.ForeColor = 'YellowGreen'
    $res.Font = New-Object System.Drawing.Font("Arial", 14)
    $res.Location = New-Object System.Drawing.Point(300, 300)
    $res.Size = New-Object System.Drawing.Size(700, 900)
    $horo.Controls.Add($res)
# Inicialización de Menus
    mainHoro
    curDate
    subMenus
# Mostrar todo
    $horo.ShowDialog()