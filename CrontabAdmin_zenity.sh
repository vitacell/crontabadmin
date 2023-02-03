#!/bin/bash

# Licence GNU GPL3
# Licencia GNU GPL3

# Free as in freedom, not free as in beer







#							d888888b  d8b   db  d888888b  d8888b.   .d88b.   d8888b.  db    db   .o88b.   .o88b.  d888888b   .d88b.   d8b   db 
#							  `88'    888o  88  `~~88~~'  88  `8D  .8P  Y8.  88  `8D  88    88  d8P  Y8  d8P  Y8    `88'    .8P  Y8.  888o  88 
#							   88     88V8o 88     88     88oobY'  88    88  88   88  88    88  8P       8P          88     88    88  88V8o 88
#							   88     88 V8o88     88     88`8b    88    88  88   88  88    88  8b       8b          88     88    88  88 V8o88
#							  .88.    88  V888     88     88 `88.  `8b  d8'  88  .8D  88b  d88  Y8b  d8  Y8b  d8    .88.    `8b  d8'  88  V888 
#						       Y888888P   VP   V8P     YP     88   YD   `Y88P'   Y8888D'  ~Y8888P'   `Y88P'   `Y88P'  Y888888P   `Y88P'   VP   V8P
                                                                             
                                                                             




#          SCRIPT EN BASH, COMODO, FACIL Y SEGURO EN INTRODUCCION DE CONTRASEÑAS PARA USUARIOS QUE DESEAN ADMINISTRAR SUS TAREAS AUTOMATIZADAS DE BACKUP DE BASE DE DATOS O REALIZAR BACKUP MANUALMENTE


# ----------------------------------- INTRODUCCION ------------------------------------

# EL MOTIVO DE ESTE SCRIPT ES HACER UN PROGRAMA AMIGABLE CON EL USUARIO, ESTO ES UN SCRIPT EN BASH (BORN AGAIN SHELL de GNU, como sustituto de Bourne Shell (sh)), PARA FACILITAR A LOS USUARIOS DE WINDOWS QUE TIENEN TERMINALOFOBIA/CONSOLAFOBIA PROPORCIONANDOLES UNA GUI (GRAPHIC USER INTERFACE), ADMINISTRAR SUS TAREAS EN CRONTAB Y HACER BACKUP DE SUS BASES DE DATOS SIN TENER QUE PENSAR NI TECLEAR MUCHO, Y SIN TENER QUE VER LA TERRORIFICA TERMINAL, LES PERMITIRA PROCEDER MEDIANTE MENSAJITOS E ICONITOS.

# el autor de este programa empezo portando el script en Glade, pero posteriormente desecharon todo el trabajo hecho ya que era una tarea complicada por no ser la adecuada, Glide es una buena manera dar interfaz a tus programas en C o C++ pero no es adecuado para scripts en BASH

# importante en sistemas operativos UNIX (Apple OSX...) o UNIX LIKE (GNU...), dar nombres sin espacios, ya que comandos con rutas para intercatuar con archos con espacios en su nombre, delante de cada espacio debemos poner una contrabarra ("\") delante de cada espacio. En vez de espacios utilizaremos "-" o "_" para facilitar el trabajo y evitar problemas.

# Este script se puede hacer mas rapido, con zenity toma su tiempo, pero si el programa se usa a menudo, se ganara mucho tiempo dada su comodidad y estabilidad

# la mayoria de los programadores desecha la opcion de dar GUI a sus scripts en bash, ya que por ejemplo con zenity la realizacion de script toma bastante mas tiempo y programacion se vuelve mas engorrosa, a parte comentar y documentar el programa toma bastante mas tiempo

# ----------------------------------- FIN INTRODUCCION -------------------------------






# por seguridad, variables de entorno (PATH, EDITOR, SHELL, ...) y otras internas variables de shell (BASH_VERSION, RANDOM, ...) son totalmente capitalizadas, todas las demas demas variables deberian declararse en minusculas, porque todas las variables son sensitivas a minusculas/mayusculas, esto evitara accidentalmente sobreescribir variables de entorno internas del sistema





# ------------------ lo siguiente es un codigo que comprobamos si el usuario tiene privilegios de superusuario o no ------------------------- OMITIDO
# pero se omite este codigo por que almacenaremos directamente nuestra contraseña de superusuario en una variable y ejecutaremos comandos con "sudo" y la contraseña introducida

# controlamos si lo ejecutamos como superusuario, si no es asi, escupimos un mensaje en output/consola y detenemos la ejecucion, ya que los archivos con los que vamos a interactuar estan protegidos contra la modificacion por un usuario, tambien interactuaremos con los servicios del sistema que tambien necesitaran permisos de superusuario

# if [ "$(id -u)" != "0" ]; then
   # Escupimos el mensaje de error en zenity de que no estamos usando el script como superusuario, por lo tanto no nos dejaria editar nada si no es asi, y finalizamos el programa
  # zenity --width=350 --height=120 --error --title="Error de privilegios" --text "Este script debe ejecutarse como superusuario, vuelve a ejecutarlo escribiendo en la consola 'sudo su' y introduce tu contraseña"
   # lo mismo que lo anterior pero en terminal en vez de en zenity
  # echo "Este script debe ejecutarse como superusuario, vuelve a ejecutarlo escribiendo en la consola 'sudo su' y introduce tu contrasena" 1>&2
  # exit 1
# fi

# lo anterior es incomodo para el usuario, ya que tendra que volver a ejecutar el programa, por lo tanto omitimos este codigo, ya que controlaremos permisos de una forma mas comoda y efectiva




# a partir de ahora simplemente ejecutaremos cualquier comando que requiera privilegios de superusuario con nuestro usuario pero con "sudo"

# variable donde almacenaremos la contraseña introducida por el usuario
# PASSWD="$(zenity --password --title="Introduce contraseña de superusuario")"

# comando de prueba de si tenemos privilegios de superusuario
# tambien ejecutaremos a partir de ahora todos los comandos con sudo y la contraseña para usuario
# echo -e $PASSWD | sudo -S whoami

# omitimos declarar variables en castellano que lleven "ñ" para evitar problemas, de alli llamar variable de la contraseña como "password" y no "contraseña"



# usamos una funcion, ya que nos ahorrara lineas del mismo codigo, para no tener que poner lo mismo todo el rato
















                                                        #######   #     #   #     #    #####    ###    #####    #     #   #######    #####  
                                                        #         #     #   ##    #   #     #    #    #     #   ##    #   #         #     # 
                                                        #         #     #   # #   #   #          #    #     #   # #   #   #         #       
                             				#####     #     #   #  #  #   #          #    #     #   #  #  #   #####      #####  
							#         #     #   #   # #   #          #    #     #   #   # #   #               # 
							#         #     #   #    ##   #     #    #    #     #   #    ##   #         #     # 
							#          #####    #     #    #####    ###    #####    #     #   #######    #####  
                                                                    


#                      PARA DECLARAR LAS FUNCIONES CORRECTAMENTE, SE DECLARAN CON () AL FINAL DEL NOMBRE DE LA FUNCION, () SOLO AL DECLARAR, AL LLAMAR A UNA FUNCION SOLO PONDREMOS SU NOMBRE




# ---------------------------------- FUNCION COMPROBAR CONTRASEÑA ------------------------------------------

