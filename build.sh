
echo "building exectuable... "

ldc2 -betterC ./src/cmd.d ./src/main.d ./src/query.d -of=bin/d-grep 

