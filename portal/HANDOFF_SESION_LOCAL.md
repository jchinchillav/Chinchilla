# Handoff: sesión local de Claude Code (PC de Jorge)

**Fecha del handoff:** jueves 19 nov 2026 (semana 5 del plan) · **Viene de:** sesión en la nube (claude.ai/code) · **Rama:** `claude/chinchilla-tracking-portal-uhz6zp`

La sesión en la nube no podía abrir sitios de proveedores, marcas ni redes (el proxy los bloquea) ni usar el Chrome de Jorge. Esta sesión local sí puede, con internet directo y su Chrome con sesiones abiertas. **Tu trabajo:** mantener el portal, ejecutar la investigación real con Chrome y arrancar el sitio web y las campañas digitales.

---

## 1. Arranque (Jorge, en PowerShell)

```powershell
claude update
cd C:\Users\Jorge\Documents\Chinchilla
git fetch origin
git checkout claude/chinchilla-tracking-portal-uhz6zp
git pull
claude --chrome --remote-control
```

- **Chrome:** instalar la extensión *Claude in Chrome* (v1.0.36 o superior) desde la Chrome Web Store, con la misma cuenta de Claude. Dentro de la sesión, `/chrome` muestra el estado y permite dejarlo activado por defecto. Docs: https://code.claude.com/docs/en/chrome
- **Remote Control** (para seguirla desde el celular o la app): `--remote-control` (o `/rc` dentro de la sesión). La PC debe quedar encendida y `claude` corriendo. Docs: https://code.claude.com/docs/en/remote-control
- **Login:** con la cuenta de Claude (`/login`), no con API key. Sin eso no funcionan Chrome, artifacts ni Remote Control.
- `CLAUDE.md` en la raíz se carga solo y trae las reglas de trabajo.

### Primer mensaje para pegar en la sesión local

> Lee CLAUDE.md y portal/HANDOFF_SESION_LOCAL.md. Luego: (1) conecta el portal leyendo el artifact https://claude.ai/artifact/7Shy2iZKCehTQsCCqopb8T y confirma que coincide con portal/index.html; (2) con Chrome, solo lectura, ejecuta la investigación de la sección 6.1 y devuélveme una tabla con fuente por dato; (3) actualiza el portal con los datos reales y publícalo en el mismo URL. No compres, no envíes correos ni publiques nada sin mi aprobación. Dame acuse y hora estimada.

---

## 2. Control del portal

| Qué | Cómo |
|---|---|
| URL del portal (privado) | https://claude.ai/artifact/7Shy2iZKCehTQsCCqopb8T |
| Fuente | `portal/index.html` (archivo único, sin build) |
| Actualizar | Leer el artifact → editar `portal/index.html` → publicar con `url` = el link de arriba (o adjuntarlo con `/artifacts`). **Sin `url` se crea otro artifact.** Omitir `capabilities` para conservar la base de datos |
| Estado editable | Base de datos del artifact: `tasks`, `suppliers`, `investors`, `testers`, `budget`, `meta`. Si la sesión local no tiene la herramienta `ArtifactData` (la documentación local no la menciona), Jorge marca los estados en la página y tú solo cambias el código |
| Verificar | Abrir en Chrome: escritorio y celular (390 px), sin scroll horizontal y sin errores de consola. Probar escribiendo en un textarea que no pierda el foco |
| Git | Commit y push a la rama de arriba al cerrar cada entrega verificada. **No hacer merge del PR #1** |

Docs de artifacts: https://code.claude.com/docs/en/artifacts

### Pestañas del portal

Resumen · Plan 10 semanas · Proveedores · Logo 3D · Testers · Financieros · Inversionistas · Marketing · Marca y legal · Recursos.

---

## 3. Estado al 19 nov 2026

### Fechas que mandan (opción B, aprobada el 18 nov)

| Fecha | Hito |
|---|---|
| Jue 19 nov | Pedido lote test a Gabe + 5 controles S&S + transfers WeMust + (vie-sáb) plancha |
| Lun 23 nov | Roster de testers con talla |
| Mié 25 nov | Presentaciones de empaque del diseñador |
| **Jue 26 nov** | **GATE: panel ciego de suavidad** (Gabe vs Bella 3719 vs RF498 vs IND4000) |
| 1-2 dic | Llegan transfers; pruebas de aplicación y lavado |
| 3-4 dic | Aplicar logo a 31 piezas, QC, fotos |
| **Sáb 5 dic** | **Test Day** |
| Sáb 12 dic | Feedback ola 1 |
| **Dom 13 dic** | **Abrir ronda F&F** (equity máx. 15 %; ask CAD 32,000; recomendación SAFE con cap ≈ CAD 215,000 y 20 % de descuento) |
| Sáb 19 dic | Feedback ola 2 (3+ lavadas) |
| Antes del 31 dic | Solicitudes CIPO (las tasas suben el 1 ene 2027) |