function comprobar_password() {


	# declaramos una variable donde emteremos el nombre del usuario (que esta usando este script)
	mi_usuario="$USER"
	
	# almacenamos en una variable el texto de salida "sudo"
	test_sudo="$(groups | grep sudo)"
	
	# si la variable anterior se quedo vacia, es que el usuario que ejecuta el script no tiene permisos administrativos
	if [ -z "$test_sudo" ]; then
	
	  # le avisamos a traves de zenity de que el usuario no tiene permisos administrativos
	  zenity --width=400 --height=120 --error --window-icon="info" --text="${mi_usuario}, no tienes permisos administrativos, por lo tanto hay comandos que no podras ejecutar"
	
	fi

	# mostramos mensaje especifico para introduccion de la contraseña en zenity
	# variable donde almacenaremos la contraseña introducida por el usuario
	# password="$(zenity --password --title="Introduce la contraseña de usuario")"
	
	# IMPORTANTE: por seguridad en las distribuciones GNU+Linux, la contraseña o/y usuario root estan desactivados con por ejemplo comando "#passwd -l root" ("#passwd -u root" hara lo contrario), que bloqueara/desactivara la cuenta root y su contraseña, esto se hace por seguridad, en distribuciones como Ubuntu que por defecto root estara desactivado, tambien su hash y contraseña. Por lo tanto necesitaremos hacer lo mas portable y compatible nuestoro programa, usando la cuenta de usuario que ejecuto el programa pero con permisos administrativos. Se ha recapacitado y he modificado el programa para que no pida la contraseña de root, sino la de usuario con permisos administrativos (cuando el usuario  ejecuta comandos con sudo). Con esto nos evitaremos muchos dolores de cabeza e incompatibilidades, ganaremos portabilidad. No necesitaremos la cuenta root para nada.

	# si usuario responde con boton ACEPTAR
	if password="$(zenity --password --title="${mi_usuario} introduce tu contraseña")"; then

  	# si usuario pulsa boton fisico del teclado ENTER o pulsa ACEPTAR en el boton del programa, se dara un mensaje de informacion, y sin perder el tiempo desaparecera en un segundo
  		zenity --info --text "Enseguida comprobaremos su contraseña" --timeout=1

	# si el usuario pulsa CALCEL
	else

		# si el usuario pulsa cualquier otro boton (en este caso solo CANCELAR es posible), se finalizara el programa
		hasta_luego

	fi

	# una finalizacion intencionada y correcta se llama con "exit 0", "exit 1" se usa si algo va mal y se aborta el programa

	# controlamos que el usuario haya introducido algo, si no introdujo nada, ejecutaremos siguiente codigo (mientras contraseña este vacia o sin ningun caracter)
	while [[ $password == "" ]]; do

		# mostramos en zenity mensaje de error especifico, para forzar al usuario a introducir algo
		zenity --width=400 --height=200 --error --title="Error de contraseña" --text "Introduce algo o finaliza el programa"

		# forzamos a que el usuario vuelva a introducir algo
    	password="$(zenity --width=400 --height=120 --password --title="${mi_usuario} introduce de nuevo tu contraseña")"

		# si el usuario decide pulsar boton CANCELAR del programa, se finalizara la ejecucion y se saldra del programa, aunque tambien se puede salir con boton X de arriva de la ventana, que esta en el mismo decorador d elas ventanas que se este usando
	  if [[ $? == 1 ]]; then
	    exit 0
	  fi
	done

# para saber que linea de codigo estamos ejecutando, para depuracion nos puede servir el siguiente mensaje
#zenity --info --text "Pasamos a la fase de comprobacion de la contraseña"

# usamos programas "getent" y "cut", para obtener contraseña hasheada desde campos GECOS (caracterisitcos de UNIX), con el "cut" recortamos la contraseña hasheada
# tipicamente son datos acerca de usuario que se graban en UNIX
# mas informacion en:
# https://en.wikipedia.org/wiki/Gecos_field

#										minombredeusuario:x:1000:1000:usuario,,,:/home/minombredeusuario:/bin/bash
#										|                 |  |     |     |            		|             	|
#										|                 |  |     |     |            		|             	Autentificador de shell
#										|                 |  |     |     |            	    Home directory
#										|                 |  |     |     Campos GECOS (nombre entero, etc...)
#										|                 |  |     ID de grupo primario
#										|                 |  ID de usuario
#										|                 Indicador de contraseña encriptada
#										Nombre de usuario



	# no confundirse con ID real de usuario con ID efectiva
	# mas acerca de IDs de usuario en:
	# https://es.wikipedia.org/wiki/Identificador_de_usuario

	# las contraseñas en GNU (sistema operativo incorrectamente llamado como Linux) (sistema operativo UNIX-LIKE) no son enriptadas, sino se usa una funcion criptografica hash
	# mas informacion en:
	# https://es.wikipedia.org/wiki/Funci%C3%B3n_hash_criptogr%C3%A1fica

	# En GNU por defecto se utiliza SHA512 (contraseñas hasheadas empezando por "$6$") para hashear la contraseña del usuario
	# si hay curiosidad de comprobar de verdad que estamos usando SHA512 ejecutamos siguiente comando que nos dara el valor de la variable "ENCRYPT_METHOD":
	# $cat /etc/login.defs | grep ENCRYPT_METHOD


#       								          ID  | Method
#          ─────────────────────────────────────────────────────────
#          1   | MD5
#          2a  | Blowfish (not in mainline glibc; added in some
#              | Linux distributions)
#          5   | SHA-256 (since glibc 2.7)
#          6   | SHA-512 (since glibc 2.7)

#          en nuestro caso utilizaremos la SHA512 y la indicaremos con "$6$"

#          atencion, se usa glibc, en algunas distribuciones podria ser diferente ya que en vez de "glibc" se usa "musl" (que es una libreria c diferente, con musl tambien tendriamos problemas con programas compilados sin codigo fuente disponible (software privativo), ya que son binary-only y no podriamos compilarlos para musl, al no disponer de codigo fuente)


	# matematicamente es imposible componer la contraseña real partiendo de hash. La verificacion esta hecha criptografiando a hash la contraseña que introduce el usuario y comparandola con la que ya esta criptografiada en el sistema. Si coinciden, el usuario es autentificado. (ver las formulas mas adelante)
	
	# "getent" es un programa de UNIX que ayuda a obtener entradas de archivos de texto importantes del sistema llamados base de datos. Esto incluye archivos de texto como "passwd" y bases de datos de grupos los cuales almacenan informacion acerca de cada usuario, "getent" es un programa corriente para ver detalles de usuarios en UNIX
	# mas informacion de uso en:
	# https://linux.die.net/man/1/getent

	# como nos interesa el hash de la contraseña de superusuario, directamente ponermos "usuario", recortamos usando delimitador "-d" (le indicamos que nuestro delimitador es "$"), y con "-f" (con el 3 seleccionaremos solo campo delimitado numero 3) seleccionamos solamente campo indicado
	# a la vez ambas contraseñas son almacenadas en su correspondiente variable cada una
	
	# indicamos con "cut" que recortaremos desde el caracter que esta despues de "$" hasta el siguiente "$" (ambos "$" sin incluir) ("$" es un caracter delimitador que le hemos indicado) (si le damos valor al delimitador, el delimitador no se incluye)
	# si antes de un delimitador (en nuestro caso "$") hay al menos un caracter, se contara como un campo, por lo tanto sera campo numero 1
	# con el "getent" obtenemos campos GECOS de usuario "usuario" (que seria informacion completa)(importante ejecutar con poderes de superusuario ya que sino, no nos dara la contraseña hasheada la que esta ya almacenada)
	# con propiedad "shadow" indicaremos que nos extraiga contraseña hasheada desde archivo "shadow" (que esta en /etc/) (para ver contenido de shadow hace falta permisos de superusuario), y no desde archivo "passwd" (que lo uno que mostrara es un "x" en el campo de la contraseña)
	# seria un riesgo de seguridad que se pudiese obtener contraseña hasheada sin permisos de superusuario, por lo tanto un usuario sin permisos de superusuario solo podra ver una y bonita "x"
	# mas acerca de contraseñas UNIX y formatos de archivo shadow en:
	# http://www.tldp.org/LDP/lame/LAME/linux-admin-made-easy/shadow-file-formats.html

	# contraseñas hasheadas con MD5 empiezan con $1$ y las hasheadas con SHA512 empiezan con "$6$"
	# con este comando obtenemos solo una parte (que siempre se mantiene siendo la misma) de contraseña hasheada de usuario desde shadow (ya que si directamente la tomamos completa sera un riesgo de seguridad, y no interesa)
	# generalmente no necesitaremos ejecutar este comando con "sudo"
	
	# para obtener nuestro SALT
	password_hash_corto=$(gksudo getent shadow ${mi_usuario} | cut -d$ -f3)
	

	# sabiendo donde esta nuestra contraseña hasheada por los campos GECOS
	# indicamos con "-d:" que nos obtenga la contraseña hasheada delimitando con ":" y indicamos con "-f2" que nos extraiga el campo delimitado numero 2

	# en la variable "password_hash_completo" almacenaremos contraseña hasheada completa de usuario desde shadow, pero no la expondremos directamente por seguridad, sino que la compararemos mas adelante con la que criptografiaremos nosotros en combinacion de contraseña que introdujo el usuario ("password") y una parte de de contraseña ya hasheada de usuario desde shadow, con lo cual ganaremos en seguridad
	
	
	#                                                PASSWORD_USUARIO_INTRODUCIDO_CRUDO + PARTE_HASH_CONTRASEÑA_USUARIO_SHADOW ---> ENCRIPTAR = HASH DE CONTRASEÑA COMPLETO DE USUARIO GENERADO
	#															 
	# 										 COMPARAR ---> HASH DE CONTRASEÑA COMPLETO DE USUARIO GENERADO "con" HASH DE CONTRASEÑA COMPLETO EXTRAIDO DESDE SHADOW = ¿COINCIDE?  ----> AUTENTIFICADO
	#																																												L_________---> NO AUTENTIFICADO
	
	# de este modo sabremos que lo que introdujo el usuario es la contraseña correcta
	# por lo general no deberiamos tener problemas al ejecutar este comando sin "sudo"
	password_hash_completo=$(gksudo getent shadow ${mi_usuario} | cut -d: -f2)

	# importamos y ejecutamos funcion de criptografia en Python, criptografiamos nuestro password introducido por el usuario, y lo almacenamos en una variable, el que esta ya hasheado tambien lo almacenamos en una variable a parte
	# mas acerca de funcion "crypt" de Python en:
	# https://docs.python.org/2/library/crypt.html

	# metemos la variable de contraseña sin hashear "password" que introdujo el usuario y tambien metemos la variable donde habiamos almacenado una parte de nuestra contraseña hasheada de usuario desde shadow, la parte que siempre sera la misma, tambien indicamos con "$6$" que queremos obtener un hash en SHA512 especificamente
	# almacenamos HASH_COMPLETO_OBTENIDO
	# hash_completo_generado=$(python -c 'import crypt; print crypt.crypt("'"${password}"'", "$6$'${password_hash_corto}'")')
	
	# evitamos el anterior comando ya que inyecta datos importantes en la funcion de python. Le pasamos los datos de un modo correcto y mas seguro, como argumentos o a traves de variables de entorno, en nuestro caso usaremos como argumentos
	# sino, pasa lo mismo que con inyecciones de sql, mas informacion en:
	# https://es.wikipedia.org/wiki/Inyecci%C3%B3n_SQL
	# con este comando deberiamos obtener un hash completo de la contraseña de usuario, que mas adelante compararemos con el hash de la contraseña de usuario ya extraida desde shadow
	hash_completo_generado=$(python -c 'import sys,crypt; print crypt.crypt(sys.argv[1], "$6$"+sys.argv[2])' "$password" "$password_hash_corto")

	# en la siguiente linea comprobamos si las contraseñas criptografiadas coinciden, comparamos el resultado de nuestra contraseña ya criptografiada en SHA512 con la que hemos extraido del shadow que tambien esta en SHA512, con lo cual para autentificarse deben coincidir completamente
	if [ "${hash_completo_generado}" == "${password_hash_completo}" ]; then

    	# si el usuario ha introduciro contraseña correcta, felicitamos al usuario por la correcta introduccion de la contraseña a traves de mensaje de informacion de zenity y demonio de notificaciones "notifyd" opcionalmente
    	# zenity --notification y notify-send, ambos comandos usan demonio notifyd (diferentes distribuciones GNU con diferentes escritorios, pueden utilizar diferentes servicios de notificacion, podrias ser incompatibles con el script para mostrar notificaciones)

    	# mas acerca de notificaciones de escritorio:
    	# https://wiki.archlinux.org/index.php/Desktop_notifications_(Espa%C3%B1ol)
		zenity --width=400 --height=120 --info --window-icon="info" --text="La contraseña de ${mi_usuario} es correcta\\n¡BIENVENIDO!" --timeout=1

		# mensaje que va directo con notify-send
		# notify-send "Se estan usando privilegios de superusuario"
	fi

	# bucle while, mientras la contraseña sea incorrecta (cuando las dos contraseñas, la introducida encriptada y la extraida de campos GECOS encriptada no coinciden)
	# cuando el usuario introduce una contraseña incorrecta, ejecutamos un bucle while, hasta que el usuario introduce una contraseña correcta o finaliza el programa con boton CANCELAR de la ventana
	while [ "${hash_completo_generado}" != "${password_hash_completo}" ]; do

		# mensaje de depuracion, se puede emitir, ya que solo muestra mensaje en terminal
		echo "contraseña para ${mi_usuario} incorrecta"

		# mostramos un mensaje especifico de error, avisando de que el usuario introdujo una contraseña incorrecta
		zenity --width=400 --height=120 --error --title="Error de introduccion" --text "La contraseña de ${mi_usuario} es incorrecta"

		# si el usuario pulso sobre boton SI, se volvera a correr el bucle while, volviendo a ejecutar la funcion
		if zenity --width=400 --height=120 --question --text="¿Quieres volver a intentarlo?" --ok-label="Si" --cancel-label="No"; then

			# zenity --info --text "VOLVEMOS A INTENTAR CON OTRA CONTRASEÑA"
			# volvemos a ejecutar la funcion
			# no es importante (en este caso), pero terminamos la funcion con return, porque se volvera a llamar de nuevo
			comprobar_password; return

		# si el usuario pulsa boton NO, se finalizara el programa
		elif [[ $? == 1 ]]; then
			hasta_luego
    	fi
	done
}

