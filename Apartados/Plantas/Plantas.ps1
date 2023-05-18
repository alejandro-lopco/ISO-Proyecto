Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
# Declaración de funciones
function mainPlant {
    #Etiqueta Principal
        $lblPlant = New-Object System.Windows.Forms.Label
        $lblPlant.Text = 'Plantas'
        $lblPlant.Font = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::bold)
        $lblPlant.Size = New-Object System.Drawing.Size(500, 55)
        $lblPlant.Location = New-Object System.Drawing.Point(25, 25)
        $lblPlant.ForeColor = 'LightCyan'
        $plant.Controls.Add($lblPlant)
    #Etiqueta Subprincipal
        $lblSubPlant = New-Object System.Windows.Forms.Label
        $lblSubPlant.Text = 'Si se siente raro'
        $lblSubPlant.Font = New-Object System.Drawing.Font("Arial", 14, [System.Drawing.FontStyle]::bold)
        $lblSubPlant.Size = New-Object System.Drawing.Size(225, 50)
        $lblSubPlant.Location = New-Object System.Drawing.Point(25, 80)
        $lblSubPlant.ForeColor = 'Salmon'
        $plant.Controls.Add($lblSubPlant)
}
function dolDisplay {
    $planta = @{
        'Tos'               = @('Cúrcuma','La cúrcuma contiene curcumina, un compuesto que puede tener propiedades antiinflamatorias, antivirales y antibacterianas. También puede ser beneficiosa para varias afecciones, incluida la tos seca.La curcumina se absorbe mejor en el torrente sanguíneo cuando se toma con pimienta negra. Puedes agregar 1 cucharadita de cúrcuma y 1/8 cucharadita de pimienta negra en una bebida, como jugo de naranja frío, y beberlo. También puedes convertirlo en un té caliente.')
        'Mucosidad'         = @('Eucalipto','El eucalipto es ampliamente reconocido por sus propiedades beneficiosas para aliviar los síntomas asociados con la congestión nasal y los mocos. Sus hojas contienen un compuesto llamado eucaliptol, que actúa como descongestionante natural y expectorante. Cuando se inhala, el vapor del eucalipto ayuda a dilatar los conductos respiratorios, aliviando la congestión y facilitando la expulsión de los mocos acumulados. Además, sus propiedades antisépticas y antibacterianas ayudan a combatir las infecciones respiratorias, reduciendo la inflamación y promoviendo la curación. El eucalipto también tiene propiedades calmantes que pueden aliviar la irritación y la picazón en la garganta, proporcionando un alivio adicional durante los resfriados y la gripe. Ya sea a través de inhalaciones de vapor, aceites esenciales o tés de hojas de eucalipto, esta planta ofrece una opción natural y efectiva para combatir los mocos y promover una mejor respiración.')
        'Fiebre'            = @( 'Tomillo','El tomillo es una hierba aromática ampliamente reconocida por sus propiedades medicinales y beneficios para la salud. Cuando se trata de lidiar con la fiebre, el tomillo puede ser un aliado natural valioso. Esta planta contiene compuestos activos, como el timol y el carvacrol, que tienen propiedades antibacterianas y antivirales. Estos compuestos ayudan a fortalecer el sistema inmunológico y a combatir los agentes causantes de la fiebre. Además, el tomillo también actúa como un expectorante y descongestionante, lo que puede aliviar los síntomas asociados con las infecciones respiratorias que a menudo acompañan a la fiebre. Ya sea en forma de infusión o como parte de una dieta equilibrada, agregar tomillo a tu rutina puede ayudar a reducir la fiebre y promover una recuperación más rápida y efectiva. Sin embargo, es importante recordar que la fiebre puede ser un síntoma de una enfermedad subyacente, por lo que es fundamental consultar a un profesional de la salud para un diagnóstico adecuado y un tratamiento adecuado.')
        'Dolor de Garganta' = @('Jengibre','El jengibre es ampliamente reconocido por sus propiedades medicinales y su capacidad para aliviar el dolor de garganta de manera natural. Sus componentes activos, como los gingeroles y los shogaols, poseen propiedades antiinflamatorias y analgésicas que pueden reducir la inflamación y el malestar en la garganta. Además, el jengibre es conocido por su efecto calmante y reconfortante, lo que puede aliviar la irritación y la picazón en la garganta. Puedes disfrutar del jengibre en forma de té, agregando rodajas de jengibre fresco a agua caliente, o incluso chupar trozos pequeños de jengibre para obtener alivio instantáneo. Además de sus propiedades para aliviar el dolor de garganta, el jengibre también puede fortalecer el sistema inmunológico, ayudando a combatir las infecciones y acelerar la recuperación.')
        'Dolor en la Tripa' = @('Manzanilla','La manzanilla es una de las plantas medicinales que más se conocen por las propiedades de su flor. Sus efectos son especialmente relevantes en el tratamiento de molestias gastrointestinales.Además de ello, tiene efectos antiinflamatorios, antibacterianas y relajantes. Se utiliza en dolor gastrointestinal y muscular, calambres y cefaleas, eczemas, inflamación de encías, heridas y sinusitis. También reduce el colesterol y al parecer tiene propiedades anticancerígenas.')
        'Vómitos'           = @('Clavos','La manzanilla, una hierba reconocida por sus propiedades medicinales, ofrece numerosos beneficios para aliviar el dolor de tripa. Sus propiedades antiinflamatorias y calmantes pueden ayudar a reducir la inflamación y relajar los músculos del tracto gastrointestinal, lo que puede aliviar el malestar abdominal. Además, la manzanilla tiene propiedades carminativas que ayudan a reducir la formación de gases y aliviar los espasmos intestinales, lo que contribuye a aliviar el dolor y las molestias estomacales. Esta planta también tiene un efecto suavizante y protector sobre la mucosa del tracto digestivo, lo que puede ayudar a reducir la irritación y la acidez estomacal. Ya sea consumida en forma de té de manzanilla caliente o aplicada tópicamente como compresa, la manzanilla puede ser un recurso natural y efectivo para aliviar el dolor de tripa y promover la salud digestiva.')
        'Apetito'           = @('Poleo menta','El poleo menta es una hierba aromática ampliamente conocida por sus beneficios para el sistema digestivo y su capacidad para estimular el apetito. Esta planta contiene compuestos activos que actúan como estimulantes naturales del apetito, lo que la convierte en una excelente opción para lidiar con la falta de apetito. Al consumir una infusión de poleo menta antes de las comidas, sus propiedades carminativas ayudan a estimular la producción de enzimas digestivas y aumentar la secreción de jugos gástricos, lo que mejora la digestión y despierta el apetito. Además, su sabor refrescante y aroma agradable pueden despertar el interés por la comida, lo que lo convierte en una opción ideal para aquellos que tienen dificultades para comer. El poleo menta también es conocido por sus propiedades relajantes, lo que puede ayudar a reducir el estrés y la ansiedad relacionados con la falta de apetito. En general, el poleo menta es una opción natural y sabrosa para estimular el apetito y mejorar el disfrute de las comidas.')
        'Estrés'            = @('Ginseng','El ginseng es una hierba medicinal ampliamente reconocida por sus beneficios para lidiar con el estrés. Sus propiedades adaptogénicas ayudan al cuerpo a adaptarse y responder de manera más efectiva a situaciones estresantes. El consumo regular de ginseng puede ayudar a mejorar la resistencia física y mental, aliviando los síntomas asociados con el estrés, como la fatiga y la ansiedad. Además, el ginseng puede ayudar a regular los niveles de cortisol, la hormona del estrés, en el organismo, lo que contribuye a reducir los efectos negativos del estrés crónico en el cuerpo. Además de sus propiedades relajantes, el ginseng también puede mejorar la concentración y el enfoque, lo que resulta beneficioso para mantener una mente clara y equilibrada en situaciones estresantes. En resumen, el ginseng es una opción natural y efectiva para gestionar el estrés, proporcionando apoyo físico y mental en tiempos de tensión y presión.')
        'AntiOxidante'      = @('Ajo','El ajo es conocido por ser un poderoso antioxidante natural que ofrece una amplia gama de beneficios para la salud. Contiene compuestos como los polifenoles y el alicina, los cuales actúan como antioxidantes y ayudan a proteger las células del daño causado por los radicales libres. Al consumir ajo regularmente, se pueden experimentar beneficios como la reducción del estrés oxidativo, la mejora de la función cardiovascular, la fortaleza del sistema inmunológico y la reducción del riesgo de enfermedades crónicas como el cáncer y las enfermedades cardiovasculares. Además, el ajo también tiene propiedades antiinflamatorias y antimicrobianas, lo que contribuye a fortalecer el sistema inmunológico y combatir infecciones. En resumen, incorporar el ajo en la dieta puede proporcionar beneficios antioxidantes significativos y mejorar la salud en general.')
        'Circulación'       = @('Ortiga','Las ortigas son reconocidas por sus numerosos beneficios para mejorar la circulación. Estas plantas contienen compuestos bioactivos, como flavonoides y ácidos fenólicos, que promueven la dilatación de los vasos sanguíneos y mejoran el flujo sanguíneo en el cuerpo. Además, las ortigas son ricas en vitamina C, que fortalece las paredes de los vasos sanguíneos y aumenta la producción de colágeno, favoreciendo la elasticidad y la salud general del sistema circulatorio. También tienen propiedades diuréticas, lo que significa que pueden ayudar a eliminar el exceso de líquidos y toxinas del cuerpo, reduciendo la retención de líquidos y aliviando la hinchazón asociada con la mala circulación. En resumen, consumir ortigas puede ser beneficioso para mejorar la circulación sanguínea, promover la salud cardiovascular y aliviar los síntomas de la mala circulación.')
        'Calambres'         = @('Cola de Caballo','La cola de caballo, conocida científicamente como Equisetum arvense, es una planta medicinal que ha sido utilizada durante siglos debido a sus diversos beneficios para la salud. Cuando se trata de lidiar con los calambres, la cola de caballo puede ser especialmente beneficiosa. Esta planta contiene altas concentraciones de minerales como el silicio, el potasio y el magnesio, los cuales desempeñan un papel fundamental en el mantenimiento de la salud muscular y la prevención de calambres. El silicio, por ejemplo, es esencial para la formación y fortaleza de los tejidos conectivos, como los tendones y los ligamentos, lo que ayuda a reducir la probabilidad de calambres. Además, la cola de caballo tiene propiedades diuréticas suaves, lo que significa que puede ayudar a eliminar el exceso de líquidos y toxinas del cuerpo, aliviando la retención de líquidos que puede contribuir a los calambres. Por último, esta planta también tiene propiedades antiinflamatorias, lo que puede ayudar a reducir la inflamación en los músculos y aliviar el malestar asociado con los calambres. En general, la cola de caballo puede ser una opción natural y efectiva para lidiar con los calambres musculares y mejorar el bienestar general. Sin embargo, es importante hablar con un profesional de la salud antes de utilizarla, especialmente si se tienen condiciones médicas preexistentes o se están tomando otros medicamentos.')
        'Quemaduras'        = @('Aloe Vera','Otra de las plantas medicinales más conocidas es el Aloe Vera. Se trata de una conocida planta con capacidad antiinflamatoria y que se utiliza en diversos productos de higiene personal debido a su acción favorecedora para la regeneración cutánea.Contribuye a eliminar manchas, y a sanar quemaduras y heridas (aunque es importante hacerlo contando con asesoramiento médico). Además, la consistencia del líquido que hay dentro de sus hojas es similar a la de un gel, favoreciendo su absorción progresiva al ser esparcida por la piel.También puede ser usada en la elaboración de algunos alimentos: ingerida, mejora la función intestinal y fortalece el sistema inmune.')
        'Menstruación'      = @('Romero','El romero es una hierba aromática que ha sido utilizada durante siglos por sus numerosos beneficios para la salud. En relación con la menstruación, el romero puede ser beneficioso debido a sus propiedades antiespasmódicas y analgésicas. El consumo de romero puede ayudar a aliviar los calambres y dolores menstruales, ya que tiene la capacidad de relajar los músculos uterinos y disminuir la intensidad de los espasmos. Además, el romero contiene compuestos antioxidantes que pueden ayudar a reducir la inflamación asociada con el ciclo menstrual. También se cree que el romero puede tener un efecto regulador sobre los desequilibrios hormonales, lo que podría contribuir a una menstruación más regular. Sin embargo, es importante tener en cuenta que cada persona es diferente, y los efectos pueden variar. Siempre es recomendable consultar a un profesional de la salud antes de incorporar cualquier hierba o suplemento a tu rutina menstrual.')
        'AntiInflamatorias' = @('Laurel','El laurel, conocido científicamente como Laurus nobilis, es una planta que ha sido ampliamente utilizada desde la antigüedad debido a sus numerosos beneficios para la salud. Uno de los beneficios más destacados del laurel es su capacidad para actuar como un potente antiinflamatorio. Sus hojas contienen compuestos activos como el eugenol, el cual posee propiedades antiinflamatorias y analgésicas. Cuando se consume o se aplica externamente, el laurel puede ayudar a reducir la inflamación en diversas partes del cuerpo. Esto puede ser especialmente beneficioso para tratar afecciones como la artritis, la inflamación muscular, los dolores de cabeza y las irritaciones cutáneas. Además, el laurel también puede ayudar a aliviar los síntomas de trastornos respiratorios, como el asma y la bronquitis, gracias a sus propiedades antiinflamatorias. En resumen, el laurel es un valioso aliado natural en la lucha contra la inflamación, ofreciendo una alternativa natural y efectiva a los medicamentos convencionales. Sin embargo, es importante consultar a un profesional de la salud antes de usar el laurel con fines medicinales para garantizar su adecuado uso y dosificación.')
        'Artritis'          = @('Escaramujo','El escaramujo, también conocido como rosa mosqueta, es un fruto ampliamente reconocido por sus beneficios en el tratamiento de la artritis. Este fruto contiene una alta concentración de vitamina C, un poderoso antioxidante que ayuda a reducir la inflamación y fortalecer el sistema inmunológico. Además, el escaramujo contiene compuestos antiinflamatorios naturales, como los flavonoides y los ácidos grasos esenciales, que contribuyen a aliviar el dolor y la rigidez en las articulaciones. La rosa mosqueta también es una fuente rica en vitamina A, que desempeña un papel crucial en la salud ósea y ayuda a mantener la integridad de las articulaciones. Su consumo regular puede mejorar la movilidad articular, disminuir la progresión de la enfermedad y proporcionar un alivio general a las personas que sufren de artritis. Sin embargo, es importante destacar que el escaramujo no reemplaza el tratamiento médico convencional, pero puede ser un complemento efectivo para el manejo de los síntomas de la artritis. Se recomienda consultar con un profesional de la salud antes de iniciar cualquier suplemento o cambio en la dieta.')
        'Picor'             = @('Hipérico','El Hipérico, también conocido como hierba de San Juan, es una planta medicinal reconocida por sus múltiples beneficios para la salud. Entre sus propiedades destacadas se encuentra su capacidad para aliviar los picores en la piel. El Hipérico posee propiedades antiinflamatorias y calmantes que pueden reducir la sensación de picor y aliviar la irritación cutánea. Además, esta planta contiene compuestos naturales, como los flavonoides y los taninos, que ayudan a promover la cicatrización de la piel y a protegerla de posibles infecciones. El Hipérico puede aplicarse tópicamente en forma de ungüento o aceite, proporcionando un alivio rápido y eficaz para los picores. Es importante destacar que, como con cualquier tratamiento natural, es recomendable consultar a un profesional de la salud antes de usar el Hipérico para asegurarse de su adecuación y evitar posibles interacciones con otros medicamentos o condiciones médicas.')
        'Hipotensión'       = @('Moringa','La Moringa, una planta conocida también como "árbol de la vida", ofrece una serie de beneficios para lidiar con la hipotensión, una condición caracterizada por una presión arterial anormalmente baja. Esta planta es rica en nutrientes esenciales como vitaminas, minerales y antioxidantes que pueden ayudar a mejorar la circulación sanguínea y promover un aumento de la presión arterial de manera natural. La Moringa contiene altas cantidades de vitamina C, que fortalece las paredes de los vasos sanguíneos y favorece una mejor contracción de los mismos, lo que contribuye a elevar la presión arterial. Además, su contenido en hierro ayuda a prevenir la anemia, una condición que puede agravar los síntomas de la hipotensión. También se ha demostrado que la Moringa tiene propiedades antiinflamatorias, lo que puede reducir la inflamación en los vasos sanguíneos y mejorar el flujo de sangre. Por último, su capacidad para regular los niveles de azúcar en la sangre puede prevenir caídas bruscas en la presión arterial que pueden ocurrir en personas con hipotensión. En resumen, la Moringa ofrece una combinación única de nutrientes y propiedades que pueden ayudar a aliviar los síntomas de la hipotensión y mejorar la salud cardiovascular de manera general.')
    }
    foreach ($plantaHash in $planta.Keys) {
        if ($listaDol.SelectedItem -ieq $plantaHash) {
            $resPlant.Text = "Planta Medicinal: " + $planta[$plantaHash][0]
            $resPlantExpl.Text = $planta[$plantaHash][1]
        }
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
            $plant.Controls.Add($btForo)
        # Horóscopo
            $btHoro = New-Object System.Windows.Forms.Button
            $btHoro.Text = 'Horóscopo'
            $btHoro.Size = New-Object System.Drawing.Size(400, 90)
            $btHoro.Location = New-Object System.Drawing.Point(1120, 675)
            $btHoro.BackColor = 'YellowGreen'
            $btHoro.Add_Click({ .\Apartados\Horoscopo\Horoscopo.ps1 })
            $plant.Controls.Add($btHoro)
        # Salir
            $btExit = New-Object System.Windows.Forms.Button
            $btExit.Text = 'SALIR'
            $btExit.Size = New-Object System.Drawing.Size(400, 90)
            $btExit.Location = New-Object System.Drawing.Point(1120, 775)
            $btExit.BackColor = 'Salmon'
            $btExit.Add_Click({ $plant.Close() })
            $plant.Controls.Add($btExit)
    }
# Area Pricipal
    $plant = New-Object System.Windows.Forms.Form
    $plant.Text = 'Plantas Medicnales'
    $plant.Size = New-Object System.Drawing.Size(1600, 1000)
    $plant.StartPosition = 'centerscreen'
    $plant.BackColor = 'Black'
# Menu Dolencia
    # Etiqueta Dolencias
        $lblDol = New-Object System.Windows.Forms.Label
        $lblDol.Text = 'Escoga la dolencia que esté sufriendo'
        $lblDol.Font = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::bold)
        $lblDol.Size = New-Object System.Drawing.Size(300, 50)
        $lblDol.Location = New-Object System.Drawing.Point(25, 130)
        $lblDol.ForeColor = 'DodgerBlue'
        $plant.Controls.Add($lblDol)
    # Lista Dolencias
        $listaDol = New-Object System.Windows.Forms.Listbox
        $listaDol.Size = New-Object System.Drawing.Size(300,580)
        $listaDol.Location = New-Object System.Drawing.Point(25,200)
        $listaDol.Font = New-Object System.Drawing.Font("Arial", 18)
        $listaDol.Items.Add('Tos') > $null
        $listaDol.Items.Add('Mucosidad') > $null
        $listaDol.Items.Add('Fiebre') > $null
        $listaDol.Items.Add('Dolor de Garganta') > $null
        $listaDol.Items.Add('Dolor en la Tripa') > $null
        $listaDol.Items.Add('Vómitos') > $null
        $listaDol.Items.Add('AntiOxidante') > $null
        $listaDol.Items.Add('Apetito') > $null
        $listaDol.Items.Add('Estrés') > $null
        $listaDol.Items.Add('Circulación') > $null
        $listaDol.Items.Add('Calambres') > $null
        $listaDol.Items.Add('Quemaduras ') > $null
        $listaDol.Items.Add('Menstruación ') > $null
        $listaDol.Items.Add('AntiInflamatorias') > $null
        $listaDol.Items.Add('Artritis') > $null
        $listaDol.Items.Add('Picor') > $null
        $listaDol.Items.Add('Hipotensión') > $null
        $plant.Controls.Add($listaDol)
    # Boton Dolencias
        $btDol = New-Object System.Windows.Forms.Button
        $btDol.Text = 'Foro'
        $btDol.Size = New-Object System.Drawing.Size(300, 90)
        $btDol.Location = New-Object System.Drawing.Point(25, 800)
        $btDol.BackColor = 'DodgerBlue'
        $btDol.Add_Click({ dolDisplay })
        $plant.Controls.Add($btDol)
    # Texto Planta Resultado
        $resPlant = New-Object System.Windows.Forms.Label
        $resPlant.Size = New-Object System.Drawing.Size(600,75)
        $resPlant.Location = New-Object System.Drawing.Point(400, 50)
        $resPlant.Font = New-Object System.Drawing.Font("Arial", 20,[System.Drawing.FontStyle]::bold)
        $resPlant.Text = 'Planta: '
        $resPlant.ForeColor = 'DodgerBlue'
        $plant.Controls.Add($resPlant)
    # Texto Planta Explicación
        $resPlantExpl = New-Object System.Windows.Forms.Label
        $resPlantExpl.Size = New-Object System.Drawing.Size(700,900)
        $resPlantExpl.Location = New-Object System.Drawing.Point(400, 125)
        $resPlantExpl.Font = New-Object System.Drawing.Font("Arial", 20)
        $resPlantExpl.Text = ' '
        $resPlantExpl.ForeColor = 'DodgerBlue'
        $plant.Controls.Add($resPlantExpl)
# Inizialicación de funciones
    mainPlant
    subMenus
# Mostrar Todo
    $plant.ShowDialog()