
echo "building exectuable... "

echo "cache cmd 'find ~/ -path '*/.git' -prune -o -print > cache.txt'"
ldc2 -w -vgc -betterC ./src/cmd.d ./src/main.d ./src/query.d -of=bin/d-grep 