# ---------------------------------- FIN DE LA FUNCION COMPROBAR CONTRASEÑA ---------------------------------------------







# --------------------------------- FUNCION VOLVER A REALIZAR TAREA ------------------------------------------------------

# necesitamos esta funcion, por si el usuario decide realizar otra tarea mas
function volver_realizar_tarea() {
	
	# preguntamos al usuario de si quiere realizar otra tarea en zenity
	# si el usuario pulso sobre boton SI, entonces finalizaremos instancia de menu_principal y llamaremos de nuevo a menu_principal
	if zenity --width=400 --height=120 --question --text="¿Quieres volver a realizar otra tarea?" --ok-label="Si" --cancel-label="Salir del programa"; then

		# finalizamos la instancia de menu_principal y volvemos a llamar a la funcion, para que el usuario eliga una tarea diferente
		menu_principal; return

		# si el usuario pulsa boton NO, se finalizara el programa
	elif [[ $? == 1 ]]; then
 		hasta_luego
 	fi
}

# --------------------------------- FIN FUNCION VOLVER A REALIZAR TAREA ------------------------------------------------------







# ------------------------------ FUNCION DESPEDIDA --------------------------------------------------------

function hasta_luego() {

# nos despedimos con un educado mensaje en zenity, con duracion de 1 segundo
zenity --width=400 --info --text "Hasta luego" --timeout=1

# terminamos la ejecucion del programa
exit 0

}

# ---------------------------- FIN FUNCION DESPEDIDA ------------------------------------------------------








# ----------------- FUNCION MENU PRINCIPAL ----------------------

# necesitamos meter el menu principal en una funcion, porque si al usuario se le olvida seleccionar opcion, daremos un mensaje de error en zenity y volveremos a ejecutar la funcion de menu principal de nuevo, de este modo controlaremos este suceso incomodo de tener que volver a ejecutar el programa
function menu_principal() {

	# con valor FALSE en cada opcion indicamos que todos los radiobuttons estan sin seleccion (ninguno esta activado)
	# en la siguiente linea llamamos a zenity y al principio le asignamos una variable que nos servira para almacenar string seleccionado por usuario como respuesta, tambien personalizamos los botones de cancelar (que programaremos como "SALIR), y de OK (que programaremos como "EJECUTAR TAREA")
	menu_principal_respuesta=$(zenity --width=550 --height=380 --list --title "Editor de tareas automatizadas de base de datos" --text "Selecciona tarea a realizar: " --radiolist  --column "" --column "Tarea" --ok-label="Ejecutar tarea" --cancel-label="Salir" \
	FALSE "Obtener lista de tareas automatizadas programadas" \
	FALSE "Programar fecha de backup automatizada" \
	FALSE "Borrar tareas automatizadas" \
	FALSE "Hacer backup de base de datos manualmente ahora" \
	FALSE "Reiniciar demonio de Crontab" \
	FALSE "Ayuda en crontab" \
	FALSE "Licencia" \
	FALSE "SALIR"); boton_control=$? # declaramos variable que controla boton "EJECUTAR TAREA" y "SALIR" aqui mismo, ya que sino mas adelante se pierde, se pierde porque ya estamos metiendo valores "boton pulsado"(int) y "respuesta de radiobutton seleccionada"(string) ambos en la misma variable, los dos valores en la variable "MENU_PRINCIPAL_RESPUESTA" y crean conflicto, con lo cual perdemos despues valor que nos devuelve el boton (1 o 0)

	# comandos para la depuracion, para ver que valores estamos almacenando (se mostraran en la terminal donde se esta ejecutando el script)
	echo "$boton_control"
	echo "$menu_principal_respuesta"


	# controlamos que boton ha pulsado el usuario
	# si pulsa boton "SALIR", devuelve valor del boton por defecto un 1
	if [ $boton_control == 1 ]; then

	  	# si usuario pulsa boton "SALIR" en el boton del programa, se dara un mensaje de informacion de despedida, y sin perder el tiempo desaparecera en un segundo
		hasta_luego
	
	# si el boton pulsado por el usuario es "REALIZAR TAREA", se devolvera boton con valor 0
	elif [[ $boton_control == 0 ]]; then

		# controlamos con un if y un operador "-z" que comprueba que nuestra variable esta vacia (valor null), si el usuario no ha eleccionado ninguna opcion del menu principal
		if [[ -z "$menu_principal_respuesta" ]]; then
			
			# si el usuario no ha seleccionado ninguna opcion, se le dara un aviso con un mensaje en zenity, y se volvera a ejecutar funcion de menu principal desde el principio
			zenity --width=400 --height=120 --error --title="Error de seleccion" --text="No has seleccionado nada, por favor, selecciona una opcion"

			# mensaje de depuracion
			zenity --info --text "ejecutamos la funcion menu de nuevo" --timeout=1
			
			# volvemos a ejecutar la funcion, pero no olvidamos de poner "return" para matar la instancia que ya se estaba ejecutando, ya que no usamos bucle "while" aqui
			# si no ponemos "return" y usuario no escoge ninguna opcion 3 veces, la ejecucion tendra 3 instancias y mostrara el menu principal 3 veces, con lo cual queremos controlarlo
			menu_principal; return
		fi
		
		# mensaje de depuracion
		# zenity --info --text "ejecutamos select case" --timeout=1

		# mensaje de depuracion
		echo "$menu_principal_respuesta"
		
		# ejecutamos un select case para controlar la tarea seleccionada por el usuario
		# para ello usamos la variable $MENU_PRINCIPAL_RESPUESTA donde hemos almacenado lo que selecciono usuario al ver menu principal
		case "$menu_principal_respuesta" in
		"Obtener lista de tareas automatizadas programadas" )
			
			# llamamos a la funcion menu_case1
			menu_case1
		;;
		"Programar fecha de backup automatizada" )

			# llamamos a la funcion menu_case2
			menu_case2
		;;
		"Borrar tareas automatizadas" )
			
			# llamamos a la funcion menu_case3
			menu_case3
		;;
		"Hacer backup de base de datos manualmente ahora" )
			
			# llamamos a la funcion menu_case4
			menu_case4
		;;
		"Reiniciar demonio de Crontab" )
			
			# llamamos a la funcion menu_case5
			menu_case5
		;;
		"Ayuda en crontab" )
			
			# llamamos a la funcion menu_case6
			menu_case6
		;;
		"Licencia" )
			
			# llamamos a la funcion menu_case7
			menu_case7
		;;
		"SALIR" )
			
			# llamamos a la funcion menu_case8
			menu_case8
		;;
		esac
	fi
}

# ----------------- FIN FUNCION MENU PRINCIPAL ----------------------






# ---------------- FUNCION MENU CASE 1 ------------------------------

function menu_case1() {
	
	# declaramos una variable de directorio, atencion con espacios en rutas o nombres de archivo en UNIX (en este caso utilizaremos variable global de entorno)
	# si nuestra variable de entrono ($HOME) esta rota, puede que no funcione el programa
	# mas informacion en:
	# https://wiki.archlinux.org/index.php/environment_variables
	dir_cron_list="$HOME/.CrontabAdmin-cycled/"
	
	# controlamos de que el directorio existe
	if [ ! -d "$dir_cron_list" ]; then

  		# si el directorio no existe, lo creamos
  		mkdir "$dir_cron_list"
	
  		# escupimos este mensaje de informacion al usuario en zenity de que no existe el directorio y que se crea uno nuevo
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Se creo el directorio: \\n ${dir_cron_list} \\n para almacenamiento ya que no se encontro"
		
		# mensaje de depuracion
  		echo "${dir_cron_list} no se encontro este directorio de almacenamiento para el programa, el directorio se ha creado de nuevo"
	fi

	# entrada al directorio "$HOME/backups-base-de-datos/" de la variable DIR, usamos "|| exit" para controlar en caso de que "cd" pueda fallar por falta de permisos, directorios inexistentes o links simbolicos rotos
	# exit sirve para abortar inmediatamente
	cd "$dir_cron_list" || exit
	#> ${NAME}

	# por si acaso si existe ya el archivo temporal, lo borramos para evitar conflictos
	if [ -e temp-crontab.txt ]; then
		rm temp-crontab.txt
	fi


	# es importante interactuar con comandos de cron y no con sus archivos directamente, ya que sino tendremos perdidas de tareas programadas tras reiniciar el demonio o el sistema
		
	# almacenamos lo que nos devuelve el comando "crontab -l" que sirve para ver las tareas que ya tenemos programadas
	cron_texto=$(crontab -l)
# crontab -l > temp-crontab.txt
	
	# creamos un archivo de texto temporal para almacenar output de "crontab -l"
	touch temp-crontab.txt

	# pasamos el output de "crontab -l" a nuestro archivo de texto temporal
	# atencion con operadores ">" y ">>", ya que uno añade y otro borra todo lo que contiene el archivo de texto ademas de añadir despues lo que queriamos pasar
	echo "$cron_texto">temp-crontab.txt
	# echo "$string_tarea" >> temp-crontab.txt
	
	# mensaje de depuracion, para ver que tenemos algo dentro
	echo "---"
	echo "$cron_texto"
	echo "---"

	# si no hay nada dentro de la variable (en este caso si no hay nada en nuestras tareas de crontab), avisamos al usuario
	if [[ -z "$cron_texto" ]]; then

		# avisamos al usuario con un mensaje de informacion en zenity
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="No tienes ninguna tarea programa"

		# si el usuario pulso sobre boton SI, entonces ira al caso 2 de menu principal
		if zenity --width=400 --height=120 --question --text="¿Quieres programar una tarea ahora?" --ok-label="Si" --cancel-label="No"; then

			# llamamos a la funcion de programacion de tareas automatizadas desde aqui
			menu_case2

			# por si acaso si existe ya el archivo temporal, lo borramos para evitar conflictos
			if [ -e temp-crontab.txt ]; then
				rm temp-crontab.txt
			fi

		# si el usuario pulsa boton NO, se finalizara el programa
		#elif [[ $? == 1 ]]; then
 	    #   exit 0
 	    #fi
		#menu_case1; return
		
		else
			
			# por si acaso si existe ya el archivo temporal, lo borramos para evitar conflictos
			if [ -e temp-crontab.txt ]; then
				rm temp-crontab.txt
			fi

			volver_realizar_tarea		
		
	    fi

	fi

	# el siguiente codigo se ejecutara en caso de que tengamos ya laguna tarea programada en la lista
	
	# mostramos en zenity una ventana con informacion, con archivo de texto importado
	if zenity --text-info \
	       --title="Tareas ya programadas" \
	       --filename=temp-crontab.txt \
		   --ok-label="Ir al menu principal" --cancel-label="Salir del programa"; then

		# eliminamos nuestro archivo temporal, donde habiamos almacenado output de "crontab -l", ya no lo necesitamos
		rm temp-crontab.txt

		# volvemos a nuestro directorio de partida
		cd || exit

		menu_principal; return		
	
 	else

			# por si acaso si existe ya el archivo temporal, lo borramos para evitar conflictos
			if [ -e temp-crontab.txt ]; then
				rm temp-crontab.txt
			fi
	
			hasta_luego

	fi

	# volvemos a nuestro directorio de partida
	cd || exit

# volver_realizar_tarea
}

