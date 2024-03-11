# Comic Book App

## Credenciales de ingreso:

- correo: sundev@test.com
- clave: 123456

sin embargo sientansen libres de ingresar usando el registro o la autenticación de google con su correo.

## Como en este caso el proyecto de firebase esta creado sobre mi cuenta personal, se realiza el cargue de la apk directamente para que puedan instalarla en cualquier dispositivo Android

Este archivo lo encontraran en el siguiente link:

- 'https://we.tl/t-C83NxRGFJ3'

## Prerequisitos:

Aunque flutter suele mantener un buen nivel de retrocompatibilidad, se indican las versiones con las cuales se creo el proyecto y las cuales aseguraran un correcto funcionamiento para el mismo.

- Flutter: 3.13.9
- Dart: 3.1.5

## (Bajo un entorno de desarrollo en equipo)Pasos para inicializar el proyecto y construir la aplicación:

1. Modificar el archivo `.env` con la `api_key` del sitio de cómics. Si no tienes una `api_key`, puedes utilizar la siguiente: `'6e3b959b1fcb098ce43cbba926e784aa51185e27'`.
   
2. Ejecutar el siguiente comando para instalar todas las dependencias requeridas: `flutter pub get`

3. Se debe ingresar al proyecto de firebase al cual esta asociado el aplicativo, y registrar las claves SHA-1 y SHA-256 para que las credenciales de firebase funcionen en el proyecto

4. Ejecutar el comando: `flutter run`

Asegurándose de tener un dispositivo conectado y la depuración por USB activa.

5. Si no deseas correr el programa desde un dispositivo conectado, puedes construir un APK de lanzamiento ejecutando:

`flutter build apk --release`

7. En la carpeta `build/app/outputs/flutter-apk`, encontrarás el archivo APK listo para ser instalado.

## Consideraciones del proyecto:

Se hace entrega de la aplicación teniendo en cuenta la información proporcionada en el archivo con las instrucciones y algunos de los puntos opcionales que se indicaron.

## Qué hubiera mejorado con más tiempo:

- Agregar un poco de personalización en algunos estilos de textos.
- Incluir un botón o un pull-to-refresh para enviar nuevamente una solicitud de peticiones desde la pantalla.
- Implementar un stream que esté escuchando el estado de conexión a internet para volver a solicitar los datos.
- Implementar un infinite scroll manejando el scroll controller de la pantalla, para solicitar más datos cuando el usuario se desplace por la aplicación.

