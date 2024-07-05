LF=$(printf '\\\012_')
LF=${LF%_}
GA_TAG="<title>MoonMakers</title>${LF}\
    <meta name=\"description\" content=\"MoonMakers\" />${LF}\
"
mv build/index.html build/index.html_orig
sed -e "s|<title>Scratch 3.0 GUI</title>|${GA_TAG}|g" build/index.html_orig > build/index.html
