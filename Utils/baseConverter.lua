--[[ All credits go to lua-users user The Doctor for the function @http://lua-users.org/lists/lua-l/2004-09/msg00054.html
    And @https://[Log in to view URL] for the explanation and showcase
]]
    local baseCharacters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" -- Base 62 -- Did you know that all capital letter unicode characters are 2 bytes while lowercases starting after c are 3? micro-optimization. Unfortunately this is all ascii.
    local baseLength = #baseCharacters

	local floor = math.floor
	local abs = math.abs
	local sub = string.sub -- In luau this shouldn't be any more efficient, but I rather type sub than string.sub
    function baseEncode(x, base) -- (x : number base : number) -> string
		assert(base, "Argument 2 missing or nil")
		assert(not (base > baseLength or base < 2), "Base not in range of 2 - " .. baseLength)
		-- add assert for decimals?
		
		local returnString = ""

		local negative = x < 0
		if negative then
			x = abs(x)
		end

        local i = 0
        local remainder
        while x ~= 0 do
            i = i + 1 -- Compound this is luau
			x, remainder = floor(x / base), x % base + 1
            -- remainder = x % base + 1
            -- x = math.floor(x / base)
            returnString = sub(baseCharacters, remainder, remainder) .. returnString
        end
        return (negative and "-" or "") .. returnString
    end

	local find = string.find -- should I hash the string in a table?
	-- decodes to decimal, recode it yourself if you want to. I didn't add decode to base since it would just end up referencing the encode func.
    function baseDecode(s, encodedBase) -- (s : string, encodedBase : number) -> number
		if encodedBase <= 36 then
			s = s:upper()
		end

		local positive = true
		if sub(s, 1, 1) == "-" then
			positive = false
			s = sub(s, 2, -1)
		end

		local returnNumber = 0
		local length = #s

		for i = 1, length do -- wouldn't a while loop be faster? -- I think #s is only evalulated once, definately in luau
			local currentCharacter = sub(s, i, i) -- cache the position in a table? doesn't seem worth it with how short these strings can be.
			
			local characterValue = (find(baseCharacters, currentCharacter) - 1) * encodedBase ^ (length - i)
			returnNumber = returnNumber + characterValue
		end
		return positive and returnNumber or -returnNumber
    end

	function convertBase(s, encodedBase, newBase) -- (s : string, encodedBase : number, newBase : number)
		return baseEncode(baseDecode(s, encodedBase), newBase)
	end
