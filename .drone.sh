# Go to project > Repository and set the branch filter
# Then click on "View Key" and paste it on github
dart --version
pub get

echo "\n> Ensure that the code is warning free"
dartanalyzer lib/multi_reg_exp.dart
dartanalyzer test/test.dart

echo "\n> Run tests"
dart --enable-type-checks --enable-asserts test/test.dart

#echo "> Run build"
#pub build

echo "\n> Generate docs"
dartdoc lib/multi_reg_exp.dart --package-root=packages

echo "\n> Copy docs up to github gh-pages branch"
mv docs docs-tmp
git checkout gh-pages
rm -Rf docs
mv docs-tmp docs
date > date.txt
git add -A
git commit -m"auto commit from drone.io"
git remote set-url origin git@github.com:christophehurpeau/dart-multi_reg_exp.git
git push origin gh-pages

