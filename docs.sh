#!/bin/bash -e
git checkout master
echo ">>> Building Haddock"
stack haddock --no-haddock-deps --fast

doc_root=`stack path --local-doc-root`/Olifant-0.0.0.1/
git branch -D gh-pages || echo "gh-pages branch didn't exist"
git checkout --orphan gh-pages
cp -r $doc_root/* docs/
git add .
git commit -m "Automatic Haddock commit"
# time git push -f -u origin gh-pages
# git co master
