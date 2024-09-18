# PARÁMETROS OBLIGATORIOS:
# -auth "path\archivo" # Define el fichero donde se encuentra la lista (un servicio en cada línea) de procesos autorizados
# -log "path\archivo" # Define el fichero que se creará -o al que se añadirán- los registros de todo el proceso
param(
    [string]$Autorizados,
    [string]$Registro
)

function ParaServicio {
#Con esta función, detenemos el servicio sospechoso
    param(
        [string]$NombreServicio
    )
    Write-Warning "Deteniendo servicio no autorizado: $NombreServicio"
    Stop-Service -Name $NombreServicio -Force
}

# Aquí obtenemos la lista de procesos que están autorizados
$ProcesosAutorizados = Get-Content $Autorizados

# Obtenemos la lista de procesos que se encuentran en ejecución
$ServiciosEnEjecucion = Get-Service | Where-Object { $_.Status -eq "Running" }

# Hacemos la obligada comparación entre los servicios en ejecución y los autorizados,
# procediendo a detener los que no lo estén
foreach ($servicio in $ServiciosEnEjecucion) {
    if ($ProcesosAutorizados -notcontains $servicio.Name) {
        ParaServicio -NombreServicio $servicio.Name
        Add-Content -Path $Registro -Value "Servicio no autorizado detenido: $($servicio.Name)"
    } else {
        Add-Content -Path $Registro -Value "Servicio autorizado: $($servicio.Name)"
    }
}

# Finalizamos el proceso
Add-Content -Path $Registro -Value "Fin de la ejecución del script"
