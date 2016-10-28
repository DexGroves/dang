# dang
R and SFW implementation of [nvbn/thefuck](https://github.com/nvbn/thefuck).

Mistyped a command? No problem! Rerun the last command with a _new_ function but keep the old arguments. 
No more keyboard warrioring to edit a borked function name!

```R
pritn("Hello world!")
# Error: could not find function "pritn"
dang(print)
# [1] "Hello world!"
```

Definitely this:

![GitHub Logo](https://i.imgflip.com/h0tte.jpg)