# ---------------- FIN FUNCION MENU CASE 1 ------------------------------






# ---------------- FUNCION MENU CASE 2 ------------------------------

function menu_case2() {

	# declaramos una variable de directorio, atencion con espacios en rutas o nombres de archivo en UNIX (en este caso utilizaremos variable global de entorno)
	# si nuestra variable de entrono ($HOME) esta rota, puede que no funcione el programa
	# mas informacion en:
	# https://wiki.archlinux.org/index.php/environment_variables
	dir_cron_list="$HOME/.CrontabAdmin-cycled/"
	
	# controlamos de que el directorio existe
	if [ ! -d "$dir_cron_list" ]; then

  		# si el directorio no existe, lo creamos
  		mkdir "$dir_cron_list"
	
  		# escupimos este mensaje de informacion al usuario en zenity de que no existe el directorio y que se crea uno nuevo
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Se creo el directorio: \\n ${dir_cron_list} \\n para almacenamiento ya que no se encontro"
		
		# mensaje de depuracion
  		echo "${dir_cron_list} no se encontro este directorio de almacenamiento para el programa, el directorio se ha creado de nuevo"
	fi
	
	string_tarea=$(zenity --entry --title="Escribe propiedades de la tarea" --text="Ejemplo:" --entry-text="59 14 * * * /mi/ruta")

	# entrada al directorio "$HOME/backups-base-de-datos/" de la variable dri_cron_list, usamos "|| exit" para controlar en caso de que "cd" pueda fallar por falta de permisos, directorios inexistentes o links simbolicos rotos
	# exit sirve para abortar inmediatamente
	cd "$dir_cron_list" || exit

	# por si acaso si existe ya el archivo temporal, lo borramos para evitar conflictos
	if [ -e temp-crontab.txt ]; then
		rm temp-crontab.txt
	fi

	# necesitamos guardar tareas ya programadas, ya que cuando pasamos una variable con una tarea introducida por usuario con "crontab miarchivodetareas.txt", simplemente sobreescribe con contenido de "miarchivodetareas.txt" sobre lo que ya esta programado en crontab
	cron_texto=$(crontab -l)
	

	# con operador "-z" (z) controlamos que no haya al menos una tarea existente (ya programada)
	if [[ -z "$cron_texto" ]]; then

		# creamos archivo de texto temporal donde almacenaremos lo que el usuario tecleo en en la variable tarea
		touch temp-crontab.txt
	
		# borramos cualquier contenido dentro de archivo de texto temporal y movemos nuestra linea de tarea dentro de archivo de texto temporal (NO OLVIDARSE DE "echo" AL PASAR)
		echo "$string_tarea">temp-crontab.txt

		# con crontab importamos la linea que contiene la tarea desde nuestro archivo de texto temporal
		crontab temp-crontab.txt

	# si ya tenemos al menos una tarea
	else

		# necesitamos correspondiente archivo de texto temporal para almacenar tareas que ya tenemos
		# lo creamos si hay al menos una tarea
		# creamos archivo de texto temporal donde almacenaremos lo que el usuario tecleo en en la variable tarea
		touch temp-crontab.txt
		
		# y le pasamos el contenido de las tareas
		echo "$cron_texto">temp-crontab.txt
	
		# borramos cualquier contenido dentro de archivo de texto temporal y movemos nuestra linea de tarea dentro de archivo de texto temporal (NO OLVIDARSE DE "echo" AL PASAR)
		echo "$string_tarea">>temp-crontab.txt

		# con crontab importamos la linea que contiene la tarea desde nuestro archivo de texto temporal
		crontab temp-crontab.txt
	
	fi

	# ya no queremos tener archivo temporal asi que lo borramos
	rm temp-crontab.txt

	# mensajes de depuracion
	echo
	echo "Se escribio con exito en el crontab la siguiente linea: "
	echo "$string_tarea"
	# echo "${STRING}" >> /tmp/crontab.*/crontab     #ARCHIVO TEMPORAL, NO TOCAR

	# volvemos a nuestro directorio de partida, usamos "|| exit" para controlar en caso de que "cd" pueda fallar por falta de permisos, directorios inexistentes o links simbolicos rotos
	cd || exit

	zenity --width=400 --height=120 --info --window-icon="info" --title="Tarea añadida" --text="Se escribio con exito la siguiente tarea en tu lista de tareas de crontab: \\n\\n${string_tarea}"

volver_realizar_tarea

}

# EXPLICACION DETALLADA DE LA LINEA DE CRON

#  * * * * * "comando a ejecutar"
#  - - - - -
#  | | | | |
#  | | | | L----- dia de la semana (de 0 a 7) (Domingo=0 or 7)
#  | | | L------- mes (de 1 a 12)
#  | | L--------- dia del mes (de 1 a 31)
#  | L----------- hora (de 0 a 23)
#  L------------- minuto (de 0 a 59)

# ---------------- FIN FUNCION MENU CASE 2 ------------------------------








# ---------------- FUNCION MENU CASE 3 ------------------------------

function menu_case3() {

	# almacenamos lo que nos devuelve el comando "crontab -l" que sirve para ver las tareas que ya tenemos programadas
	cron_lista_tareas=$(crontab -l)

	# si no hay nada dentro de la variable (en este caso si no hay nada en nuestras tareas de crontab), avisamos al usuario
	if [[ -z "$cron_lista_tareas" ]]; then

		# avisamos al usuario con un mensaje de informacion en zenity de que no tiene ni una tarea programada
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="No tienes ninguna tarea programa"

		# si el usuario pulso sobre boton SI, entonces ira al caso 2
		if zenity --width=400 --height=120 --question --text="¿Quieres programar una tarea ahora?" --ok-label="Si" --cancel-label="No"; then

			# llamamos a la funcion de programacion de tareas automatizadas desde aqui
			menu_case2

		else
 	        
			# volvemos al menu principal
			volver_realizar_tarea

	        fi

	else
		
		if zenity --width=400 --height=120 --question --text="¿Estas seguro de que quieres borrar todas las tareas programadas?" --ok-label="Si" --cancel-label="No borrar nada"; then

			# borramos todas las tareas que tuviesemos ya programadas
			crontab -r

			# almacenamos lo que nos devuelve el comando "crontab -l" que sirve para ver las tareas que ya tenemos programadas
			cron_lista_tareas=$(crontab -l)

			# si hay algo dentro de la variable (en este caso si hay algo en nuestra lista de tareas de crontab), avisamos al usuario
			if [[ -n "$cron_lista_tareas" ]]; then

				# avisamos al usuario con un mensaje de informacion en zenity de que no tiene ni una tarea programada
				zenity --width=400 --height=120 --error --title="ERROR" --text "Algo salio mal, no se borro la lista de tareas de crontab, o el archivo de tareas no quedo vacio"

				# si el usuario pulso sobre boton SI, entonces ira al caso 2
				if zenity --width=400 --height=120 --question --text="¿Desea volver a intentarlo?" --ok-label="Si" --cancel-label="Ir al menu principal"; then

					# llamamos a la funcion de nuevo y finalizamos la instancia actual
					menu_case3; return

				else
 	        
					# a traver de un mensaje en zenity avisamos al usuario de que limpio exitosamente su lista de tareas programadas
					zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Has limpiado correctamente la lista de tareas"
				fi

	    	fi
		fi

			# a traver d eun mensaje en zenity avisamos al usuario de que limpio exitosamente su lista de tareas programadas
			# zenity --width=350 --height=120 --info --window-icon="info" --title="Atencion" --text="Has limpiado correctamente la lista de tareas"

	fi

volver_realizar_tarea

}

# ---------------FIN FUNCION MENU CASE 3 ------------------------------











# ---------------FUNCION MENU CASE 4 ------------------------------

