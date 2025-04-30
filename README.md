# D-rep

A shell, written in D lang, that is centered around the command line tool **grep**. D-rep offers a better user experience from your terminal to search and move around your file system 📁.

Through D-rep's integrated command pipeline it can search 👀 and index to given file or directories all within the hands of the user 💯

# Command Pipeline 🪈

The command pipeline is the central idea behind D-rep and offers a concise and consistent approach to your file navigation.

1. speficy a command that you wish to use 
> ☝️ built in commands like `ls` or `cd` don't have the ability to 🔎 search for a file or directory it needs the **exact** input. Through grep and D-reps command pipeline we can fix this by searching the file system given the pattern and offer a friendly interface to choose from the given options. Furthermore, you can pipe the output into other commands!.

2. enter a **pattern** or **query** you want to search for in your directory.

3. finally, you can choose to output the command and query to another command or simply **scroll** through the options.

## Example

``` sh
D-REP > ls "JSON*" | cd

D-REP >
>   [D]  ~/Desktop/Computer_Science/JSON-parser
    [D]  ~/Desktop/JSON-files
    [F]  ~/Documents/user_JSON.json
```
- You can see here the command `ls` is given a pattern which means it wants to search our current directory for any file or folders that match `JSON*`

- first commans will then `ls` all of the file paths of that match and then given the user to choose which option they want.

- Depending on the option if its a `file` or `directory` the output can be piped into the `cd` command which will change the given directory

> Overall, you can see that the motivation was, we could not remember which directory to `cd` into because we only remembered a certain pattern. Therefore, we use D-rep to list all possibly matches that I given to then choose from.