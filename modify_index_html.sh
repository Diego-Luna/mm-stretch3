#!/bin/bash

# Definir el carácter de nueva línea
LF=$(printf '\\\012_')
LF=${LF%_}

# Definir el contenido a insertar para la etiqueta <title> y el script de Google Analytics
GA_TAG="<title>MoonMakers</title>${LF}\
    <meta name=\"description\" content=\"MoonMakers Stretch3\" />${LF}\
${LF}\
    <!-- Global site tag (gtag.js) -->${LF}\
    <script>${LF}\
      window.dataLayer = window.dataLayer \|\| [];${LF}\
      function gtag(){dataLayer.push(arguments);}${LF}\
      gtag('js', new Date());${LF}\
${LF}\
      gtag('config', 'UA-105345-38');${LF}\
    </script>${LF}\
"

# Mover el archivo original
mv build/index.html build/index.html_orig

# Reemplazar la etiqueta <title> y agregar el script de Google Analytics
sed -e "s|<title>Scratch 3.0 GUI</title>|${GA_TAG}|g" build/index.html_orig > build/index.html

# Reemplazar el logo de Scratch con el logo personalizado usando una expresión regular
sed -i -e "s|<img id=\"logo_img\"[^>]*src=\"[^\"]*\"|<img id=\"logo_img\" alt=\"BlockCode\" class=\"menu-bar_scratch-logo_2uReV menu-bar_clickable_1g3uo\" draggable=\"false\" src=\"static/assets/BlockCode-logo.svg\"|g" build/index.html

# Mover el archivo logo.svg al directorio build/static/assets/
mv /stretch3/logo.svg build/static/assets/

# Reemplazar el ícono de la aplicación (favicon) en el archivo HTML
# Busca el enlace de favicon existente y reemplázalo con el nuevo logo
sed -i -e "s|<link rel=\"icon\"[^>]*href=\"[^\"]*\"|<link rel=\"icon\" href=\"static/assets/logo.svg\"|g" build/index.html

mv /stretch3/BlockCode-logo.svg build/static/assets/

pwd