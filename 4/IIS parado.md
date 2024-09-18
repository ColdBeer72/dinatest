PREGUNTA:
> Tengo un site del IIS parado, que pasos seguirías para comprobar el fallo? Detalla el proceso de depuración.

RESPUESTA:
Siempre en función del tipo de error, historial y sospecha, el orden debe variar pero las comprobaciones creo que deberían pasar por:
1. Verificar el estado del servicio (con la gestión de servicios del propio Windows), comprobando que esté iniciado y con arranque automático
2. Revisar los logs (normalmente en `C:\inetpub\logs\LogFiles`), buscando especialmente errores 500, 404 o errores de conexión a base de datos.
3. Revisar los logs del sistema (en el visor de registro de windows)
4. Comprobar la configuración del sitio es correcta (IP, puerto, host), así como qué aplicaciones usa (y su configuración) y permisos
5. Chequear el Pool de aplicaciones: frecuencia del reciclaje, configuración (límites de tiempo, inactividad, identidad...) y permisos de la identidad del pool
6. Comprobar el Código de la Aplicación (depurar, siempre que sea posible, verificar los logs de la misma, versiones...)
7. Comprobar la base de datos (conectividad desde la app, comprobar las consultas y si es necesario, la integridad de los datos)
8. Comprobar la configuración del servidor (si hay un firwall bloqueando conexiones al sitio web o a la base de datos, comprobar si la configuración de red, en general es correcta, o si hay otros servicios en conflicto)
Si nada de lo anterior funciona, habría que intentar hacer un trabajo más profundo, como aislar el sitio web a otro servidor (con una configuración mínima y sin servicios adicionales) para comprobar su funcionamiento.
Utilizar herramientas como WireShark, Fiddler, VS-Code o incluso el monitor de procesos puede ayudar en algunas de estas tareas.
