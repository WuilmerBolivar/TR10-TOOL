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
#= = = = = = = = = = Función ABD Globales = = = = = = = = = =
function adb_globals() {
	DIR=$(pwd)
	ADB="${DIR}/ANDROID-SDK-LINUX/./adb"
	FASTBOOT="${DIR}/ANDROID-SDK-LINUX/./fastboot"
}
#= = = = = = = = = = Permite conectarse al equipo = = = = = = = = = =
function conections_tr10_tool() {
	ESTADO=`$ADB get-state`
	CONECTADO="device"
	SERIAL=`$ADB get-serialno`
	RECONEXION=1
	OPCION=0
}
