#!/bin/sh -e
PACKAGE=${1:-"skipapp-hiya"}
AGAINST=${2:-"."}

TMPDIR=`mktemp -d`
cd ${TMPDIR}
${SKIPCMD:-skip} init --no-build --native-model --module-tests --appid=hiya.skip --version 1.0.0 ${PACKAGE} HiyaSkip HiyaSkipModel HiyaSkipLogic

cd -

# make sure that the repo exactly matches the template,
# allowing for changes in some files, as well as
# dependency versions
diff --ignore-space-change --exclude=README.md --exclude=.build --exclude=.git --exclude=scripts --exclude=.github --exclude=.DS_Store --exclude=.gitignore --exclude='*.png' --exclude=Package.resolved --exclude=Skip.env --exclude=CHANGELOG.md --exclude=project.xcworkspace -I 'url: "https://source.skip.tools/' -r ${TMPDIR}/${PACKAGE} ${AGAINST}

