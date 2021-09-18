npm run build

LOGSTRING=$(git log)
COMMIT=$(echo $LOGSTRING | awk '{print $2}')

cd dist

git init
git add -A
git commit -m "Deployment (commit: $COMMIT)"
git push -f https://github.com/pos03142ap/Spacestagram.git master:gh-pages

cd ..