function menu_case4() {

	# declaramos una variable de directorio, atencion con espacios en rutas o nombres de archivo en UNIX (en este caso utilizaremos variable global de entorno)
	# si nuestra variable de entrono ($HOME) esta rota, puede que no funcione el programa
	# mas informacion en:
	# https://wiki.archlinux.org/index.php/environment_variables
	dir_cron_list="$HOME/.CrontabAdmin-cycled/"
	
	# controlamos de que el directorio existe
	if [ ! -d "$dir_cron_list" ]; then

  		# si el directorio no existe, lo creamos
  		mkdir "$dir_cron_list"
	
  		# escupimos este mensaje de informacion al usuario en zenity de que no existe el directorio y que se crea uno nuevo
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Se creo el directorio: \\n ${dir_cron_list} \\n para almacenamiento ya que no se encontro"
		
		# mensaje de depuracion
  		echo "${dir_cron_list} no se encontro este directorio de almacenamiento para el programa, el directorio se ha creado de nuevo"
	fi

	# metemos en una variable la ruta del archivo para su posterior comprobacion de que existe
	ruta_programa_backup="$HOME/.CrontabAdmin-cycled/backup_trigger.sh"

	# de la variable anterior, la imprimimos en terminal como string y con el "cut" recortamos solo el nombre de archivo que dispara el backup con delimitador "-d" marcando como caracter delimitador "/" y indicamos que queremos campo numero 5 con "-f"
	comprobacion_archivo_trigger_corto=$(echo "${ruta_programa_backup}" | cut -d/ -f5)

	# controlamos de que el archivo existe
	if [ ! -f "$ruta_programa_backup" ]; then

		# si se da el caso de que el archivo que se encarga de backup de base de datos (necesario para este programa) no existe
		# la causa puede ser que el paquete (package) no se instalo correctamente, tambien puede ser que este programa se este usando manualmente sin instalacion, o que el usuario lo borro con permisos de superusuario a proposito
		zenity --width=400 --height=120 --error --title="ERROR GRAVE" --text "El archivo '${comprobacion_archivo_trigger_corto}' no existe\\n\\nLa causa puede ser que el paquete no se instalo correctamente, tambien puede ser que este programa se este usando manualmente sin instalacion, o que el usuario borro el archivo con permisos de superusuario a proposito, con lo cual requiere atencion de administrador del sistema que tenga acceso a superusuario"

		# avisamos a traves de zenity con un mensaje de error emergente de que tiene un problema grave
		zenity --width=400 --height=120 --error --title="ERROR GRAVE" --text "Consulte el problema con administrador del sistema"
	
		# volvemos al menu principal, ya que no tiene sentido seguir
		volver_realizar_tarea; return
	
	fi

	# almacenamos el valor de variable que contiene nombre de usuario, desde nuestro script que dispara el backup, proporcionando la ruta hacia el archivo, cogiendo solo la linea de donde se declara la variable de usuario "usuario_de_bd" y recortando con "cut" solo el valor con la ayuda de delimitador """ y cortando solo el campo numero 2 gracias a "-f"
	# almacenamos en una variable, el resultado del comando "cat" que coge nuestro archivo que dispara backup de datos, con "grep" buscamos dentro de el la linea que empieza con "usuario_de_bd=" (que es el claro indicativo de que es una variable), con "cut" recortamos nuestro string que esta entre "" con delimitador "-d" y indicamos que el delimitador sera """ y con "-f" que nos recorte solo el campo numero 2
	usuario_actual_trigger=$(cat -n "$HOME"/.CrontabAdmin-cycled/backup_trigger.sh | grep -F "usuario_de_bd=" | cut -d'=' -f2)

	# comprobamos que hemos obtenido nombre del usuario de base de datos, si la variable "usuario_de_bd" tiene un nombre diferente, entonces no obtendremos ningun valor sino un string vacio, por lo tanto variable "usuario_actual_trigger" estara vacia
	if [[ -z "$usuario_actual_trigger" ]]; then
		
		# avisamos con mensaje en zenity de que no se encontro la variable que estabamos intentando extraer
		zenity --width=400 --height=120 --error --title="ERROR GRAVE" --text "No se encontro la variable 'usuario_de_bd'"

		# avisamos a traves de un mensaje en zenity de que el usuario tiene un grave error, de que archivo que dispara el backup esta corrupto o que alguien con acceso a superusuario (contraseña para usuario) modifico el archivo
		zenity --width=400 --height=120 --error --title="ERROR GRAVE" --text "El archivo '${comprobacion_archivo_trigger_corto}' parece estar dañado\\n\\nLa causa puede ser que el paquete no se instalo correctamente, tambien puede ser que este archivo se modifico por alguien que tiene acceso a superusurio del sistema, con lo cual requiere atencion de administrador del sistema que tenga acceso a superusuario"

		# recomendamos al usuario de que consulte al administrador
		zenity --width=400 --height=120 --error --title="ERROR GRAVE" --text "Consulte el problema con administrador del sistema"
	
		# volvemos al menu principal, ya que no tiene sentido seguir
		volver_realizar_tarea; return

	fi		

	# almacenamos el valor de nombre de base de datos desde nuestro script que dispara el backup, proporcionando la ruta hacia el archivo, cogiendo solo la linea de donde se declara la variable de usuario "nombre_de_bd" y recortando con "cut" solo el valor con la ayuda de delimitador " y cortando solo el campo numero 2	
	nombre_db_actual_trigger=$(cat -n "$HOME"/.CrontabAdmin-cycled/backup_trigger.sh | grep -F "nombre_de_bd=" | cut -d'=' -f2)

	# comprobamos que hemos obtenido nombre del base de datos, si la variable "nombre_de_bd" tiene un nombre diferente, entonces no obtendremos ningun valor sino un string vacio, por lo tanto variable "nombre_db_actual_trigger" estara vacia
	if [[ -z "$nombre_db_actual_trigger" ]]; then
		
		# avisamos con mensaje en zenity de que no se encontro la variable que estabamos intentando extraer
		zenity --width=400 --height=120 --error --title="ERROR GRAVE" --text "No se encontro la variable 'nombre_de_bd'"

		# avisamos a traves de un mensaje en zenity de que el usuario tiene un grave error, de que archivo que dispara el backup esta corrupto		
		zenity --width=400 --height=120 --error --title="ERROR GRAVE" --text "El archivo '${comprobacion_archivo_trigger_corto}' parece estar dañado\\n\\nLa causa puede ser que el paquete no se instalo correctamente, tambien puede ser que este archivo se modifico por alguien que tiene acceso a superusurio del sistema, con lo cual requiere atencion de administrador del sistema que tenga acceso a superusuario"

		# recomendamos al usuario de que consulte al administrador
		zenity --width=400 --height=120 --error --title="ERROR GRAVE" --text "Consulte el problema con administrador del sistema"

		# volvemos al menu principal, ya que no tiene sentido seguir
		volver_realizar_tarea; return

	fi

	# mostramos un mensaje informativo en zenity, con la informacion de valores de variables que tenemos asignadas en el programa que ejecuta backup de nuestra base de datos, nos mostrara los valores	de usuario de base de datos y el nombre de base de datos
	zenity --width=400 --height=120 --info --window-icon="info" --title="Informacion" --text="Ahora mismo el programa que ejecuta el backup de base de datos tiene siguientes valores: \\n\\n\\n -USUARIO: ${usuario_actual_trigger} \\n\\n -NOMBRE DE BASE DE DATOS: ${nombre_db_actual_trigger}"

	# preguntamos al usuario de si quiere cambiar estos datos
	if zenity --width=400 --height=120 --question --text="¿Deseas modificar estos datos antes de proceder? \\n\\n\\n -NOMBRE DE USURIO DE BASE DE DATOS\\n\\n -NOMBRE DE BASE DE DATOS" --ok-label="Si" --cancel-label="No"; then
		
		# controlamos de que el demonio de crontab no este ejecutandose, y que no dispare casualmente una tarea programada justo en el momento de edicion de datos que estan en el programa que dispara backups
		echo -e "$password" | sudo -S /etc/init.d/cron stop
		
		# en zenity captamos con "entry" la introduccion de datos de usuario
		mod_usuario_bd=$(zenity --entry --title="Escribe nombre de usuario de base de datos" --entry-text="postgres")
		mod_nombre_bd=$(zenity --entry --title="Escribe nombre de base de datos" --entry-text="tienda")
	
		# modificamos directamente la linea que contiene "usuario_de_bd=" que es justo donde se declara la variable, y ponemos a nuestra nueva linea que se va a llamar igual que la anterior "usuario_de_bd=" y le pasamos valor que introdujo el usuario en justamente comandos anteriores, luego indicamos donde esta nuestro programa que realiza dumps
		sed -i "s/usuario_de_bd=.*/usuario_de_bd=${mod_usuario_bd}/g" "$ruta_programa_backup"

		# exactamente lo mismo que comando anterior pero con la variable de nombre de base de datos
		sed -i "s/nombre_de_bd=.*/nombre_de_bd=${mod_nombre_bd}/g" "$ruta_programa_backup"

		# USARIO_DE_BD=$mode_usario_bd ./2.sh
		# guys now I need to pass the value of my variable called "mod_usuario_bd" with value "postgres" from "1.sh" into variable called "usuario_de_bd" ("usuario_de_bd="jon"") which is stored in "2.sh"
		
		# notificaremos con un mensaje informativo en zenity que los valores introducidos por el usuario se traspasaron correctamente a las variables de script disparador de backups
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Has modificado correctamente los datos"
	
		# volvemos a iniciar demonio de crontab
		echo -e "$password" | sudo -S /etc/init.d/cron start
		
	fi
	
	# si tras tanta comprobacion salio todo bien, ejecutamos el script que dispara el backup, y asi obtendremos el tan deseado dump de nuestra tan valiosa, querida y amada base de datos
	$ruta_programa_backup
	
	volver_realizar_tarea; return

}

# ---------------- FIN FUNCION MENU CASE 4 ------------------------------









# ------------------ FUNCION MENU CASE 5 ------------------------------

function menu_case5() {

	# diferentes distribuciones de sistema operativo GNU/Linux usan diferentes sistemas de inicializacion y administracion de servicios (init system), por lo tanto para mejorar la compatiblidad con cada una vamos a ejecutar algunos comandos para ver con que sistema de inicializacion estamos tratando
	# cuando acertemos con el comando adecuado, nos dara alguna salida de datos, mientras otros no daran absolutamente, ya que no estaran isntalados
	# hoy en dia las distribuciones mayoritarias usaran el polemico "SystemD", mientras por ejemplo en Gentoo esta adaptado "OpenRC"

	# este comando podria valer, pero hay que poner varios con nombres de system-inits correspondientes
	# init_upstart=$(ps -eaf|grep '[u]pstart')

	# este comando captara string de como se llama nuestro sistema de inicializacion y lo almacenara en una variable, el comando se detendra nada mas encontrar un string que coincide
	init_system=$(strings /sbin/init | awk 'match($0, /(upstart|systemd|openrc|sysvinit|runit)/) { print toupper(substr($0, RSTART, RLENGTH));exit; }')

	# nos vendra muy bien convertir nuestra variable enteramente a minusculas si contiene mayuscuas
	a_minusculas=${init_system,,}
		
	# mensaje de depuracion en terminal
	echo "***************"
	echo "$a_minusculas"
	
	# o podemos usar el siguiente codigo con programa "sed", para pasar a minusculas si el anterior llegase a no funcionar

	# a_minusculas="$init_system"
    # a_minusculas=$(echo "$a_minusculas" | sed 's/.*/\L&/')
	# echo "$a_minusculas"
	
	# pasamos nuestra string a nuestra variable principal
	init_system="$a_minusculas"
	
	# mensaje de depuracion para ver que sistema de inicializacion tenemos
	zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Tienes instalado: \\n\\n ${init_system}"

	# ahora solo se ejecutara un "if" si el string de nuestra variable coincide
	if [ "$init_system" == systemd ]; then

		# echo -e "$password" | sudo -S systemctl restart cron.service
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Has reiniciado servicio de cron en ${init_system}"

	fi

	if [ "$init_system" == openrc ]; then

		echo -e "$password" | sudo -S /etc/init.d/cron restart
		
		# esto habilita el servicio (siempre se iniciara automaticamente al iniciar el sistema)
	    # echo -e "$password" | sudo -S rc-update add cron default
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Has reiniciado servicio de cron en ${init_system}"
	
	fi

	if [ "$init_system" == upstart ]; then

		echo -e "$password" | sudo -S /etc/init.d/cron restart
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Has reiniciado servicio de cron en ${init_system}"

	fi

	if [ "$init_system" == sysvinit ]; then

		echo -e "$password" | sudo -S /etc/init.d/cron restart
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Has reiniciado servicio de cron en ${init_system}"

	fi

	if [ "$init_system" == runit ]; then

		echo -e "$password" | sudo -S sv restart cron
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Has reiniciado servicio de cron en ${init_system}"
		
		# para habilitar el servicio
		# ln -s /etc/sv/cron /var/service/

	fi

	volver_realizar_tarea; return

}

# ---------------- FIN FUNCION MENU CASE 5 ------------------------------











# ------------------ FUNCION MENU CASE 6 ------------------------------

