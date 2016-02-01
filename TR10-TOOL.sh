#!/bin/bash
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Este script te ayudará en el proceso de rooteo de la Tablet TR10CS1 y TR10RS1
# Activar la depuración USB en tu dispositivo para que funcione sin problemas.
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# A TINY TR10 CLI TOOL FOR GNU/LINUX BASH VERSION 1.0.0
#
# Developer  : Erick Carvajal Rodriguez
# Contact    : http://twitter.com/neocarvajal && http://fb.com/neocarvajal
# Date       : 03/12/2015
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# COLABORADOR EN VERSIÓN 2.0.0 CON ENTORNO GRAFICO UTILIZANDO ZENITY
#
# Developer  : Wuilmer Bolivar
# Contact    : http://twitter.com/wuilmerbolivar && http://fb.com/wuilmer22
# Date       : 27/01/2016
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#= = = = = = = = = = Variables Globales TR10-TOOL = = = = = = = = = =
. Config.sh
#= = = = = = = = = = Variables Globales ADB = = = = = = = = = =
adb_globals

#= = = = = = = = = = Función de la barra de progreso = = = = = = = = = =
function timing {
	for i in `seq 1 100`
 do
    echo "$i"
    sleep 0.10
done
}
timing | zenity --title=".: TR10-TOOL :."  \
--no-cancel --progress --percentage=0 --auto-close \
--text="Herramienta desarrollada por TSU Erick Carvajal con fines educativos. 
\n Cada persona es responsable de su uso." 

#= = = = = = = = = = Cerrando conexiones ADB viejas = = = = = = = = = =
$ADB kill-server

#= = = = = = = = = = Recordatorio sobre depuración USB = = = = = = = = = =
zenity --warning --no-wrap --no-markup --title="Notificación importante!" \
--text="Recuerda activar la depuración USB en el menú desarrollador"

 #= = = = = = = = = = Notifica el reinicio de servidor ADB = = = = = = = = = =
$ADB start-server & zenity --info --title="Notificación importante!" \
 --text="Reiniciando Servidor ADB..." 

#= = = = = = = = = = Función para conectarse a la tablet = = = = = = = = = =
conections_tr10_tool

#= = = = = = = = = = Verifica el estado de conexión = = = = = = = = = =
#= = = = = = = = = = Si se conecta se conecta al menú = = = = = = = = = =
if [ $ESTADO == $CONECTADO ]; then
	bash MenuPrincipal.sh
else
	zenity --error --title="Notificación importante!" \
			--text="Imposible establecer conexión...\n.: DESACTIVANDO MENÚ :."
	bash MenuPrincipal.sh
fi
