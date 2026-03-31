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

## Desarrollo local

Para vista previa local:

```powershell
quarto preview
```

Para generar el sitio sin servidor:

```powershell
quarto render
```