function menu_case6() {

	dir_cron_help="$HOME/.CrontabAdmin-cycled/"
	
	# controlamos de que el directorio existe
	if [ ! -d "$dir_cron_help" ]; then

  		# si el directorio no existe, lo creamos
  		mkdir "$dir_cron_help"
	
  		# escupimos este mensaje de informacion al usuario en zenity de que no existe el directorio y que se crea uno nuevo
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Se creo el directorio: \\n ${dir_cron_help} \\n para almacenamiento ya que no se encontro"
		
		# mensaje de depuracion
  		echo "${dir_cron_help} no se encontro este directorio de almacenamiento para el programa, el directorio se ha creado de nuevo"

	fi

	# entrada al directorio "$HOME/backups-base-de-datos/" de la variable DIR, usamos "|| exit" para controlar en caso de que "cd" pueda fallar por falta de permisos, directorios inexistentes o links simbolicos rotos
	# exit sirve para abortar inmediatamente
	cd "$dir_cron_help" || exit

	# por si acaso si existe ya el archivo temporal, lo borramos para evitar conflictos
	if [ -e temp-crontab.txt ]; then
		rm temp-crontab.txt
	fi

	# creamos un archivo de texto temporal para almacenar nuestro texto de ayuda para cron
	touch temp-crontab.txt

	texto_ayuda_cron="Uso:
 	crontab [opcion] archivo
 	crontab [opcion]
 	crontab -n [hostname]

	Options:
 	-u <usuario>  definir usuario
 	-e         editar lista de tareas de usuario
 	-l         ver lista de tareas de usuario
 	-r         borrar lista de tareas de usuario
 	-i         avisar antes de borrar
 	-n <host>  configurar host en cluster para ejecutar crontabs de usuarios
 	-c         obtener host en cluster para ejecutar crontabs de usuarios
 	-x <mask>  habilitar opcion de depuracion"

	# pasamos el exrito de ayuda para cron a nuestro archivo de texto temporal
	# atencion con operadores ">" y ">>", ya que uno añade y otro borra todo lo que contiene el archivo de texto ademas de añadir despues lo que queriamos pasar
	echo "$texto_ayuda_cron">temp-crontab.txt

	# mostramos en zenity una ventana con informacion, con archivo de texto importado
	if zenity --width=600 --height=380 --text-info --title="Ayuda basica para uso de crontab" --filename=temp-crontab.txt --ok-label="Ir al menu principal" --cancel-label="Salir del programa"; then

		# recogemos la basura como bien educados que somos
		if [ -e temp-crontab.txt ]; then
			rm temp-crontab.txt
		fi

		# y ahora entramos al directorio de partida
		cd || exit

		# volvemos al menu principal por peticion de usuario
		menu_principal; return

	else
		
		# recogemos la basura como bien educados que somos
		if [ -e temp-crontab.txt ]; then
			rm temp-crontab.txt
		fi

		# y ahora entramos al directorio de partida
		cd || exit

		# educadamente nos despedimos
		hasta_luego

	fi

}

# -----------------FIN FUNCION MENU CASE 6 ------------------------------









# ----------------- FUNCION MENU CASE 7 ------------------------------

function menu_case7() {

dir_cron_help="$HOME/.CrontabAdmin-cycled/"
	
	# controlamos de que el directorio existe
	if [ ! -d "$dir_cron_help" ]; then

  		# si el directorio no existe, lo creamos
  		mkdir "$dir_cron_help"
	
  		# escupimos este mensaje de informacion al usuario en zenity de que no existe el directorio y que se crea uno nuevo
		zenity --width=400 --height=120 --info --window-icon="info" --title="Atencion" --text="Se creo el directorio: \\n ${dir_cron_help} \\n para almacenamiento ya que no se encontro"
		
		# mensaje de depuracion
  		echo "${dir_cron_help} no se encontro este directorio de almacenamiento para el programa, el directorio se ha creado de nuevo"

	fi

	# entrada al directorio "$HOME/backups-base-de-datos/" de la variable DIR, usamos "|| exit" para controlar en caso de que "cd" pueda fallar por falta de permisos, directorios inexistentes o links simbolicos rotos
	# exit sirve para abortar inmediatamente
	cd "$dir_cron_help" || exit

	# por si acaso si existe ya el archivo temporal, lo borramos para evitar conflictos
	if [ -e temp-crontab.txt ]; then
		rm temp-crontab.txt
	fi

	# creamos un archivo de texto temporal para almacenar nuestro texto de ayuda para cron
	touch temp-crontab.txt

	texto_licencia_cron="
GNU GENERAL PUBLIC LICENSE

Version 3, 29 June 2007

Copyright © 2007 Free Software Foundation, Inc. <https://fsf.org/>

Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed.
Preamble

The GNU General Public License is a free, copyleft license for software and other kinds of works.

The licenses for most software and other practical works are designed to take away your freedom to share and change the works. By contrast, the GNU General Public License is intended to guarantee your freedom to share and change all versions of a program--to make sure it remains free software for all its users. We, the Free Software Foundation, use the GNU General Public License for most of our software; it applies also to any other work released this way by its authors. You can apply it to your programs, too.

When we speak of free software, we are referring to freedom, not price. Our General Public Licenses are designed to make sure that you have the freedom to distribute copies of free software (and charge for them if you wish), that you receive source code or can get it if you want it, that you can change the software or use pieces of it in new free programs, and that you know you can do these things.

To protect your rights, we need to prevent others from denying you these rights or asking you to surrender the rights. Therefore, you have certain responsibilities if you distribute copies of the software, or if you modify it: responsibilities to respect the freedom of others.

For example, if you distribute copies of such a program, whether gratis or for a fee, you must pass on to the recipients the same freedoms that you received. You must make sure that they, too, receive or can get the source code. And you must show them these terms so they know their rights.

Developers that use the GNU GPL protect your rights with two steps: (1) assert copyright on the software, and (2) offer you this License giving you legal permission to copy, distribute and/or modify it.

For the developers' and authors' protection, the GPL clearly explains that there is no warranty for this free software. For both users' and authors' sake, the GPL requires that modified versions be marked as changed, so that their problems will not be attributed erroneously to authors of previous versions.

Some devices are designed to deny users access to install or run modified versions of the software inside them, although the manufacturer can do so. This is fundamentally incompatible with the aim of protecting users' freedom to change the software. The systematic pattern of such abuse occurs in the area of products for individuals to use, which is precisely where it is most unacceptable. Therefore, we have designed this version of the GPL to prohibit the practice for those products. If such problems arise substantially in other domains, we stand ready to extend this provision to those domains in future versions of the GPL, as needed to protect the freedom of users.

Finally, every program is threatened constantly by software patents. States should not allow patents to restrict development and use of software on general-purpose computers, but in those that do, we wish to avoid the special danger that patents applied to a free program could make it effectively proprietary. To prevent this, the GPL assures that patents cannot be used to render the program non-free.

The precise terms and conditions for copying, distribution and modification follow.
TERMS AND CONDITIONS
0. Definitions.

“This License” refers to version 3 of the GNU General Public License.

“Copyright” also means copyright-like laws that apply to other kinds of works, such as semiconductor masks.

“The Program” refers to any copyrightable work licensed under this License. Each licensee is addressed as “you”. “Licensees” and “recipients” may be individuals or organizations.

To “modify” a work means to copy from or adapt all or part of the work in a fashion requiring copyright permission, other than the making of an exact copy. The resulting work is called a “modified version” of the earlier work or a work “based on” the earlier work.

A “covered work” means either the unmodified Program or a work based on the Program.

To “propagate” a work means to do anything with it that, without permission, would make you directly or secondarily liable for infringement under applicable copyright law, except executing it on a computer or modifying a private copy. Propagation includes copying, distribution (with or without modification), making available to the public, and in some countries other activities as well.

To “convey” a work means any kind of propagation that enables other parties to make or receive copies. Mere interaction with a user through a computer network, with no transfer of a copy, is not conveying.

An interactive user interface displays “Appropriate Legal Notices” to the extent that it includes a convenient and prominently visible feature that (1) displays an appropriate copyright notice, and (2) tells the user that there is no warranty for the work (except to the extent that warranties are provided), that licensees may convey the work under this License, and how to view a copy of this License. If the interface presents a list of user commands or options, such as a menu, a prominent item in the list meets this criterion.
1. Source Code.

The “source code” for a work means the preferred form of the work for making modifications to it. “Object code” means any non-source form of a work.

A “Standard Interface” means an interface that either is an official standard defined by a recognized standards body, or, in the case of interfaces specified for a particular programming language, one that is widely used among developers working in that language.

The “System Libraries” of an executable work include anything, other than the work as a whole, that (a) is included in the normal form of packaging a Major Component, but which is not part of that Major Component, and (b) serves only to enable use of the work with that Major Component, or to implement a Standard Interface for which an implementation is available to the public in source code form. A “Major Component”, in this context, means a major essential component (kernel, window system, and so on) of the specific operating system (if any) on which the executable work runs, or a compiler used to produce the work, or an object code interpreter used to run it.

The “Corresponding Source” for a work in object code form means all the source code needed to generate, install, and (for an executable work) run the object code and to modify the work, including scripts to control those activities. However, it does not include the work's System Libraries, or general-purpose tools or generally available free programs which are used unmodified in performing those activities but which are not part of the work. For example, Corresponding Source includes interface definition files associated with source files for the work, and the source code for shared libraries and dynamically linked subprograms that the work is specifically designed to require, such as by intimate data communication or control flow between those subprograms and other parts of the work.

The Corresponding Source need not include anything that users can regenerate automatically from other parts of the Corresponding Source.

The Corresponding Source for a work in source code form is that same work.
2. Basic Permissions.

All rights granted under this License are granted for the term of copyright on the Program, and are irrevocable provided the stated conditions are met. This License explicitly affirms your unlimited permission to run the unmodified Program. The output from running a covered work is covered by this License only if the output, given its content, constitutes a covered work. This License acknowledges your rights of fair use or other equivalent, as provided by copyright law.

You may make, run and propagate covered works that you do not convey, without conditions so long as your license otherwise remains in force. You may convey covered works to others for the sole purpose of having them make modifications exclusively for you, or provide you with facilities for running those works, provided that you comply with the terms of this License in conveying all material for which you do not control copyright. Those thus making or running the covered works for you must do so exclusively on your behalf, under your direction and control, on terms that prohibit them from making any copies of your copyrighted material outside their relationship with you.

Conveying under any other circumstances is permitted solely under the conditions stated below. Sublicensing is not allowed; section 10 makes it unnecessary.
3. Protecting Users' Legal Rights From Anti-Circumvention Law.

No covered work shall be deemed part of an effective technological measure under any applicable law fulfilling obligations under article 11 of the WIPO copyright treaty adopted on 20 December 1996, or similar laws prohibiting or restricting circumvention of such measures.

When you convey a covered work, you waive any legal power to forbid circumvention of technological measures to the extent such circumvention is effected by exercising rights under this License with respect to the covered work, and you disclaim any intention to limit operation or modification of the work as a means of enforcing, against the work's users, your or third parties' legal rights to forbid circumvention of technological measures.
4. Conveying Verbatim Copies.

You may convey verbatim copies of the Program's source code as you receive it, in any medium, provided that you conspicuously and appropriately publish on each copy an appropriate copyright notice; keep intact all notices stating that this License and any non-permissive terms added in accord with section 7 apply to the code; keep intact all notices of the absence of any warranty; and give all recipients a copy of this License along with the Program.

You may charge any price or no price for each copy that you convey, and you may offer support or warranty protection for a fee.
5. Conveying Modified Source Versions.

You may convey a work based on the Program, or the modifications to produce it from the Program, in the form of source code under the terms of section 4, provided that you also meet all of these conditions:

    a) The work must carry prominent notices stating that you modified it, and giving a relevant date.
    b) The work must carry prominent notices stating that it is released under this License and any conditions added under section 7. This requirement modifies the requirement in section 4 to “keep intact all notices”.
    c) You must license the entire work, as a whole, under this License to anyone who comes into possession of a copy. This License will therefore apply, along with any applicable section 7 additional terms, to the whole of the work, and all its parts, regardless of how they are packaged. This License gives no permission to license the work in any other way, but it does not invalidate such permission if you have separately received it.
    d) If the work has interactive user interfaces, each must display Appropriate Legal Notices; however, if the Program has interactive interfaces that do not display Appropriate Legal Notices, your work need not make them do so.

