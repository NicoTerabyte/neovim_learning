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

with dd you delete the entire line

and with the w command in normal mode you go down one word at a time.

if you press the p command in normal mode if you have deleted something or you have yanked it you can paste it in nvim.
it's like ctrl+v

### Something i'm leanring regarding plugins
It seems that since we have lazy.nvim installed we just need to load in the specific area of the lua file, precisely where the setup of lazy vim starts the table to install the plugin that we need to have it in neovim

## The modes
The normal mode for example is the default one that nvim and vim uses to navigate around the text.
The visual mode works over normal mode it helps us selecting and manipulating multiple text with that you can use the yank command to copy for example and use the p that stands for put to paste

The insert mode as the name suggest is the one that we use to write/insert stuff as a text in the document

One of the most important things you can do in visual mode is to yank(copy) the selected lines entirely by just using the y command. You see when in visual mode you are able to highlight the text and if you press y you yank it or copy it 


## Basic commands
:q - quits from the current file if you didn't save it would tell you
:qa - quits all open windows
:w - writes the changes in the current file
:wa - // in all the files
:wq - writes the changes and then quits the file
:wqa - does the same as above and then quits

## search and normal commands
to search for stuff in neovim you must write / followed by the stuff you are searching
if you do instead the classic command setup with _:_ and you write a **!** after it you will be able to put a normal bash command and to execute it in neovim.
Instead if you need a terminal on the go to test stuff up you must write *::terminal** to open a terminal directly over nvim, to close it you must use the exit command

## autocompletion
If you write a command and meanwhile you press ctrl+d you will see all the possibilities you could write for it and with <tab> you will be able to see a vertical list that will show all the possibilities of any command that has the letter/s of the command in them.

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

local list = {"first, 2, false, function() print("fourth) end}

print("first index", list[1])



-- as a map
local t = {
    literal_key = "a string",
    ["an expression"] = "also works!"
}
```

going through a list
```lua
local list = { "one", "two"}

for index = 1, #list do
    print(index, list[index])
end

--indexing into the list
for index, value ipairs (favorite_accounts) do
    print(index, value)
end

-- going through a  map
--We can't do the same work for a map what we need to do
local reading_scores = {bro = 9.5, otherBro = "N/A"}
for key, value in pairs(reading_scores) do
    print(key, value)
end
```
We are heading to the control flow
```lua

local function action(loves_coffee)
    if loves_coffee then
        print("i love coffees")
    else
        print("i hate coffees")
    end
end

--fact: only nil and false are seen as false valuesx
```

Modules in lua are particular and most of the time it seems they are setted through maps
Modules are just files
```lua
--foo.lua
local M = {}
M.cool_function = function() end
return M


--bar.lua
--modules are just the result of whatever returns from a file
-- if they don't return it will rise an error
local foo = require('foo')
foo.cool_function()

```

In lua you can have different returns you can return more values and they should be stored altogheter.
The thing is that you can choose which value to save when calling the function in order.
If you don't save all the variables that gets returned the program will discard them
```lua
local returns_all = function()
    return 1, 2, 3, 4
end

-- the fourth value gets discarded
first, second, third = returns_all()

```


different returns
```lua
local variable_arguments = function(...)
    local arguments = {...}
    for i, v in iparis({...}) do print(i, v) end
    return unpack(arguments)
end
```


metamethods in lua are pretty interesting are practically you set up how tables should work in some specific cases like for example if i ever try to add two tables, what would i sum between them since they store different values?


they are defined as rules that lua sets when performing operations with the tables

- a metatables by itself is a table with metamethods
- there are different metamethods
- setmetatable it allows us to associate a a metatable with a table


common metamethods
```lua
local vector_mt = {}

vector_mt.__add = function (left, right)
    return setmetatable({
        left[1] + right[1],
        left[2] + right[2],
        left[3] + right[3]
        }, vector_mt)
end

-- function to create a new vector and to associate it
-- with the metatable

local function new_vector(x, y, z)
    return setmetatable({x, y, z}, vector_mt)
end

-- Test the vector addition
local v1 = new_vector(1, 2, 3)
local v2 = new_vector(4, 5, 6)
local v3 = v1 + v2  -- This will use __add metamethod
print(v3[1], v3[2], v3[3])  -- Output: 5 7 9
```

the big idea is that by creating a metatable you can use it's metamethods if you associate the tables with it thanks to setmetatable

some of the most interesting features that the metatables brings are the __index feature that makes you setup a default value for the maps

```lua
-- Example 2: Default values with __index
local defaults = {name = "Unknown", age = 0}
local person_mt = {__index = defaults}

local person = setmetatable({name = "Alice"}, person_mt)
print(person.name)  -- "Alice" (exists in table)
print(person.age)   -- 0 (comes from defaults via __index)
```


```lua
-- simple example of a keymapping in lua for vim
```

## How does it relate with vim?
You simply can do scripts in lua to make neovim plugins for example




# let's get back to kickstart neovim
The configuration of the file, it's where you have all the stuff related to your neovim.
Just fo example you can find there lazy vim that is the plugin manager and other stuff just right there.

it is written in lua and there different settings of keybinding and keymaps 



## lsp
language server protocol, in short neovim speaks a protocol for language servers and needs to know how to do that and how you can make it.
For example in the kickstart file there's an complete configuartion of some keymaps to tell what the action neovim need to do when those keymaps are pressed.
In the kickstart file you can find the use of the lsp for the telescope builtin created by a guy that helps to find stuff into the files.
like for example you have the possibility to find a reference of a word or something like that with the shortcut setted up by the lsp with grr keymaps but that's only related when you code of course:)
that will use the telescope builtin with the lsp configuration

Another thing, lsp works depending on the programming language so like the telescope shortucts with lsp will only work if you ave setted up the language properly
_coming soon_


Neovim not only needs to know how to make lsp works, but it needs to understand how they run as well.
This can be achieved with **capabilities**


# little tmux reference for my mental sanity
ctrl + b w (makes you see the windows that are actually active)
ctrl + b n (goes to the next window in order of which you have created)
ctrl + b p it makes go to the previous window 
ctrl + b x close the pannel
ctrl + b , rename current window 

## Important thing if you want to scroll the stuff written in the terminal
If you want to scroll the terminal output in tmux first of all you must enter in copy mode
you enter in copy mode if you do ctrl+b [

from there you can start to move up and down through the the terminal

To exit tmux copy mode you press the esc ke
