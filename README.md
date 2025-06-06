# neovim learning
A repository to take notes and learn neovim (i know it will take a lot but it is worth it as Vincent said)

## Vim motions and commands:
We move with the hkjl keys we go faster with the wb keys
We can even use in the "esc" mode we may say the bindings with numbers to even go faster
Like for example seeing that w and b keys move from word to word if we were to do 3w we would move 3 words ahead
k -> up
j -> down
l -> right
h -> left

if use the dw command in normal mode you are able to remove some words by going with the cursor at the beginning of one of them and press the *dw* command to delete the word


## The modes
The normal mode for example is the default one that nvim and vim uses to navigate around the text. 
The visual mode works over normal mode it helps us selecting and manipulating multiple text
The insert mode as the name suggest is the one that we use to write/insert stuff as a text in the document

## Basic commands
:q - quits from the current file if you didn't save it would tell you
:qa - quits all open windows
:w - writes the changes in the current file
:wa - // in all the files
:wq - writes the changes and then quits the file
:wqa - does the same as above and then quits

## buffer

#### little trivia
**vincent** _god bless him_ said that "to have always a look at the tmux bindings press c+b ? Daje
### testing out stuff with nvim


# Lua the best bro of neovim
- I say it's it's best bro because it helps making configurations and scripts to make the neovim experience more customized and enjoyable
- it will be included in this readme because it's a must to learn lua as well

```lua
local number = 5

local string = "hello world"
local single = 'hello world'
local crazy = [[this is a multiline literal]]
local truth, lies = true, false
local nothing = nil

```

this is the basic lua language variable decalration:

How to declare functions and use them with lua
be aware that functions can be values as well in lua language
```lua
local function hello(name)
    print("hello", name)
end

-- this is a comment function as a value

local greet = function(name)
    print("hey", name) 
end

```

lua's only data structure are the tables and they can be used as lists like in the other languages with *indexes* and all.

```lua
--as a list

local list = {"first}, 2, false, function() print("fourth) end}

print("first index", list[1])



-- as a map
local t = {
    literal_key = "a string"
    ["an expression] = "also works!"
}
```