A compilation of a covered work with other separate and independent works, which are not by their nature extensions of the covered work, and which are not combined with it such as to form a larger program, in or on a volume of a storage or distribution medium, is called an “aggregate” if the compilation and its resulting copyright are not used to limit the access or legal rights of the compilation's users beyond what the individual works permit. Inclusion of a covered work in an aggregate does not cause this License to apply to the other parts of the aggregate.
6. Conveying Non-Source Forms.

You may convey a covered work in object code form under the terms of sections 4 and 5, provided that you also convey the machine-readable Corresponding Source under the terms of this License, in one of these ways:

    a) Convey the object code in, or embodied in, a physical product (including a physical distribution medium), accompanied by the Corresponding Source fixed on a durable physical medium customarily used for software interchange.
    b) Convey the object code in, or embodied in, a physical product (including a physical distribution medium), accompanied by a written offer, valid for at least three years and valid for as long as you offer spare parts or customer support for that product model, to give anyone who possesses the object code either (1) a copy of the Corresponding Source for all the software in the product that is covered by this License, on a durable physical medium customarily used for software interchange, for a price no more than your reasonable cost of physically performing this conveying of source, or (2) access to copy the Corresponding Source from a network server at no charge.
    c) Convey individual copies of the object code with a copy of the written offer to provide the Corresponding Source. This alternative is allowed only occasionally and noncommercially, and only if you received the object code with such an offer, in accord with subsection 6b.
    d) Convey the object code by offering access from a designated place (gratis or for a charge), and offer equivalent access to the Corresponding Source in the same way through the same place at no further charge. You need not require recipients to copy the Corresponding Source along with the object code. If the place to copy the object code is a network server, the Corresponding Source may be on a different server (operated by you or a third party) that supports equivalent copying facilities, provided you maintain clear directions next to the object code saying where to find the Corresponding Source. Regardless of what server hosts the Corresponding Source, you remain obligated to ensure that it is available for as long as needed to satisfy these requirements.
    e) Convey the object code using peer-to-peer transmission, provided you inform other peers where the object code and Corresponding Source of the work are being offered to the general public at no charge under subsection 6d.

A separable portion of the object code, whose source code is excluded from the Corresponding Source as a System Library, need not be included in conveying the object code work.

A “User Product” is either (1) a “consumer product”, which means any tangible personal property which is normally used for personal, family, or household purposes, or (2) anything designed or sold for incorporation into a dwelling. In determining whether a product is a consumer product, doubtful cases shall be resolved in favor of coverage. For a particular product received by a particular user, “normally used” refers to a typical or common use of that class of product, regardless of the status of the particular user or of the way in which the particular user actually uses, or expects or is expected to use, the product. A product is a consumer product regardless of whether the product has substantial commercial, industrial or non-consumer uses, unless such uses represent the only significant mode of use of the product.

“Installation Information” for a User Product means any methods, procedures, authorization keys, or other information required to install and execute modified versions of a covered work in that User Product from a modified version of its Corresponding Source. The information must suffice to ensure that the continued functioning of the modified object code is in no case prevented or interfered with solely because modification has been made.

If you convey an object code work under this section in, or with, or specifically for use in, a User Product, and the conveying occurs as part of a transaction in which the right of possession and use of the User Product is transferred to the recipient in perpetuity or for a fixed term (regardless of how the transaction is characterized), the Corresponding Source conveyed under this section must be accompanied by the Installation Information. But this requirement does not apply if neither you nor any third party retains the ability to install modified object code on the User Product (for example, the work has been installed in ROM).

The requirement to provide Installation Information does not include a requirement to continue to provide support service, warranty, or updates for a work that has been modified or installed by the recipient, or for the User Product in which it has been modified or installed. Access to a network may be denied when the modification itself materially and adversely affects the operation of the network or violates the rules and protocols for communication across the network.

Corresponding Source conveyed, and Installation Information provided, in accord with this section must be in a format that is publicly documented (and with an implementation available to the public in source code form), and must require no special password or key for unpacking, reading or copying.
7. Additional Terms.

“Additional permissions” are terms that supplement the terms of this License by making exceptions from one or more of its conditions. Additional permissions that are applicable to the entire Program shall be treated as though they were included in this License, to the extent that they are valid under applicable law. If additional permissions apply only to part of the Program, that part may be used separately under those permissions, but the entire Program remains governed by this License without regard to the additional permissions.

When you convey a copy of a covered work, you may at your option remove any additional permissions from that copy, or from any part of it. (Additional permissions may be written to require their own removal in certain cases when you modify the work.) You may place additional permissions on material, added by you to a covered work, for which you have or can give appropriate copyright permission.

Notwithstanding any other provision of this License, for material you add to a covered work, you may (if authorized by the copyright holders of that material) supplement the terms of this License with terms:

    a) Disclaiming warranty or limiting liability differently from the terms of sections 15 and 16 of this License; or
    b) Requiring preservation of specified reasonable legal notices or author attributions in that material or in the Appropriate Legal Notices displayed by works containing it; or
    c) Prohibiting misrepresentation of the origin of that material, or requiring that modified versions of such material be marked in reasonable ways as different from the original version; or
    d) Limiting the use for publicity purposes of names of licensors or authors of the material; or
    e) Declining to grant rights under trademark law for use of some trade names, trademarks, or service marks; or
    f) Requiring indemnification of licensors and authors of that material by anyone who conveys the material (or modified versions of it) with contractual assumptions of liability to the recipient, for any liability that these contractual assumptions directly impose on those licensors and authors.

All other non-permissive additional terms are considered “further restrictions” within the meaning of section 10. If the Program as you received it, or any part of it, contains a notice stating that it is governed by this License along with a term that is a further restriction, you may remove that term. If a license document contains a further restriction but permits relicensing or conveying under this License, you may add to a covered work material governed by the terms of that license document, provided that the further restriction does not survive such relicensing or conveying.

If you add terms to a covered work in accord with this section, you must place, in the relevant source files, a statement of the additional terms that apply to those files, or a notice indicating where to find the applicable terms.

Additional terms, permissive or non-permissive, may be stated in the form of a separately written license, or stated as exceptions; the above requirements apply either way.
8. Termination.

You may not propagate or modify a covered work except as expressly provided under this License. Any attempt otherwise to propagate or modify it is void, and will automatically terminate your rights under this License (including any patent licenses granted under the third paragraph of section 11).

However, if you cease all violation of this License, then your license from a particular copyright holder is reinstated (a) provisionally, unless and until the copyright holder explicitly and finally terminates your license, and (b) permanently, if the copyright holder fails to notify you of the violation by some reasonable means prior to 60 days after the cessation.

Moreover, your license from a particular copyright holder is reinstated permanently if the copyright holder notifies you of the violation by some reasonable means, this is the first time you have received notice of violation of this License (for any work) from that copyright holder, and you cure the violation prior to 30 days after your receipt of the notice.

Termination of your rights under this section does not terminate the licenses of parties who have received copies or rights from you under this License. If your rights have been terminated and not permanently reinstated, you do not qualify to receive new licenses for the same material under section 10.
9. Acceptance Not Required for Having Copies.

You are not required to accept this License in order to receive or run a copy of the Program. Ancillary propagation of a covered work occurring solely as a consequence of using peer-to-peer transmission to receive a copy likewise does not require acceptance. However, nothing other than this License grants you permission to propagate or modify any covered work. These actions infringe copyright if you do not accept this License. Therefore, by modifying or propagating a covered work, you indicate your acceptance of this License to do so.
10. Automatic Licensing of Downstream Recipients.

Each time you convey a covered work, the recipient automatically receives a license from the original licensors, to run, modify and propagate that work, subject to this License. You are not responsible for enforcing compliance by third parties with this License.

An “entity transaction” is a transaction transferring control of an organization, or substantially all assets of one, or subdividing an organization, or merging organizations. If propagation of a covered work results from an entity transaction, each party to that transaction who receives a copy of the work also receives whatever licenses to the work the party's predecessor in interest had or could give under the previous paragraph, plus a right to possession of the Corresponding Source of the work from the predecessor in interest, if the predecessor has it or can get it with reasonable efforts.

You may not impose any further restrictions on the exercise of the rights granted or affirmed under this License. For example, you may not impose a license fee, royalty, or other charge for exercise of rights granted under this License, and you may not initiate litigation (including a cross-claim or counterclaim in a lawsuit) alleging that any patent claim is infringed by making, using, selling, offering for sale, or importing the Program or any portion of it.
11. Patents.

A “contributor” is a copyright holder who authorizes use under this License of the Program or a work on which the Program is based. The work thus licensed is called the contributor's “contributor version”.

A contributor's “essential patent claims” are all patent claims owned or controlled by the contributor, whether already acquired or hereafter acquired, that would be infringed by some manner, permitted by this License, of making, using, or selling its contributor version, but do not include claims that would be infringed only as a consequence of further modification of the contributor version. For purposes of this definition, “control” includes the right to grant patent sublicenses in a manner consistent with the requirements of this License.

Each contributor grants you a non-exclusive, worldwide, royalty-free patent license under the contributor's essential patent claims, to make, use, sell, offer for sale, import and otherwise run, modify and propagate the contents of its contributor version.

In the following three paragraphs, a “patent license” is any express agreement or commitment, however denominated, not to enforce a patent (such as an express permission to practice a patent or covenant not to sue for patent infringement). To “grant” such a patent license to a party means to make such an agreement or commitment not to enforce a patent against the party.

If you convey a covered work, knowingly relying on a patent license, and the Corresponding Source of the work is not available for anyone to copy, free of charge and under the terms of this License, through a publicly available network server or other readily accessible means, then you must either (1) cause the Corresponding Source to be so available, or (2) arrange to deprive yourself of the benefit of the patent license for this particular work, or (3) arrange, in a manner consistent with the requirements of this License, to extend the patent license to downstream recipients. “Knowingly relying” means you have actual knowledge that, but for the patent license, your conveying the covered work in a country, or your recipient's use of the covered work in a country, would infringe one or more identifiable patents in that country that you have reason to believe are valid.

