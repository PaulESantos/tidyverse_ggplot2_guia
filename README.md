# Guia de ggplot2 con Quarto

Este repositorio contiene una guia en Quarto sobre `ggplot2`, preparada para renderizarse como sitio web estatico y publicarse en GitHub Pages.

## Estructura

- `guia_proceso_ggplot2.qmd`: documento principal.
- `index.qmd`: portada del sitio.
- `_quarto.yml`: configuracion del proyecto Quarto.
- `pdf/`: materiales PDF enlazados desde la guia.
- `.github/workflows/publish-pages.yml`: pipeline de GitHub Actions para renderizar y desplegar.

## Publicacion en GitHub Pages

El workflow hace lo siguiente en cada push a `main`:

1. Instala R y las dependencias usadas por la guia.
2. Instala Quarto.
3. Ejecuta `quarto render`.
4. Publica `_site/` en GitHub Pages.

Importante:

- `_site/` no se versiona en git.
- `site_libs/` tampoco se versiona.
- Por tanto, este proyecto no debe publicarse desde `main`, `gh-pages` ni `docs/` como carpeta estatica del repositorio.
- La publicacion correcta es `Settings > Pages > Build and deployment > Source = GitHub Actions`.

## Pasos para activarlo

1. Crea un repositorio vacio en GitHub.
2. Desde este directorio, inicializa y conecta el remoto:

```powershell
git init -b main
git remote add origin https://github.com/USUARIO/REPOSITORIO.git
git add .
git commit -m "Configura sitio Quarto para GitHub Pages"
git push -u origin main
```

3. En GitHub, abre `Settings > Pages`.
4. En `Build and deployment`, selecciona `GitHub Actions` si GitHub no lo detecta automaticamente.
5. Espera a que termine el workflow `Publish Quarto Site to GitHub Pages`.

El sitio quedara publicado en una URL del tipo:

- `https://USUARIO.github.io/REPOSITORIO/`

## Sincronizacion entre contenido local y sitio publicado

El flujo correcto es este:

1. Editar `index.qmd`, `guia_proceso_ggplot2.qmd`, estilos o recursos.
2. Ejecutar `quarto render` para validar el resultado local.
3. Hacer `git add`, `git commit` y `git push` a `main`.
4. Dejar que GitHub Actions reconstruya `_site/` y despliegue la nueva version.

Si el repositorio ya tiene los cambios en `main` pero la web sigue mostrando una version anterior, el problema no suele estar en el contenido sino en la configuracion o ejecucion del despliegue.

## Resolucion de problemas de despliegue

### Caso 1. El sitio web no refleja lo que ya esta en `main`

Verifica en este orden:

1. `Settings > Pages > Build and deployment`
   Debe estar configurado en `GitHub Actions`.
2. `Actions > Publish Quarto Site to GitHub Pages`
   El ultimo workflow del branch `main` debe terminar con `build` y `deploy` en verde.
3. `Settings > Actions > General`
   El repositorio debe permitir ejecutar workflows.
4. `Settings > Environments > github-pages`
   El entorno no debe estar bloqueado por aprobaciones pendientes.

### Caso 2. El push llego a GitHub pero no arranco una publicacion nueva

Lanza nuevamente el workflow desde la pestana `Actions` con `Run workflow`.

Si prefieres forzar un nuevo despliegue desde git:

```powershell
git commit --allow-empty -m "trigger pages deploy"
git push
```

### Caso 3. Pages esta publicado desde una rama o carpeta

Eso produce desincronizacion con este proyecto, porque `_site/` esta en `.gitignore` y se genera solo durante el workflow.

Accion correctiva:

1. Ir a `Settings > Pages`.
2. Cambiar la fuente de publicacion a `GitHub Actions`.
3. Ejecutar de nuevo el workflow de despliegue.

### Caso 4. El workflow falla durante el render

Revisa el log de `build` en GitHub Actions. Este proyecto necesita al menos las dependencias declaradas en `.github/workflows/publish-pages.yml`:

- `tidyverse`
- `patchwork`
- `scales`
- `ggridges`
- `knitr`
- `svglite`

Si el render local funciona pero GitHub falla, compara el error del log con tu entorno local y ajusta dependencias o recursos faltantes.

### Caso 5. El workflow termino bien pero la URL sigue mostrando una version vieja

Revisa:

1. Que estes abriendo la URL correcta del repositorio:
   `https://USUARIO.github.io/REPOSITORIO/`
2. Que no exista un dominio personalizado apuntando a otro despliegue.
3. Cache del navegador.
   Haz una recarga forzada con `Ctrl + F5`.

## Desarrollo local

Para vista previa local:

```powershell
quarto preview
```

Para generar el sitio sin servidor:

```powershell
quarto render
```
