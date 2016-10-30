# dang
For-fun R and SFW implementation of [nvbn/thefuck](https://github.com/nvbn/thefuck) using grizzly NSE.

Mistyped a command? No problem! Call `dang` with a single unnamed argument to rerun the last command with a _new_ function but the old arguments. 

```R
pritn("Hello world!")
# Error: could not find function "pritn"
dang(print)
# [1] "Hello world!"
```

Called a command with the wrong argument? No problem! Call `dang` with one or more named arguments to replace or inject them into the last command. 

```R
sample(letters, size = 5)
dang(size = 26, replace = TRUE)
```

Definitely this:

![GitHub Logo](https://i.imgflip.com/h0tte.jpg)