If, pursuant to or in connection with a single transaction or arrangement, you convey, or propagate by procuring conveyance of, a covered work, and grant a patent license to some of the parties receiving the covered work authorizing them to use, propagate, modify or convey a specific copy of the covered work, then the patent license you grant is automatically extended to all recipients of the covered work and works based on it.

A patent license is “discriminatory” if it does not include within the scope of its coverage, prohibits the exercise of, or is conditioned on the non-exercise of one or more of the rights that are specifically granted under this License. You may not convey a covered work if you are a party to an arrangement with a third party that is in the business of distributing software, under which you make payment to the third party based on the extent of your activity of conveying the work, and under which the third party grants, to any of the parties who would receive the covered work from you, a discriminatory patent license (a) in connection with copies of the covered work conveyed by you (or copies made from those copies), or (b) primarily for and in connection with specific products or compilations that contain the covered work, unless you entered into that arrangement, or that patent license was granted, prior to 28 March 2007.

Nothing in this License shall be construed as excluding or limiting any implied license or other defenses to infringement that may otherwise be available to you under applicable patent law.
12. No Surrender of Others' Freedom.

If conditions are imposed on you (whether by court order, agreement or otherwise) that contradict the conditions of this License, they do not excuse you from the conditions of this License. If you cannot convey a covered work so as to satisfy simultaneously your obligations under this License and any other pertinent obligations, then as a consequence you may not convey it at all. For example, if you agree to terms that obligate you to collect a royalty for further conveying from those to whom you convey the Program, the only way you could satisfy both those terms and this License would be to refrain entirely from conveying the Program.
13. Use with the GNU Affero General Public License.

Notwithstanding any other provision of this License, you have permission to link or combine any covered work with a work licensed under version 3 of the GNU Affero General Public License into a single combined work, and to convey the resulting work. The terms of this License will continue to apply to the part which is the covered work, but the special requirements of the GNU Affero General Public License, section 13, concerning interaction through a network will apply to the combination as such.
14. Revised Versions of this License.

The Free Software Foundation may publish revised and/or new versions of the GNU General Public License from time to time. Such new versions will be similar in spirit to the present version, but may differ in detail to address new problems or concerns.

Each version is given a distinguishing version number. If the Program specifies that a certain numbered version of the GNU General Public License “or any later version” applies to it, you have the option of following the terms and conditions either of that numbered version or of any later version published by the Free Software Foundation. If the Program does not specify a version number of the GNU General Public License, you may choose any version ever published by the Free Software Foundation.

If the Program specifies that a proxy can decide which future versions of the GNU General Public License can be used, that proxy's public statement of acceptance of a version permanently authorizes you to choose that version for the Program.

Later license versions may give you additional or different permissions. However, no additional obligations are imposed on any author or copyright holder as a result of your choosing to follow a later version.
15. Disclaimer of Warranty.

THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM “AS IS” WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
16. Limitation of Liability.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
17. Interpretation of Sections 15 and 16.

If the disclaimer of warranty and limitation of liability provided above cannot be given local legal effect according to their terms, reviewing courts shall apply local law that most closely approximates an absolute waiver of all civil liability in connection with the Program, unless a warranty or assumption of liability accompanies a copy of the Program in return for a fee.

END OF TERMS AND CONDITIONS
How to Apply These Terms to Your New Programs

If you develop a new program, and you want it to be of the greatest possible use to the public, the best way to achieve this is to make it free software which everyone can redistribute and change under these terms.

To do so, attach the following notices to the program. It is safest to attach them to the start of each source file to most effectively state the exclusion of warranty; and each file should have at least the “copyright” line and a pointer to where the full notice is found.

    <one line to give the program's name and a brief idea of what it does.>
    Copyright (C) <year>  <name of author>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

Also add information on how to contact you by electronic and paper mail.

If the program does terminal interaction, make it output a short notice like this when it starts in an interactive mode:

    <CrontabAdmin-cycled>  Copyright (C) <2017>  <Vitaly Castaño Solana>
    This program comes with ABSOLUTELY NO WARRANTY; for details type 'show w'.
    This is free software, and you are welcome to redistribute it
    under certain conditions; type 'show c' for details.

The hypothetical commands 'show w' and 'show c' should show the appropriate parts of the General Public License. Of course, your program's commands might be different; for a GUI interface, you would use an “about box”.

You should also get your employer (if you work as a programmer) or school, if any, to sign a “copyright disclaimer” for the program, if necessary. For more information on this, and how to apply and follow the GNU GPL, see <https://www.gnu.org/licenses/>.

The GNU General Public License does not permit incorporating your program into proprietary programs. If your program is a subroutine library, you may consider it more useful to permit linking proprietary applications with the library. If this is what you want to do, use the GNU Lesser General Public License instead of this License. But first, please read <https://www.gnu.org/licenses/why-not-lgpl.html>.
"

	# pasamos el exrito de ayuda para cron a nuestro archivo de texto temporal
	# atencion con operadores ">" y ">>", ya que uno añade y otro borra todo lo que contiene el archivo de texto ademas de añadir despues lo que queriamos pasar
	echo "$texto_licencia_cron">temp-crontab.txt

	# mostramos en zenity una ventana con informacion, con archivo de texto importado
	if zenity --width=600 --height=380 --text-info --title="CrontabAdmin-Cycled licencia" --filename=temp-crontab.txt --ok-label="Ir al menu principal" --cancel-label="Salir del programa"; then

		# recogemos la basura como bien educados que somos
		if [ -e temp-crontab.txt ]; then
			rm temp-crontab.txt
		fi

		# y ahora entramos al directorio de partida
		cd || exit

		# volvemos al menu principal por peticion de usuario
		menu_principal; return

	else
		
		# recogemos la basura como bien educados que somos
		if [ -e temp-crontab.txt ]; then
			rm temp-crontab.txt
		fi

		# y ahora entramos al directorio de partida
		cd || exit

		# educadamente nos despedimos
		hasta_luego

	fi

}

# --------------- FIN FUNCION MENU CASE 7 ------------------------------









# ----------------- FUNCION MENU CASE 8 ------------------------------

function menu_case8() {

	hasta_luego

}

# --------------- FIN FUNCION MENU CASE 8 ------------------------------











#																'##::::'##::::'###::::'########::'####::::'###::::'########::'##:::::::'########::'######::
#																 ##:::: ##:::'## ##::: ##.... ##:. ##::::'## ##::: ##.... ##: ##::::::: ##.....::'##... ##:
#																 ##:::: ##::'##:. ##:: ##:::: ##:: ##:::'##:. ##:: ##:::: ##: ##::::::: ##::::::: ##:::..::
#																 ##:::: ##:'##:::. ##: ########::: ##::'##:::. ##: ########:: ##::::::: ######:::. ######::
#																. ##:: ##:: #########: ##.. ##:::: ##:: #########: ##.... ##: ##::::::: ##...:::::..... ##:
#																:. ## ##::: ##.... ##: ##::. ##::: ##:: ##.... ##: ##:::: ##: ##::::::: ##:::::::'##::: ##:
#																::. ###:::: ##:::: ##: ##:::. ##:'####: ##:::: ##: ########:: ########: ########:. ######::
#																:::...:::::..:::::..::..:::::..::....::..:::::..::........:::........::........:::......:::




# ------------VARIABLES------------------------

# MI_VARIABLE=lo_que_quiero_almacenar
# indicamos donde esta nuestro script que se ejecuta para hacer un backup de base de datos, esta determinado con este comando, que significa que se almacenara en la variable SUDO_USER el usuario que esta usando cuenta de superusuario (usuario)
# se omite ya que ejecutaremos todo con nuestro usuario pero con "sudo" (el mismo usuario que esta ejecutando este script pero con "sudo)
#export DIR=/home/$SUDO_USER/script-crontab-backup.sh
# en caso de decidir usar una introduccion de usuario usuario con su contraseña, estariamos logueados como usuario y usariamos el comando anterior (en vez del siguiente) para obtener nuestro nombre de usuario con el que estamos usando usuario usuario

# se deciden omitir estos comandos porque son variables de entorno, podrias dar problemas en el futuro

# export DIR=/home/$USER/script-crontab-backup.sh
#directorio_script_backup="/home/$USER/script-crontab-backup.sh"

# se declara una variable para obtener la ruta de script que se encarga de hacer el backup de base de datos
directorio_script_backup="$HOME/script-crontab-backup.sh"

# pasamos a todas las variables un * como valor por defecto, si el usuario decide no modificar por ejemplo el mes, se usara valor *, como valor omitido, que significara cada mes en este ejemplo
minuto_cron="*"
hora_cron="*"
dia_mes_cron="*"
mes_cron="*"
dia_semana_cron="*"

# tarea_completa es la variable donde almacenaremos, por ejemplo para concatenar haremos lo siguiente:

# declaramos una variable que contendra string completo de variables anteriores
tarea_completa="${minuto_cron} ${hora_cron} ${dia_mes_cron} ${mes_cron} ${dia_semana_cron} ${dir}"
# tarea_completa_array=("${minuto_cron}" "${hora_cron}" "${dia_mes_cron}" "${mes_cron}" "${dia_semana_cron}" "${dir}")

# si queremos que caracter "*" sea tratado como string, no olvidemos usarlo como tal con este ejemplo: 
# echo "$MINUTO_CRON" o "${MINUTO_CRON}"
# este comando nos dara que estamos alamacenando * como string, con el que vamos a concatenar comando entero para crontab

# ------------FIN DE VARIABLES-----------------




# pantalla de bienvenida, se puede omitir, no compromete el funcionamiento del programa
zenity --width=350 --info --text "¡BIENVENIDO!" --timeout=1
notify-send "¡Bienvenido al CronTabAdmin-cycled!"







											#        #           #     #     #     #     ######      #      #####  
											#        #          # #    ##   ##    # #    #     #    # #    #     # 
											#        #         #   #   # # # #   #   #   #     #   #   #   #       
											#        #        #     #  #  #  #  #     #  #     #  #     #   #####  
											#        #        #######  #     #  #######  #     #  #######        # 
											#        #        #     #  #     #  #     #  #     #  #     #  #     # 
											#######  #######  #     #  #     #  #     #  ######   #     #   #####  





# ------------------------------ LLAMADAS A LAS FUNCIONES ------------------------------

# ejecutamos la funcion de comprobar la contraseña de usuario
comprobar_password

# ejecutamos la funcion de menu principal
menu_principal

# ------------------------------ FIN DE LLAMADAS A LAS FUNCIONES ------------------------------







# if zenity --question --text "quieres ahcer backup"; then 
	# exit 1
# fi

# notify-send "rsnapshot done :)"

# /etc/init.d/cron restart
