PREGUNTA:

Implementa un script en powershell que obtenga los servicios en ejecución de la máquina y compruebe de otro listado de procesos autorizados (este otro listado puede ser un fichero, paso por parámetros en la ejecución, etc..) y en caso de detectar un proceso no autorizado, parar el proceso y escribir en un log la información relevante de toda la ejecución del script.

RESPUESTA:

He creado **[este script](1/script.ps1)** de forma rápida para lo solicitado. Yo lo mejoraría añadiendo control del host desde el que se realiza la tarea, usuario....
