# Datapack: [Nombre de tu Proyecto]

Guía de estructura y configuración para el desarrollo del datapack.

## 📂 Estructura de Datos (`data/`)

*   **`minecraft/`**: Archivos que sobrescriben el código original del juego.
*   **`[namespace]/`**: Contenido principal y lógica propia del datapack.
    *   **`functions/`**: Funciones del proyecto organizadas por lógica.
    *   **`predicates/`**: Condiciones y filtros para ítems.
    *   **`tags/`**: Listas de objetos para mantener el código limpio.
    *   **`loot_tables/`**: Tablas de drops de enemigos.

## 🛠️ Organización Modular (Arquitectura)
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

## ⚙️ Herramientas y Recursos

### VS Code
* **[Datapack Helper Plus by Spyglass](https://spyglassmc.com/user/config)**: Extensión esencial para autocompletado, validación de sintaxis y detección de errores.

### Generadores y Utilidades
* **[Misode](https://misode.github.io/)**: El generador más completo para archivos `.json` (loot tables, predicados, estructuras).
* **[McStacker](https://mcstacker.net/)**: Generador de comandos (`/summon`, `/particle`, `/give`) con interfaz visual.
* **[Blockbench](https://www.blockbench.net/)**: Herramienta para modelado, texturizado y animación de entidades custom.

### Documentación y Referencia
* **[Minecraft Wiki (Commands)](https://minecraft.wiki/w/Commands)**: Documentación oficial para consultar sintaxis detallada.
* **[Minecraft Wiki (Datapacks)](https://minecraft.wiki/w/Data_pack)**: Guía de referencia técnica sobre la estructura y funcionamiento de los datapacks.
