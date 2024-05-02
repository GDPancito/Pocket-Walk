# Pocket Walk

## Introducción

Pocket Walk es un juego 2D creado de forma independiente utilizando el motor de Godot.
Este proyecto es una práctica e implementación de la teoría para fines didácticos.
Este proyecto implementa:

- IA básica para perseguir al jugador (utilizando NavigationAgent y NavigationRegion)
- Manejo de interfáces gráficas y cambios de escena
- Internacionalización con idioma español-inglés intercambiable en el mismo juego (en ajustes) sin tener que cerrarlo
- Movimiento del enemigo y del jugador
- Muchas configuraciones del editor
- Exportación a linux y windows (se considera crear una versión para Android)

## ¿Cómo Jugar?

Juego solo para PC (de momento). Según tu sistema operativo:
- bin/linux : para versiones de x86_64 de linux
- bin/win : para versiones x86_64 de Windows

## Licencia

Licencia CC0 universal para cualquiera que desee usar el proyecto. No retribución ni permiso requerida.
[Pocket Walk](https://github.com/GDPancito/Pocket-Walk) by [Joaquin Hourcade](https://github.com/GDPancito) is marked with [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/?ref=chooser-v1)

## Estructura de archivos

- assets/ : contiene los archivos de audio, traducciones y temas
- addons/ : contiene las extensiones usadas
- bin/ : compilaciones del juego listas para usar. Para linux y Windows
- characters/ : contiene los archivos del enemigo y del jugador. Scripts, escenas, imágenes, etc.
- gui/ : contiene los archivos para las pantallas, como el menú principal, ajustes, acerca de
- items/ : contiene los archivos del fondo, maíz y obstáculos
- main/ : contiene la escena principal y el mundo
- LICENSE : licencia del proyecto