### Producto (lote test)

- **Proveedor recomendado:** Gabe Clothing (Toronto, 100 % algodón orgánico). Mezcla y correo en `portal/production/05_*`. Jorge evaluaba el hoodie de **350 GSM fleece** (más caída) vs 450 GSM. **Confirmar con Chrome** composición, interior cepillado y colores (Pale Pink, Mint) en 350.
- **Controles (S&S Vancouver):** 1 Bella+Canvas 3719, 2 American Apparel **RF498** ReFlex (Bone, Sea Blue; etiqueta desprendible: candidato al piloto) y 2 IND4000 (Lavender, Blue Aqua).
- **Descartados:** Comfort Colors 1467 (ligera, etiqueta cosida, descontinuada en SanMar Canada); House of Blanks (sin pasteles).
- **Sin elastano** en ningún blank de entrega inmediata. El algodón-spandex que Jorge quiere va con fabricante (OEM) en el piloto.
- **Pendiente de Jorge:** ¿Test Day con 31 testers (quitar líneas b2-b3, ≈ CAD 2,290) o ampliar a 40-60?

### Logo 3D

Transfer de silicona. Proveedor: WeMust (Hamilton, ON, ≈ CAD 1.00/pieza, sin mínimo, 4-5 días hábiles); respaldo: Hyi Fashion. Plancha: Hotronix MAXX 16×20 (RB Digital, Richmond) o HTVRONT Auto 2 (Amazon.ca). Parámetros: 150-160 °C, 20-25 s, presión media-firme, despegue en frío. Arte a tamaño exacto y ficha en `portal/production/`.

### Empaque

Bolsa de **papel glassine** con solapa adhesiva + caja kraft con logo (blanco UV, gris o fucsia). Brief para el diseñador en `portal/packaging/`. Para el Test Day: caja lisa + sticker del isotipo. Proveedores: Better Packaging, WaxPapers.ca, Packhelp, Emenac. **Confirmar con Chrome** mínimos y precios en CAD.

### Marca y legal

- Registrar a nombre de Jorge (después ceder a la nueva BC Ltd). Kit listo en `portal/legal/cipo/`: palabra CHINCHILLA + isotipo, clases 25 y 35, CAD 1,280.20.
- Conflicto en Canadá: **TMA1129774** (silueta de roedor con corona, sin palabra; Toronto). Estrategia: presentar ahora y después pedir cancelación por no uso (art. 45). **No contactar al titular.** Evidencia pendiente B1-B9 en `07_EVIDENCIA_NO_USO_*`.
- EE. UU.: CHINCHILLA serie 98231447 (sastre de Nueva York, suspendida). Vía primaria: coexistencia con abogado de EE. UU.
- NDA estándar: `portal/legal/NCNDA-Chinchilla.*`.

### Finanzas

Tope aprobado de la fase de muestras: CAD 13,000. El presupuesto actual del portal es ≈ CAD 18,400 con 10 % de contingencia (lote Gabe a precio de lista, línea b1 = 2,815). **Decisiones de Jorge:** precio de mayoreo de Gabe, líneas b2-b3, plancha MAXX vs HTVRONT.

### Seguimiento en la nube que sigue activo

La sesión en la nube tiene programada una revisión de Gmail (pedidos de Gabe, S&S, WeMust y plancha) para hoy 19 nov a las 11:05 de Vancouver. Si esta sesión local toma el control, Jorge puede ignorarla.

---

## 4. Lo que falta del plan (tareas abiertas clave)

| ID | Tarea | Semana |
|---|---|---|
| A4/A8 | Comprar controles S&S y lote Gabe | 5 |
| B3/B4 | Transfers WeMust + plancha | 5 |
| D2 | Presentar CIPO | 5 |
| C1/C2 | Roster de testers + Google Form de feedback | 5-6 |
| A5/A7 | Panel ciego + gate | 6 |
| D3 | Constituir BC Ltd nueva + cuenta bancaria | 5-6 |
| D4 | Dominio, redes y landing "coming soon" | **vencida (sem 3)** |
| E3/E4 | Estructura de la ronda con abogado; deck con datos | 5-8 |

---

## 5. Nuevos frentes: sitio web y campañas digitales

### 5.1 Sitio web

