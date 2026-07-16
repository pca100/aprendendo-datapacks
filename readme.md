# Datapack: [Nombre de tu Proyecto]

Guía de estructura y configuración para el desarrollo del datapack.

# Índice de Referencia

- [Descripción del Proyecto](#descripción-del-proyecto)
- [ Estructura de Datos](#estructura-de-datos)
- [ Arquitectura Modular](#organización-modular-arquitectura)
- [ Herramientas y Recursos](#herramientas-y-recursos)
- [ Tabla de Compatibilidad (pack_format)](#relacion-pack_format-con-version)
- [ Notas de Desarrollo](#notas-de-desarrollo)
- [ Transición NBT vs Data Components](#transición-nbt-vs-data-components)
- [ Declaración en Archivos](#declaración-en-archivos)


---

## Descripción del Proyecto

Este proyecto está diseñado como una base profesional para crear tus propios datapacks. Su objetivo es proporcionar una estructura organizada, modular y escalable que facilite el desarrollo, evitando el caos en el código y simplificando las actualizaciones entre versiones de Minecraft. Incluye guías de uso y herramientas esenciales para un flujo de trabajo eficiente.

## Estructura de Datos

* **`minecraft/`**: Archivos que sobrescriben el código original del juego.

* **`[namespace]/`**: Contenido principal y lógica propia del datapack.

    * **`functions/`**: Funciones del proyecto organizadas por lógica.

    * **`predicates/`**: Condiciones y filtros para ítems.

    * **`tags/`**: Listas de objetos para mantener el código limpio.

    * **`loot_tables/`**: Tablas de drops de enemigos.

## Organización Modular (Arquitectura)
Para facilitar las actualizaciones de versión, el contenido se divide así:

```text
data/mi_namespace/
├── functions/
│   ├── mobs/            # Lógica de enemigos (zombies, bosses)
│   ├── utils/           # Herramientas globales (tick, bucles)
│   └── main.mcfunction  # Punto de entrada principal
├── predicates/          # Condiciones de ítems
├── tags/
│   └── items/           # Grupos de objetos
└── loot_tables/
    └── mobs/            # Drops de mobs custom
```

## Herramientas y Recursos

### VS Code
* **[Datapack Helper Plus by Spyglass](https://spyglassmc.com/user/config)**: Extensión esencial para autocompletado, validación de sintaxis y detección de errores.

### Generadores y Utilidades
* **[Misode](https://misode.github.io/)**: El generador más completo para archivos `.json` (loot tables, predicados, estructuras).
* **[McStacker](https://mcstacker.net/)**: Generador de comandos (`/summon`, `/particle`, `/give`) con interfaz visual.
* **[Blockbench](https://www.blockbench.net/)**: Herramienta para modelado, texturizado y animación de entidades custom.

### Documentación y Referencia
* **[Minecraft Wiki (Commands)](https://minecraft.wiki/w/Commands)**: Documentación oficial para consultar sintaxis detallada.
* **[Minecraft Wiki (Datapacks)](https://minecraft.wiki/w/Data_pack)**: Guía de referencia técnica sobre la estructura y funcionamiento de los datapacks.


## Relacion pack_format con Version

| Versión de Minecraft | pack_format |
| :--- | :--- |
| 1.21.x | 48 |
| 1.20.5 - 1.20.6 | 41 |
| 1.20.3 - 1.20.4 | 26 |
| 1.20.2 | 18 |
| 1.20 - 1.20.1 | 15 |
| 1.19.4 | 13 |
| 1.19.3 | 12 |
| 1.19 - 1.19.2 | 10 |
| 1.18.2 | 9 |
| 1.18 - 1.18.1 | 8 |
| 1.17.x | 7 |
| 1.16.2 - 1.16.5 | 6 |
| 1.16 - 1.16.1 | 5 |
| 1.15.x | 5 |
| 1.14.x | 4 |
| 1.13.x | 4 |
| 1.12.x | 3 |
| 1.11.x | 3 |
| 1.10.x | 2 |
| 1.9.x | 2 |
| 1.8.x | 1 |
| 1.7.x | 1 |



## Notas de Desarrollo

Aquí tienes los comandos esenciales para probar y corregir tu datapack de forma rápida.

### Comandos de Control
* `/reload`: **Obligatorio** tras cada cambio en cualquier archivo `.json` o `.mcfunction`. Refresca el datapack en la memoria del juego.
* `/function mi_namespace:main`: Ejecuta manualmente tu función principal para probar que los sistemas se inicializan correctamente.

### Comandos de Depuración
* `/datapack list`: Verifica si tu proyecto está cargado y si aparece en **rojo** (error de sintaxis) o en **verde** (correcto).
* `/execute as @e[type=...] run say @s`: Ideal para comprobar si tu lógica está detectando correctamente a las entidades.
* `/gamerule sendCommandFeedback true`: Activa esto para ver en el chat si los comandos se están ejecutando con éxito o si están lanzando errores.

### Flujo de Trabajo Recomendado
1. **Edita**: Realiza los cambios en VS Code.
2. **Guarda**: Asegúrate de que todos los archivos están guardados.
3. **Refresca**: Ejecuta `/reload` dentro de Minecraft.
4. **Verifica**: Comprueba que el resultado es el esperado.

---

> **Tip de depuración**: Si una función no parece activarse, usa el comando `tellraw` o `say` dentro de ella. Si el mensaje no aparece en el chat, sabrás que el problema está en la condición (`predicate`) o en el activador (`tick.json`) y no en la lógica interna.


## Transición NBT vs Data Components

A partir de la versión **1.20.5**, el sistema de NBT fue sustituido por **Data Components**. Este cambio es fundamental para la estabilidad y compatibilidad de tus proyectos.

### 1. Comparativa de Sintaxis

| Característica | Sintaxis Antigua (Pre-1.20.5) | Sintaxis Nueva (1.20.5+) |
| :--- | :--- | :--- |
| **Formato** | Llaves `{}` | Corchetes `[]` |
| **Atributos** | NBT anidado (ej: `display`) | Componentes planos |
| **Nombres** | CamelCase (`HandItems`) | snake_case (`hand_items`) |

### 2. Ejemplo práctico: Comando `/give`

* **Versión antigua**:
  `/give @p diamond_sword{display:{Name:'{"text":"Espada Pro"}'},Enchantments:[{id:"sharpness",lvl:5}]}`

* **Versión nueva**:
  `/give @p diamond_sword[display={name:'{"text":"Espada Pro"}'},enchantments={levels:{"minecraft:sharpness":5}}]`

---


## Declaración en Archivos

### A. Para Objetos (Items)
En las versiones actuales, se utiliza el componente `minecraft:set_components` dentro de tus `loot_tables` o `item_modifiers`:

```json
{
  "function": "minecraft:set_components",
  "components": {
    "minecraft:custom_name": "'{\"text\":\"Objeto Custom\"}'",
    "minecraft:max_stack_size": 1
  }
}