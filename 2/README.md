PREGUNTA:

Necesitamos crear un RAID sobre una máquina que no tiene controladora hardware. Como lo harías? Detalla tu solución, no necesitamos una implementación funcional solo detallar los pasos a seguir.

RESPUESTA:

### Comprobaciones previas
- Tener al menos dos discos duros, formateados como **básicos**
- Hacer backup de los datos de usuario o lo que sea necesario
### Pasos a seguir
RESUMIDAMENTE (además, lo hago de memoria pues no tengo equipos Windows en casa):
- Ejecutar el programa de particionado de windows
- En la administración de discos, seleccionar los discos a incluir en el RAID
- Con botón derecho, seleccionar y escoger **"Nuevo volumen simple"**
- En el asistente que sale, seleccionamos crear un **volumen dinámico**
- Ahí podemos escoger el tipo de RAID que, si mi memoria no me falla son:
  - Mirror: ambos discos serán una copia idéntica (redundancia)
  - Combinar ambos en un volumen más grande
  - Otro formato que graba fragmentos (trozos) en ambos discos simultáneamente, mejorando el rendimiento
- Después formateamos con el sistema de archivos de nuestra elección y asignamos una letra de unidad al volumen.
