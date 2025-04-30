# D-rep


**D-rep** is a shell tool written in **D language**, inspired by the power of `grep`. It offers a streamlined and interactive way to search, navigate, and explore your file system directly from the terminal 📁.

With D-rep's integrated **command pipeline**, you can **search 👀, index**, and **act** on files or directories—all from a single, user-friendly interface 💯.



# 🚀 Why D-rep?

Traditional tools like `ls` and `cd` require precise inputs—you need to know the exact filename or path. But what if you only remember part of it?

That’s where **D-rep** shines. It allows you to:
- Search using patterns (like `"JSON*"`)
- View matching results
- Interactively choose files or directories
- Pipe results into other commands

---

## 🪈 Command Pipeline

The **command pipeline** is the heart of D-rep. It gives you a consistent and powerful approach to file navigation.

### 🔧 How it works:

1. **Specify a command** (e.g., `ls`, `cat`, or a custom action)
2. **Provide a search pattern** (e.g., `"JSON*"`)
3. **Pipe the results** into another command or view them in an interactive menu
4. **Select the file or directory** you were looking for without typing the full path

---

# 📌 Example

```sh
D-REP > ls "JSON*" | cd
```
Output:
```js
>   [D]  ~/Desktop/Computer_Science/JSON-parser
    [D]  ~/Desktop/JSON-files
    [F]  ~/Documents/user_JSON.json
```

In this example:

* `ls` `"JSON*"` searches the current directory for files/folders that match the pattern

* D-rep presents a list of matching results
 
* You choose the desired path
 
* The result is piped into cd and navigates to that directory


# 🎯 Motivation

Sometimes, you can't recall the exact directory name—but you remember a keyword or pattern. D-rep bridges that gap.

Instead of guessing or manually searching:

   1. Just enter a pattern

   2.  View the matches

   3.  Let D-rep help you get where you want to go—fast and efficiently

# ✅ Features

   * 🔍 Pattern-based file/directory search

   * 📋 Interactive selection menu

   * 🔗 Seamless command piping (`|`)

   * ⚡ Built for speed using D

   * 🧠 Smarter shell experience

# 🛠️ Future Plans

- [ ] Support for custom scripts

- [ ] File previews before selection

- [ ] Persistent session history

Give your terminal **superpowers** 🦸 with D-rep.
Say goodbye to guesswork—and hello to smooth file navigation.
