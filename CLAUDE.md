# CLAUDE.md — Proyecto Chinchilla (lanzamiento de marca)

> Este repositorio tiene dos proyectos. **Chinchilla** vive en `portal/` y es el que se trabaja aquí. La raíz (`index.html`, `README.md`, `supabase/`, `.github/`) es un juego de trivia ajeno publicado en GitHub Pages: **no tocar** salvo instrucción explícita.

Antes de hacer cualquier cosa, lee `portal/HANDOFF_SESION_LOCAL.md` (estado completo, fechas, decisiones abiertas y siguientes pasos).

## Quién y qué

- **Jorge Chinchilla**, fundador. Marca de ropa *soft athleisure* "Chinchilla" (Vancouver / North Vancouver, BC). Su empresa principal es de trading de madera, así que su tiempo en Chinchilla es limitado.
- Objetivo actual: **Test Day el sábado 5 dic 2026** (31 piezas a testers) y **ronda F&F el 13 dic 2026** (equity, dilución máx. 15 %).

## Reglas de trabajo con Jorge (obligatorias)

1. **Español**, tono profesional y directo, sin relleno ni condescendencia.
2. **Tablas comparativas** para decidir; memo de una página para temas complejos.
3. **Cada dato con fuente y link.** Lo no verificado se marca como estimado. Nunca inventes precios, stock ni plazos.
4. **Si algo es ambiguo, pregunta antes de ejecutar.** Si hay varias vías, da una recomendación más alternativas; si hay una sola, sé definitivo.
5. **Verifica antes de entregar:** prueba el portal en el navegador, en escritorio y en celular (390 px, sin scroll horizontal), con 0 errores de consola.
6. **Filtro de ROI:** en tareas grandes, cuestiona si ahorran más tiempo del que cuestan; si no, propón el "Parking Lot".
7. **Acuse + hora estimada** al recibir una tarea larga, y actualización a esa hora.
8. **Nunca comprar, pagar, enviar correos, publicar en redes ni contactar a terceros** sin aprobación explícita de Jorge en ese momento. Con Chrome: solo leer e investigar.
9. **Confidencialidad de marca:** no contactar ni dejar rastro en las cuentas del titular de TMA1129774 (ver `portal/legal/cipo/06_*`). No subir diseños a proveedores sin la cláusula de `portal/production/03_*`.
10. **Privacidad:** no escribir correos personales, teléfonos, números de cuenta ni IDs de Meta en archivos del repo.

## Portal de seguimiento ("Chinchilla Launch Room")

- Archivo único: `portal/index.html`. JS sin framework y sin build.
- Publicado como Artifact (privado): **https://claude.ai/artifact/7Shy2iZKCehTQsCCqopb8T**
  - Para actualizarlo desde esta sesión: **lee primero** el artifact (`Artifact` action `read` con ese `url`), compáralo con `portal/index.html`, y publica con `url` = ese link para **conservar el mismo URL**. Sin `url` se crea otro artifact.
  - Capacidad `db` declarada (reglas: lectura `interact`, escritura `admin`). No la cambies; al republicar, omite `capabilities` para conservarla.
  - El estado editable (checkboxes, notas, testers, inversionistas, presupuesto) vive en la **base de datos del artifact**, colecciones `tasks`, `suppliers`, `investors`, `testers`, `budget` y `meta`. Si falla, el respaldo es `localStorage` con la clave `chinchilla-launch-room-v1`. Para escribir estados usa `ArtifactData` (batch, con `if_version` si el documento existe).
- Datos estáticos en constantes JS: `TASKS`, `SUPPLIERS`, `BUDGET`, `PALETTE`, `TEASER`, `CALENDAR`, `SOCIAL`, `TM_STEPS`, `CONTRACTS`, `QUESTIONS`. Ancla del plan: `const START = new Date(2026, 9, 19)` (semana 1 = 19 oct 2026; 10 semanas).
- Reglas técnicas aprendidas:
  - **Imágenes como data URI** (la CSP del artifact bloquea imágenes externas).
  - Los textareas guardan con `Store.set(c, id, patch, {render:false})`: no re-renderices mientras el usuario escribe.
  - Mantén `.main{min-width:0}` y `.shell>*{min-width:0}` (evitan el scroll horizontal en celular).
  - Los links a documentos apuntan a GitHub, rama `claude/chinchilla-tracking-portal-uhz6zp`.

## Git

- Rama de trabajo: `claude/chinchilla-tracking-portal-uhz6zp` (PR #1 abierto, en pausa por decisión de Jorge: **no hacer merge**).
- Commit y push solo cuando Jorge lo pida o al cerrar una entrega verificada. Mensajes en inglés, cortos.

## Archivos clave

| Ruta | Qué es |
|---|---|
| `portal/HANDOFF_SESION_LOCAL.md` | Estado completo y siguientes pasos (léelo primero) |
| `portal/brand/` | Logo final (vertical, horizontal, isotipo, wordmark; positivo/negativo; SVG, PDF, PNG 4000 px) |
| `portal/production/05_*` | Pedido del lote test (Gabe Clothing) y piezas de control |
| `portal/production/02_*`, `03_*`, `04_*` | Logo 3D de silicona: compras, confidencialidad, ficha técnica y arte a tamaño exacto |
| `portal/packaging/` | Brief de empaque para el diseñador, proveedores y alternativas reciclables |
| `portal/legal/cipo/` | Kit de registro de marca en CIPO, análisis del conflicto, evidencia de no uso |
| `portal/legal/NCNDA-Chinchilla.*` | NDA y no elusión estándar |
| `portal/research/` | Investigación de proveedores, logo 3D, México y planchas, registro de marca |
| `portal/outreach/rfq-emails.md` | Correos RFQ |
