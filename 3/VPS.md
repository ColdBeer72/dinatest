CONSULTA:
> En dinahosting, ofrecemos a nuestros clientes la posibilidad de contratar un VPS (una máquina virtual), diseña un sistema de alta de VPS, asumimos que tienes ya un proceso en tu Windows Server con Hyper-V que ya recibe la acción de crear un VPS, detalla como harías a continuación para crear esa máquina virtual con Windows Server ya configurado y que el cliente la tenga disponible en el menor tiempo posible. Detalla tu solución, no necesitamos una implementación funcional solo detallar los pasos a seguir.

RESPUESTA:
- Intentaría automatizar todo el proceso de creación utilizando plantillas con las características (CPU, memoria, disco...) más comunes.
- En los scripts que utilizaran dichas plantillas, añadiría la opción de asignar recursos fundamentales (configuración IP, configuración inicial del sistema operativo...)
- He usado **Puppet** recientemente (cuando hacía estas cosas habitualmente no existía todavía nada parecido), así que intentaría integrar alguna herramienta como Puppet o Ansible para facilitar y hacer coherente todo el proceso.
- Verificar que todo se integra perfectamente con el entorno de DinaHosting (portal, notificaciones...) y que se envía correctamente la información pertinente al cliente y a los servicios de DinaHosting que necesiten conocer el hecho.
- Comprobar que todo el proceso es escalable, repetible y automatizable.
