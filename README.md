# Provisión de Infraestructura en AWS con Terraform (Simulación con LocalStack)

**GRUPO 5**  
- Juan Villaman  
- Cristóbal de Jesus  
- Víctor Figueroa  

**Módulo 6:** Tecnología cloud y DevOps  
**Clase 5:** Infraestructura como código (IaC)  
**Ejercicio Guiado:** Provisión de Infraestructura en AWS con Terraform  

---

## Descripción

Ejercicio práctico para simular la provisión de infraestructura en AWS usando Terraform, en un entorno local con LocalStack, debido a restricciones de acceso a una cuenta AWS real.

---

## Objetivo del ejercicio guiado

Utilizar Terraform como herramienta declarativa de Infraestructura como Código (IaC) para desplegar los siguientes recursos en AWS:

- VPC personalizada  
- Subred pública  
- Gateway de internet  
- Tabla de rutas  
- Grupo de seguridad  
- Instancia EC2  

---

## ⚠️ Limitación detectada

No fue posible utilizar una cuenta real de AWS, ya que se requiere tarjeta de crédito incluso en la capa gratuita. Por ello, usamos LocalStack (versión trial) para simular los servicios de AWS localmente. Sin embargo, Terraform v1.12.2 no soporta redirección completa de servicios AWS a endpoints locales, lo que limitó la ejecución final.

---

## Estrategia de aprendizaje implementada

Se subió el flujo completo del ejercicio, como si se estuviera trabajando en AWS:

1. Instalación de Terraform y configuración de variables de entorno.
2. Creación y edición de archivos `.tf`:  
   - `main.tf`: define recursos como VPC, EC2, etc.  
   - `variables.tf`: define la variable `key_name`.  
   - `outputs.tf`: salida de IP pública.  
3. Ejecución de comandos:
   - `terraform init`
   - `terraform plan`
   - `terraform apply`
   - `terraform output`
4. Configuración y ejecución de LocalStack vía Docker en Ubuntu (WSL).
5. Uso de credenciales ficticias (`test/test`) para simular conexión.

---

## Descripción de archivos

- **main.tf**: Define todos los recursos de infraestructura. Se adaptó para usar `key_name = "simulada"` como valor ficticio.
- **variables.tf**: Define el parámetro `key_name` como variable tipo string.
- **outputs.tf**: Expone la IP pública de la instancia EC2 (simulada).

✅ **Archivo modificado**: `main.tf` fue editado para operar en entorno simulado y permitir pruebas sin AWS real.

---

## Capturas

1. **terraform init**  
   Muestra que Terraform fue correctamente inicializado y se descargó el proveedor `aws`.
<img width="952" height="274" alt="01_terraform_init" src="https://github.com/user-attachments/assets/9a11183c-06fd-4f11-b57c-d683f5d3bd98" />

2. **terraform plan**  
   Terraform identificó correctamente los 7 recursos a crear. Coincide con el objetivo del ejercicio.
<img width="1342" height="695" alt="02_terraform_plan" src="https://github.com/user-attachments/assets/b9fb2e55-91c2-4fbb-b772-e0f959eff5ad" />

3. **terraform apply**  
   Intento de creación de recursos. Falla por credenciales inválidas, como se esperaba.
<img width="1344" height="700" alt="03_terraform_apply" src="https://github.com/user-attachments/assets/6ad39722-4212-4476-8454-15262a98a224" />

4. **terraform output**  
   Muestra que no hay salidas válidas, ya que los recursos no se crearon.
<img width="1338" height="264" alt="04_terraform_output" src="https://github.com/user-attachments/assets/c2e57274-c115-4d49-bada-6cfdc88ca714" />

5. **LocalStack en Ubuntu**  
   Captura del contenedor ejecutándose y escuchando en el puerto 4566, simulando los servicios de AWS.
<img width="958" height="208" alt="05_LocalStack" src="https://github.com/user-attachments/assets/116b9b6f-0b26-49e3-9e3c-31cb88a3cb53" />

---

## Preguntas finales

**¿Qué ventajas encuentras en definir tu infraestructura como código?**  
Permite replicar configuraciones como nuestra VPC y EC2 fácilmente. Automatiza el proceso y mejora la documentación y control de versiones, incluso en entornos simulados.

**¿Qué desafíos enfrentaste usando Terraform?**  
No poder conectarnos a AWS real nos forzó a simular con LocalStack. También fue desafiante comprender errores por versiones o credenciales no válidas.

**¿Cómo versionarías este proyecto para un equipo de trabajo?**  
Usaríamos Git, separando ramas para pruebas. Subiríamos los `.tf`, el `README.md` y capturas del flujo simulado. Así aseguramos trazabilidad y colaboración.

---

## Reflexión

Aunque no se logró ejecutar en AWS real, completamos el flujo completo de Terraform, simulando todo el proceso. Esto permitió:

- Comprender la estructura y funciones de archivos `.tf`.
- Ejecutar y entender los comandos clave: `init`, `plan`, `apply`, `output`.
- Emular credenciales y conexión.
- Enfrentar limitaciones técnicas sin frenar el aprendizaje.

Fue una experiencia formativa sólida y aplicable a contextos reales con acceso a nube.
