LF=$(printf '\\\012_')
LF=${LF%_}
GA_TAG="<title>MoonMakers</title>${LF}\
    <meta name=\"description\" content=\"MoonMakers Stretch3\" />${LF}\
${LF}\
    <!-- Global site tag (gtag.js) - Google Analytics -->${LF}\
    <script>${LF}\
      window.dataLayer = window.dataLayer \|\| [];${LF}\
      function gtag(){dataLayer.push(arguments);}${LF}\
      gtag('js', new Date());${LF}\
${LF}\
      gtag('config', 'UA-105345-38');${LF}\
    </script>${LF}\
"
mv build/index.html build/index.html_orig
sed -e "s|<title>Scratch 3.0 GUI</title>|${GA_TAG}|g" build/index.html_orig > build/index.html