- **Repositorio:** **no** usar la raíz de este repo (ahí vive un juego de trivia en GitHub Pages). Crear un repo o una tienda aparte.
- **Plataforma recomendada: Shopify Basic**. El presupuesto (línea b15) ya lo asume, y trae lista de espera, preventa con pago y checkout en CAD sin desarrollo. Alternativa: landing estática (Carrd o Framer) solo para lista de espera, más barata pero sin preventa. **Presentar la comparación a Jorge con precios reales verificados antes de abrir cuentas.**
- **Dominio:** Jorge usa correo en `mychinchilla.ca`. Verificar en Chrome quién lo hospeda (DNS) antes de apuntarlo a la tienda, sin romper el correo (MX). El deck menciona `chinchilla.store`: confirmar con Jorge cuál es el principal.
- **Fase 1 (antes del Test Day): "coming soon"** con hero (foto o textura + isotipo), promesa de suavidad, captura de email ("tócalo primero") y aviso de privacidad (consentimiento CASL para correos en Canadá).
- **Fase 2 (antes del 13 dic):** página de preventa del piloto (edición numerada 1-500, sin descuento) y resultados del Test Day.
- **Activos:** `portal/brand/` (logos), paleta Mountain Bluebird #5DADEC, Graphite Ink #1D1D1F, Cloud White #F8F7F4, Purple Hebe #7D5BA6; rosa del diseñador #E5C0C7 / #D7BBC6.

### 5.2 Campañas digitales (Instagram, Facebook, TikTok)

- El plan del teaser (pestaña Marketing: `TEASER`, `CALENDAR`, `SOCIAL`) tiene fechas de fases que **ya pasaron sin ejecutarse** (fase 1, 9-22 nov). **Hay que reprogramarlo** contra el Test Day del 5 dic: revelación la semana del 30 nov, cobertura del Test Day, datos y anuncio de la ronda/preventa el 13 dic.
- **Cuentas:** verificar en Chrome la disponibilidad de handles (@mychinchilla, @chinchilla.ca, etc.) en Instagram, TikTok y Facebook, y proponer uno consistente. **Crear las cuentas solo con aprobación de Jorge.**
- **Meta Business:** crear un **portafolio de negocio separado para Chinchilla**, sin colgarlo de portafolios existentes de otras empresas de Jorge. Así una restricción en otra cuenta no afecta la marca. Confirmar con Jorge antes de crear.
- **Pauta inicial:** prueba de 2 creativos × CAD 75 en Meta hacia la landing; medir el costo por email (ya está en el plan, tarea t15).
- **Contenido:** macros de tela, manos tocando, el logo 3D sin revelar del todo, proceso de plancha y lavado, reacciones de testers (con consentimiento firmado, contrato c3).

---

## 6. Primeras tareas para la sesión local (en este orden)

### 6.1 Investigación con Chrome (solo lectura, ~1 h)

Una tabla por punto, con link y fecha de consulta:

1. **S&S Canada** (con la cuenta de Jorge, si ya la abrió): precio de mayoreo y stock en Vancouver de Bella 3719, RF498 (Bone, Sea Blue), IND4000 (Lavender, Blue Aqua) e IND20PNT. **Identificar el jogger ReFlex a juego del RF498** (RF491 aparece como hoodie con cierre: confirmar).
2. **Gabe Clothing:** hoodies de 350 y 450 GSM (composición, interior cepillado o rizo, colores, precio); jogger Getaway y Park Sweatpants; términos de mayoreo.
3. **WeMust:** precio, plazo, colores y límites del 3D Silicone Badge; política de privacidad sobre diseños de clientes.
4. **Plancha:** stock y precio hoy de Hotronix MAXX en RB Digital / Stahls Canada y de HTVRONT Auto 2 en Amazon.ca.
5. **Empaque:** Better Packaging (glassine para ropa, MOQ con logo, envío a Canadá), WaxPapers.ca, configurador de Packhelp (caja kraft 12×10×4 in con blanco, 30 y 500 piezas).
6. **CIPO:** estado actual de TMA1129774 (sin interactuar con el titular) y de cualquier solicitud nueva "CHINCHILLA".

### 6.2 Actualizar el portal

Con lo anterior: precios reales en Proveedores y Financieros, quitar marcas de "no verificado", reprogramar el teaser y agregar a Marketing una tarjeta "Sitio web" con la decisión de plataforma pendiente.

### 6.3 Propuesta del sitio y redes (para aprobación)

Memo de una página: plataforma, dominio, estructura de la página "coming soon", handles disponibles, calendario de contenido del 23 nov al 13 dic y presupuesto. **Nada se crea sin el visto bueno de Jorge.**
