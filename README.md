# Comic Book App

## Pasos para inicializar el proyecto y construir la aplicación:

1. Modificar el archivo `.env` con la `api_key` del sitio de cómics. Si no tienes una `api_key`, puedes utilizar la siguiente: `'6e3b959b1fcb098ce43cbba926e784aa51185e27'`.
   
2. Ejecutar el siguiente comando para instalar todas las dependencias requeridas: flutter pub get


3. Ejecutar el comando: flutter run

Asegurándose de tener un dispositivo conectado y la depuración por USB activa.

4. Si no deseas correr el programa desde un dispositivo conectado, puedes construir un APK de lanzamiento ejecutando: flutter build apk --release


5. En la carpeta `build/app/outputs/flutter-apk`, encontrarás el archivo APK listo para ser instalado.

## Consideraciones del proyecto:

Se hace entrega de la aplicación teniendo en cuenta la información proporcionada en el archivo con las instrucciones y algunos de los puntos opcionales que se indicaron.

## Qué hubiera mejorado con más tiempo:

- Agregar un poco de personalización en algunos estilos de textos.
- Incluir un botón o un pull-to-refresh para enviar nuevamente una solicitud de peticiones desde la pantalla.
- Implementar un stream que esté escuchando el estado de conexión a internet para volver a solicitar los datos.
- Implementar un infinite scroll manejando el scroll controller de la pantalla, para solicitar más datos cuando el usuario se desplace por la aplicación.

