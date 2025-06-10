
-- Method definition with explicit 'self' parameter
local person = {
	name = "Alice",
	greet = function(self, message)
		print(self.name .. " says: " .. message)
	end
}

-- These two calls are identical:
person.greet(person, "Hello!")  -- Explicit self
person:greet("Hello!")          -- Syntactic sugar - auto-passes person as first argument

-- The colon (:) is just shorthand that automatically passes the table as the first parameter

-- Example with metatables and 'self'
local animal_mt = {}

function animal_mt:speak()  -- This is shorthand for animal_mt.speak = function(self)
	print(self.name .. " makes a sound: " .. self.sound)
end

function animal_mt:set_name(name)
	self.name = name  -- 'self' refers to the specific instance
end

animal_mt.__index = animal_mt  -- Enable method inheritance

local function new_animal(name, sound)
	return setmetatable({name = name, sound = sound}, animal_mt)
end

-- Usage
local dog = new_animal("Rex", "Woof!")
local cat = new_animal("Whiskers", "Meow!")

dog:speak()      -- Rex makes a sound: Woof!
cat:speak()      -- Whiskers makes a sound: Meow!
dog:set_name("Buddy")
dog:speak()      -- Buddy makes a sound: Woof!

-- ...existing code...

-- strange example that uses recursion the recursion is triggered
-- by the metamethod itself because of index that triggers every time the
-- map has not a value in the index
local fib_mt = {
	__index = function(self, key)
		if key < 2 then return 1 end
		-- update the table, to save the intermediate results
		self[key] = self[key - 2] + self[key - 1]
		return self[key]
	end
}

local fib = setmetatable({}, fib_mt)
print(fib[5])
