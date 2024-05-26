-- incocknito from voltra
if not getgenv().MoreUNC then
 oldprint = print
 oldwarn = warn
 olderror = error
 getgenv().print = function() end
--[[ hello very cool incognito / solara (mostly incognito because solara has most of these functions, just not all) script showcase!! 
pls dont steal source code :( 
also join https://discord.gg/gYhqMRBeZV because yes    
]]
--[[
 math support update because math is kewl
 new update:
 table loop update!!
]]

local HttpService = game:GetService('HttpService');

local oldLoader = loadstring
local patterns = {
    { pattern = '(%w+)%s*%+=%s*(%w+)', format = "%s = %s + %s" },
    { pattern = '(%w+)%s*%-=%s*(%w+)', format = "%s = %s - %s" },
    { pattern = '(%w+)%s*%*=%s*(%w+)', format = "%s = %s * %s" },
    { pattern = '(%w+)%s*/=%s*(%w+)', format = "%s = %s / %s" }
}
local patterns2 = {
 { pattern = 'for%s+(%w+)%s*,%s*(%w+)%s*in%s*(%w+)%s*do', format = "for %s, %s in pairs(%s) do" }
}
local function ToPairsLoop(code)
    for _, p in ipairs(patterns2) do
        code = code:gsub(p.pattern, function(var1, var2, tbl)
            return p.format:format(var1, var2, tbl)
        end)
    end
    return code
end
local function toluau(code)
    for _, p in ipairs(patterns) do
        code = code:gsub(p.pattern, function(var, value)
            return p.format:format(var, var, value)
        end)
    end
    code = ToPairsLoop(code)
    return code
end


getgenv().bit = getgenv().bit or table.clone(bit32)
local clonerefs = {}
local protecteduis = {}
local renv = {
    print, warn, error, assert, collectgarbage, load, require, select, tonumber, tostring, type, xpcall, pairs, next, ipairs,
    newproxy, rawequal, rawget, rawset, rawlen, setmetatable, PluginManager,
    coroutine.create, coroutine.resume, coroutine.running, coroutine.status, coroutine.wrap, coroutine.yield,
    bit32.arshift, bit32.band, bit32.bnot, bit32.bor, bit32.btest, bit32.extract, bit32.lshift, bit32.replace, bit32.rshift, bit32.xor,
    math.abs, math.acos, math.asin, math.atan, math.atan2, math.ceil, math.cos, math.cosh, math.deg, math.exp, math.floor, math.fmod, math.frexp, math.ldexp, math.log, math.log10, math.max, math.min, math.modf, math.pow, math.rad, math.random, math.randomseed, math.sin, math.sinh, math.sqrt, math.tan, math.tanh,
    string.byte, string.char, string.dump, string.find, string.format, string.gmatch, string.gsub, string.len, string.lower, string.match, string.pack, string.packsize, string.rep, string.reverse, string.sub, string.unpack, string.upper,
    table.concat, table.insert, table.pack, table.remove, table.sort, table.unpack,
    utf8.char, utf8.charpattern, utf8.codepoint, utf8.codes, utf8.len, utf8.nfdnormalize, utf8.nfcnormalize,
    os.clock, os.date, os.difftime, os.time,
    delay, elapsedTime, require, spawn, tick, time, typeof, UserSettings, version, wait,
    task.defer, task.delay, task.spawn, task.wait,
    debug.traceback, debug.profilebegin, debug.profileend
}


function ToEnum(a)
 for i, v in pairs(Enum.KeyCode:GetEnumItems()) do if tostring(v) == a then return v end end
end
local Instances = {}

local renderObjs={"Part","MeshPart","UnionOperation","WedgePart","CornerWedgePart","TrussPart","Model","Decal","Texture","SurfaceGui","BillboardGui","TextLabel","TextButton","ImageLabel","ImageButton","ViewportFrame","ParticleEmitter","Beam","Trail","Fire","Smoke","Sparkles","Light","SpotLight","PointLight","SurfaceLight",'Image','EditableImage', 'Text', 'Square', 'Circle', 'Triangle', 'Line'}

local keys={[0x08]=Enum.KeyCode.Backspace,[0x09]=Enum.KeyCode.Tab,[0x0C]=Enum.KeyCode.Clear,[0x0D]=Enum.KeyCode.Return,[0x10]=Enum.KeyCode.LeftShift,[0x11]=Enum.KeyCode.LeftControl,[0x12]=Enum.KeyCode.LeftAlt,[0x13]=Enum.KeyCode.Pause,[0x14]=Enum.KeyCode.CapsLock,[0x1B]=Enum.KeyCode.Escape,[0x20]=Enum.KeyCode.Space,[0x21]=Enum.KeyCode.PageUp,[0x22]=Enum.KeyCode.PageDown,[0x23]=Enum.KeyCode.End,[0x24]=Enum.KeyCode.Home,[0x2D]=Enum.KeyCode.Insert,[0x2E]=Enum.KeyCode.Delete,[0x30]=Enum.KeyCode.Zero,[0x31]=Enum.KeyCode.One,[0x32]=Enum.KeyCode.Two,[0x33]=Enum.KeyCode.Three,[0x34]=Enum.KeyCode.Four,[0x35]=Enum.KeyCode.Five,[0x36]=Enum.KeyCode.Six,[0x37]=Enum.KeyCode.Seven,[0x38]=Enum.KeyCode.Eight,[0x39]=Enum.KeyCode.Nine,[0x41]=Enum.KeyCode.A,[0x42]=Enum.KeyCode.B,[0x43]=Enum.KeyCode.C,[0x44]=Enum.KeyCode.D,[0x45]=Enum.KeyCode.E,[0x46]=Enum.KeyCode.F,[0x47]=Enum.KeyCode.G,[0x48]=Enum.KeyCode.H,[0x49]=Enum.KeyCode.I,[0x4A]=Enum.KeyCode.J,[0x4B]=Enum.KeyCode.K,[0x4C]=Enum.KeyCode.L,[0x4D]=Enum.KeyCode.M,[0x4E]=Enum.KeyCode.N,[0x4F]=Enum.KeyCode.O,[0x50]=Enum.KeyCode.P,[0x51]=Enum.KeyCode.Q,[0x52]=Enum.KeyCode.R,[0x53]=Enum.KeyCode.S,[0x54]=Enum.KeyCode.T,[0x55]=Enum.KeyCode.U,[0x56]=Enum.KeyCode.V,[0x57]=Enum.KeyCode.W,[0x58]=Enum.KeyCode.X,[0x59]=Enum.KeyCode.Y,[0x5A]=Enum.KeyCode.Z,[0x5D]=Enum.KeyCode.Menu,[0x60]=Enum.KeyCode.KeypadZero,[0x61]=Enum.KeyCode.KeypadOne,[0x62]=Enum.KeyCode.KeypadTwo,[0x63]=Enum.KeyCode.KeypadThree,[0x64]=Enum.KeyCode.KeypadFour,[0x65]=Enum.KeyCode.KeypadFive,[0x66]=Enum.KeyCode.KeypadSix,[0x67]=Enum.KeyCode.KeypadSeven,[0x68]=Enum.KeyCode.KeypadEight,[0x69]=Enum.KeyCode.KeypadNine,[0x6A]=Enum.KeyCode.KeypadMultiply,[0x6B]=Enum.KeyCode.KeypadPlus,[0x6D]=Enum.KeyCode.KeypadMinus,[0x6E]=Enum.KeyCode.KeypadPeriod,[0x6F]=Enum.KeyCode.KeypadDivide,[0x70]=Enum.KeyCode.F1,[0x71]=Enum.KeyCode.F2,[0x72]=Enum.KeyCode.F3,[0x73]=Enum.KeyCode.F4,[0x74]=Enum.KeyCode.F5,[0x75]=Enum.KeyCode.F6,[0x76]=Enum.KeyCode.F7,[0x77]=Enum.KeyCode.F8,[0x78]=Enum.KeyCode.F9,[0x79]=Enum.KeyCode.F10,[0x7A]=Enum.KeyCode.F11,[0x7B]=Enum.KeyCode.F12,[0x90]=Enum.KeyCode.NumLock,[0x91]=Enum.KeyCode.ScrollLock,[0xBA]=Enum.KeyCode.Semicolon,[0xBB]=Enum.KeyCode.Equals,[0xBC]=Enum.KeyCode.Comma,[0xBD]=Enum.KeyCode.Minus,[0xBE]=Enum.KeyCode.Period,[0xBF]=Enum.KeyCode.Slash,[0xC0]=Enum.KeyCode.Backquote,[0xDB]=Enum.KeyCode.LeftBracket,[0xDD]=Enum.KeyCode.RightBracket,[0xDE]=Enum.KeyCode.Quote}

local funcs = {}
local names = {}
local cache = {}
local drawCache = {}

local vim = Instance.new("VirtualInputManager");

function DescendantCount(tbl)
    local count = 0
    if type(tbl) ~= 'table' then 
        return 1 
    end
    for _, v in pairs(tbl) do
        count = count + 1
        if type(v) == 'table' then
            count = count + DescendantCount(v)
        end
    end
    return count
end


function Descendants(tbl)
    local descendants = {}
    
    local function process_table(subtbl, prefix)
        for k, v in pairs(subtbl) do
            local index = prefix and (prefix .. "." .. tostring(k)) or tostring(k)
            descendants[index] = v  -- Include the table itself
            if type(v) == 'table' then
                process_table(v, index)
            else
                descendants[index] = v
            end
        end
    end

    if type(tbl) ~= 'table' then
        descendants[tostring(1)] = tbl
    else
        process_table(tbl, nil)
    end
    
    return descendants
end

game.DescendantRemoving:Connect(function(des)
 table.insert(Instances, des)
end)
game.DescendantAdded:Connect(function(des)
 cache[des] = true
end)


local Debug = loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Basic-Functions-12707'))()

--[[ Libraries ]]


funcs.base64 = {}
funcs.crypt = {hex={},url={}}
funcs.syn = {}
funcs.syn_backup = {}
funcs.http = {}
funcs.Drawing = {}
funcs.cache = {}

funcs.Drawing.Fonts = {
  ['UI'] = 0,
  ['System'] = 1,
  ['Plex'] = 2,
  ['Monospace'] = 3
}
local Fonts = {
 [0] = Enum.Font.Arial,
 [1] = Enum.Font.BuilderSans,
 [2] = Enum.Font.Gotham,
 [3] = Enum.Font.RobotoMono
}

local DrawingDict = Instance.new("ScreenGui")
local ClipboardUI = Instance.new("ScreenGui")

local ClipboardBox = Instance.new('TextBox', ClipboardUI)
ClipboardBox.PlaceholderText = ''
ClipboardBox.Text = ''
ClipboardBox.ClearTextOnFocus = false
ClipboardBox.Size = UDim2.new(.1, 0, .15, 0)
ClipboardBox.Position = UDim2.new(10, 0, 10, 0)
local Queue = {}
Queue.__index = Queue

function Queue.new()
    local self = setmetatable({}, Queue)
    self.elements = {}
    return self
end
function Queue:Queue(element)
    table.insert(self.elements, element)
end

function Queue:Update()
    if #self.elements == 0 then
        return nil
    end
    return table.remove(self.elements, 1)
end

function Queue:IsEmpty()
    return #self.elements == 0
end
function Queue:Current()
    return self.elements
end
local ClipboardQueue = Queue.new()

-- [[ Functions ]]

funcs.clonefunction = function(a)
 local proxy = newproxy(true)
 local meta = getmetatable(proxy)
 meta.__call = function(_, args)
  return a(args)
 end

 meta.__tostring = function(self)
  return tostring(meta):gsub("table: ", "function: ")
 end

 meta.__len = function(self)
  return error('attempt to get length of a function value')
 end

 meta.__type = 'function'

 return setmetatable({}, meta)
end
funcs.cloneref = function(a)
    if not clonerefs[a] then clonerefs[a] = {} end
    local Clone = {}

    local mt = {__type='Instance'} -- idk if this works ;(

    mt.__tostring = function()
        return a.Name
    end

    mt.__index = function(_, key)
        local thing = a[key]
        if type(thing) == 'function' then
            return function(...)
                return thing(a, ...)
            end
        else
            return thing
        end
    end
    mt.__newindex = function(_, key, value)
     a[key] = value
    end
    mt.__metatable = 'The metatable is locked'
    mt.__len = function(self)
     return error('attempt to get length of a userdata value')
    end

    setmetatable(Clone, mt)

    table.insert(clonerefs[a], Clone)

    return Clone
end
funcs.compareinstances = function(a, b)
 if not clonerefs[a] then
  return a == b
 else
  if table.find(clonerefs[a], b) then return true end
 end
 return false
end
funcs.cache.iscached = function(thing)
 if thing:IsDescendantOf(game) and cache[thing] then return true else return false end
end
funcs.cache.invalidate = function(thing)
 cache[thing] = nil
 thing.Parent = nil
end
funcs.cache.replace = function(a, b)
 cache[a] = b
 local n, p = a.Name, a.Parent
 local np = b:Clone()
 np.Parent = p np.Name = n
 a.Parent = nil
end
funcs.deepclone = function(a)
 local Result = {}
 for i, v in pairs(a) do
  if type(v) == 'table' then
    Result[i] = funcs.deepclone(v)
  end
  Result[i] = v
 end
 return Result
end
getgenv = getgenv or getfenv(2)
if getgenv().MoreUNC then return end
getgenv().MoreUNC = true
function SafeOverride(a, b, c) --[[ Index, Data, Should override ]]
 if getgenv()[a] and not c then return 1 end
 getgenv()[a] = b
 return 2
end
--[[ The base64 functions were made by https://scriptblox.com/u/yofriendfromschool1 , Credits to him.]]
funcs.base64.encode = function(data)
    local letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return letters:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end
funcs.base64.decode = function(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if x == '=' then return '' end
        local r, f = '', (b:find(x) - 1)
        for i = 6, 1, -1 do
            r = r .. (f % 2^i - f % 2^(i - 1) > 0 and '1' or '0')
        end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if #x ~= 8 then return '' end
        local c = 0
        for i = 1, 8 do
            c = c + (x:sub(i, i) == '1' and 2^(8 - i) or 0)
        end
        return string.char(c)
    end))
end

funcs.loadstring = function(code)
 return oldLoader(toluau(code))
end
funcs.getgenv = getgenv
funcs.crypt.base64 = funcs.base64
funcs.crypt.base64encode = funcs.base64.encode
funcs.crypt.base64decode = funcs.base64.decode
funcs.crypt.base64_encode = funcs.base64.encode
funcs.crypt.base64_decode = funcs.base64.decode
funcs.base64_encode = funcs.base64.encode
funcs.base64_decode = funcs.base64.decode

funcs.crypt.hex.encode = function(txt)
 txt = tostring(txt)
 local hex = ''
 for i = 1, #txt do
    hex = hex .. string.format("%02x", string.byte(txt, i))
 end
 return hex
end
funcs.crypt.hex.decode = function(hex)
    hex = tostring(hex)
    local text = ""
    for i = 1, #hex, 2 do
        local byte_str = string.sub(hex, i, i+1)
        local byte = tonumber(byte_str, 16)
        text = text .. string.char(byte)
    end
    return text
end
funcs.crypt.url.encode = function(a)
 return game:GetService("HttpService"):UrlEncode(a)
end
funcs.crypt.url.decode = function(a)
    a = tostring(a)
    a = string.gsub(a, "+", " ")
    a = string.gsub(a, "%%(%x%x)", function(hex)
        return string.char(tonumber(hex, 16))
    end)
    a = string.gsub(a, "\r\n", "\n")
    return a
end
funcs.crypt.generatekey = function(optionalSize)
 local key = ''
 local a = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
 for i = 1, optionalSize or 32 do local n = math.random(1, #a) key = key .. a:sub(n, n) end
 return funcs.base64.encode(key)
end
funcs.crypt.generatebytes = function(size)
 if type(size) ~= 'number' then return error('missing arguement #1 to \'generatebytes\' (number expected)') end
 return funcs.crypt.generatekey(size)
end
--[[ Basic XOR encryption because i don't know wtf synapse uses for crypt.encrypt ]]
funcs.crypt.encrypt = function(a, b)
 local result = {}
 a = tostring(a) b = tostring(b)
 for i = 1, #a do
    local byte = string.byte(a, i)
    local keyByte = string.byte(b, (i - 1) % #b + 1)
    table.insert(result, string.char(bit32.bxor(byte, keyByte)))
 end
 return table.concat(result)
end
funcs.crypt.decrypt = funcs.crypt.encrypt
funcs.crypt.random = function(len)
 return funcs.crypt.generatekey(len)
end

local active = true
game:GetService("UserInputService").WindowFocused:Connect(function()
 active = true
end)

game:GetService("UserInputService").WindowFocusReleased:Connect(function()
 active = false
end)

funcs.isrbxactive = function()
 return active
end
funcs.isgameactive = funcs.isrbxactive
funcs.gethui = function()
 local s, H = pcall(function()
  return game:GetService("CoreGui")
 end)
 return s and H or game:GetService("Players").LocalPlayer.PlayerGui
end
if getgenv().getrenv and #getgenv().getrenv() == 0 or not getgenv().getrenv then
 getrenv = nil
 getgenv().getrenv = function() -- Override incognito's getrenv
  return renv -- couldn't think of a better way to implement it
 end
end
funcs.setclipboard = function(data)
    repeat task.wait() until ClipboardQueue:Current()[1] == data or ClipboardQueue:IsEmpty()
    ClipboardQueue:Queue(data)
    local old = game:GetService("UserInputService"):GetFocusedTextBox()
    local copy = ClipboardQueue:Current()[1]
    ClipboardBox:CaptureFocus()
    ClipboardBox.Text = copy
    
    local KeyCode = Enum.KeyCode
    local Keys = {KeyCode.RightControl, KeyCode.A}
    local Keys2 = {KeyCode.RightControl, KeyCode.C, KeyCode.V}
    
    for _, v in ipairs(Keys) do
        vim:SendKeyEvent(true, v, false, game)
        task.wait()
    end
    for _, v in ipairs(Keys) do
        vim:SendKeyEvent(false, v, false, game)
        task.wait()
    end
    for _, v in ipairs(Keys2) do
        vim:SendKeyEvent(true, v, false, game)
        task.wait()
    end
    for _, v in ipairs(Keys2) do
        vim:SendKeyEvent(false, v, false, game)
        task.wait()
    end
    ClipboardBox.Text = ''
    if old then old:CaptureFocus() end
    task.wait(.18)
    ClipboardQueue:Update()
end
funcs.syn.write_clipboard = funcs.setclipboard
funcs.toclipboard = funcs.setclipboard
funcs.writeclipboard = funcs.setclipboard
funcs.setrbxclipboard = funcs.setclipboard

funcs.isrenderobj = function(thing)
 if typeof(thing) == 'Instance' then
  return table.find(renderObjs, thing.ClassName) ~= nil
 else
  return table.find(renderObjs, thing) ~= nil
 end
end
funcs.getrenderproperty = function(thing, prop)
 local success, p = pcall(function()
  return thing[prop]
 end)
 return success and p or nil
end
funcs.setrenderproperty = function(thing, prop, val)
 local success, err = pcall(function()
  thing[prop] = val
 end)
 if not success and err then warn(err) end
end

funcs.syn.protect_gui = function(gui)
 names[gui] = {name=gui.Name,parent=gui.Parent}
 protecteduis[gui] = gui
 gui.Name = funcs.crypt.hash(funcs.crypt.random(64)) -- Hashed 64 byte string
 gui.Parent = getgenv().gethui()
end
funcs.syn.unprotect_gui = function(gui)
 if names[gui] then gui.Name = names[gui].name gui.Parent = names[gui].parent end protecteduis[gui] = nil
end
funcs.syn.protectgui = funcs.syn.protect_gui
funcs.syn.unprotectgui = funcs.syn.unprotect_gui
funcs.syn.secure_call = function(func) -- Does not do a secure call, just pcalls it.
 return pcall(func)
end


funcs.isreadonly = function(tbl)
 if type(tbl) ~= 'table' then return false end
 return table.isfrozen(tbl)
end
funcs.setreadonly = function(tbl, cond)
 if cond then
  table.freeze(tbl)
 else
  return funcs.deepclone(tbl)
 end
end
funcs.httpget = function(url)
 return game:HttpGet(url)
end
funcs.httppost = function(url, body, contenttype)
 return game:HttpPostAsync(url, body, contenttype)
end
funcs.request = function(args)
 local Body = nil
 local Timeout = 0
 local function callback(success, body)
  Body = body
  Body['Success'] = success
 end
 HttpService:RequestInternal(args):Start(callback)
 while not Body and Timeout < 10 do
  task.wait(.1)
  Timeout = Timeout + .1
 end
 return Body
end
funcs.mouse1click = function(x, y)
 x = x or 0
 y = y or 0
 vim:SendMouseButtonEvent(x, y, 0, true, game, false)
 task.wait()
 vim:SendMouseButtonEvent(x, y, 0, false, game, false)
end
funcs.mouse2click = function(x, y)
 x = x or 0
 y = y or 0
 vim:SendMouseButtonEvent(x, y, 1, true, game, false)
 task.wait()
 vim:SendMouseButtonEvent(x, y, 1, false, game, false)
end
funcs.mouse1press = function(x, y)
 x = x or 0
 y = y or 0
 vim:SendMouseButtonEvent(x, y, 0, true, game, false)
end
funcs.mouse1release = function(x, y)
 x = x or 0
 y = y or 0
 vim:SendMouseButtonEvent(x, y, 0, false, game, false)
end
funcs.mouse2press = function(x, y)
 x = x or 0
 y = y or 0
 vim:SendMouseButtonEvent(x, y, 1, true, game, false)
end
funcs.mouse2release = function(x, y)
 x = x or 0
 y = y or 0
 vim:SendMouseButtonEvent(x, y, 1, false, game, false)
end
funcs.mousescroll = function(x, y, a)
 x = x or 0
 y = y or 0
 a = a and true or false
 vim:SendMouseWheelEvent(x, y, a, game)
end
funcs.keyclick = function(key)
 if typeof(key) == 'number' then
 if not keys[key] then return error("Key "..tostring(key) .. ' not found!') end
 vim:SendKeyEvent(true, keys[key], false, game)
 task.wait()
 vim:SendKeyEvent(false, keys[key], false, game)
 elseif typeof(Key) == 'EnumItem' then
  vim:SendKeyEvent(true, key, false, game)
  task.wait()
  vim:SendKeyEvent(false, key, false, game)
 end
end
funcs.keypress = function(key)
 if typeof(key) == 'number' then
 if not keys[key] then return error("Key "..tostring(key) .. ' not found!') end
 vim:SendKeyEvent(true, keys[key], false, game)
 elseif typeof(Key) == 'EnumItem' then
  vim:SendKeyEvent(true, key, false, game)
 end
end
funcs.keyrelease = function(key)
 if typeof(key) == 'number' then
 if not keys[key] then return error("Key "..tostring(key) .. ' not found!') end
 vim:SendKeyEvent(false, keys[key], false, game)
 elseif typeof(Key) == 'EnumItem' then
  vim:SendKeyEvent(false, key, false, game)
 end
end
funcs.mousemoverel = function(relx, rely)
 local Pos = workspace.CurrentCamera.ViewportSize
 relx = relx or 0
 rely = rely or 0
 local x = Pos.X * relx
 local y = Pos.Y * rely
 vim:SendMouseMoveEvent(x, y, game)
end
funcs.mousemoveabs = function(x, y)
 x = x or 0 y = y or 0
 vim:SendMouseMoveEvent(x, y, game)
end

funcs.isexecutorclosure = function(fnc)
    for _, func2 in pairs(funcs) do if func2 == fnc then return true end end
    for _, func2 in pairs(getgenv()) do if func2 == fnc then return true end end
    for i = 1, 99 do
        local s, environment = pcall(getfenv, i)
        if not s or type(environment) ~= 'table' then
            return false
        end
        for _, val in pairs(environment) do
            if fnc == val then
                return true
            end
        end
    end
    return false
end

funcs.iscclosure = function(fnc) return debug.info(fnc, 's') == '[C]' end
funcs.islclosure = function(func) return not funcs.iscclosure(func) end
funcs.is_l_closure = funcs.islclosure
funcs.is_executor_closure = funcs.isexecutorclosure
funcs.isourclosure = funcs.isexecutorclosure
funcs.isexecclosure = funcs.isexecutorclosure

--[[ File system is something i do not know how to implement in roblox lua.
UPDATE AT 18/5/2024:
I figured out i can use temp file system with tables.
]]
local files = {}

local function startswith(a, b)
 return a:sub(1, #b) == b
end
local function endswith(hello, lo) 
    return hello:sub(#hello - #lo + 1, #hello) == lo
end

funcs.writefile = function(path, content)
 local Path = path:split('/')
 local CurrentPath = {}
 for i = 1, #Path do
  local a = Path[i]
  CurrentPath[i] = a
  if not files[a] and i ~= #Path then
   files[table.concat(CurrentPath, '/')] = {}
   files[table.concat(CurrentPath, '/') .. '/'] = files[table.concat(CurrentPath, '/')]
  elseif i == #Path then
   files[table.concat(CurrentPath, '/')] = tostring(content)
  end
 end
end
funcs.makefolder = function(path)
 files[path] = {}
 files[path .. '/'] = files[path]
end
funcs.isfolder = function(path)
 return type(files[path]) == 'table'
end
funcs.isfile = function(path)
 return type(files[path]) == 'string'
end
funcs.readfile = function(path)
 return files[path]
end
funcs.appendfile = function(path, text2)
 funcs.writefile(path, funcs.readfile(path) .. text2)
end
funcs.loadfile = function(path)
 local content = getgenv().readfile(path)
 if not content then return error('no file called ' .. tostring(path) .. ' exists.') end
 local _, func = pcall(loadstring, content)
 return func
end
funcs.delfolder = function(path)
 local f = files[path]
 if type(f) == 'table' then files[path] = nil end
end
funcs.delfile = function(path)
 local f = files[path]
 if type(f) == 'string' then files[path] = nil end
end
funcs.listfiles = function(path)
    if not path or path == '' then
     local Files = {}
     for i, v in pairs(files) do
      if #i:split('/') == 1 then table.insert(Files, i) end
     end
     return Files
    end
    if type(files[path]) ~= 'table' then return error(path .. ' is not a folder.') end
    local Files = {}
    for i, v in pairs(files) do
      if startswith(i, path .. '/') and not endswith(i, '/') and i ~= path and #i:split('/') == (#path:split('/') + 1) then table.insert(Files, i) end
    end
    return Files
end

funcs.http.request = funcs.request
funcs.syn.crypt = funcs.crypt
funcs.syn.crypto = funcs.crypt
funcs.syn_backup = funcs.syn


funcs.getexecutorname = function()
 return 'MoreUNC', '1'
end
funcs.identifyexecutor = funcs.getexecutorname
funcs.http_request = getgenv().request or funcs.request
funcs.getscripts = function()
 local a = {};for i, v in pairs(game:GetDescendants()) do if v:IsA("LocalScript") or v:IsA("ModuleScript") then table.insert(a, v) end end return a
end
funcs.get_scripts = function()
 local a = {};for i, v in pairs(game:GetDescendants()) do if v:IsA("LocalScript") or v:IsA("ModuleScript") then table.insert(a, v) end end return a
end
funcs.getmodules = function()
 local a = {};for i, v in pairs(game:GetDescendants()) do if v:IsA("ModuleScript") then table.insert(a, v) end end return a
end
funcs.getloadedmodules = funcs.getmodules
funcs.make_readonly = funcs.setreadonly
funcs.makereadonly = funcs.setreadonly
funcs.base64encode = funcs.crypt.base64encode
funcs.base64decode = funcs.crypt.base64decode
funcs.clonefunc = funcs.clonefunction
funcs.getinstances = function()
 return game:GetDescendants()
end
funcs.getnilinstances = function()
 return Instances
end
funcs.iswriteable = function(tbl)
 return not table.isfrozen(tbl)
end
funcs.makewriteable = function(tbl)
 return funcs.setreadonly(tbl, false)
end
funcs.isscriptable = function(self, prop)
 local s = pcall(function()
  self[prop] = self[prop]
 end)
 return s
end
funcs.getrunningscripts = function()
 local scripts = {}
 for _, v in pairs(funcs.getinstances()) do
  if v:IsA("LocalScript") and v.Enabled then table.insert(scripts, v) end
 end
 return scripts
end

-- SHA256 Hashing
local function str2hexa(a)return string.gsub(a,".",function(b)return string.format("%02x",string.byte(b))end)end;local function num2s(c,d)local a=""for e=1,d do local f=c%256;a=string.char(f)..a;c=(c-f)/256 end;return a end;local function s232num(a,e)local d=0;for g=e,e+3 do d=d*256+string.byte(a,g)end;return d end;local function preproc(h,i)local j=64-(i+9)%64;i=num2s(8*i,8)h=h.."\128"..string.rep("\0",j)..i;assert(#h%64==0)return h end;local function k(h,e,l)local m={}local n={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}for g=1,16 do m[g]=s232num(h,e+(g-1)*4)end;for g=17,64 do local o=m[g-15]local p=bit.bxor(bit.rrotate(o,7),bit.rrotate(o,18),bit.rshift(o,3))o=m[g-2]local q=bit.bxor(bit.rrotate(o,17),bit.rrotate(o,19),bit.rshift(o,10))m[g]=(m[g-16]+p+m[g-7]+q)%2^32 end;local r,s,b,t,u,v,w,x=l[1],l[2],l[3],l[4],l[5],l[6],l[7],l[8]for e=1,64 do local p=bit.bxor(bit.rrotate(r,2),bit.rrotate(r,13),bit.rrotate(r,22))local y=bit.bxor(bit.band(r,s),bit.band(r,b),bit.band(s,b))local z=(p+y)%2^32;local q=bit.bxor(bit.rrotate(u,6),bit.rrotate(u,11),bit.rrotate(u,25))local A=bit.bxor(bit.band(u,v),bit.band(bit.bnot(u),w))local B=(x+q+A+n[e]+m[e])%2^32;x=w;w=v;v=u;u=(t+B)%2^32;t=b;b=s;s=r;r=(B+z)%2^32 end;l[1]=(l[1]+r)%2^32;l[2]=(l[2]+s)%2^32;l[3]=(l[3]+b)%2^32;l[4]=(l[4]+t)%2^32;l[5]=(l[5]+u)%2^32;l[6]=(l[6]+v)%2^32;l[7]=(l[7]+w)%2^32;l[8]=(l[8]+x)%2^32 end;funcs.crypt.hash=function(h)h=preproc(h,#h)local l={0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19}for e=1,#h,64 do k(h,e,l)end;return str2hexa(num2s(l[1],4)..num2s(l[2],4)..num2s(l[3],4)..num2s(l[4],4)..num2s(l[5],4)..num2s(l[6],4)..num2s(l[7],4)..num2s(l[8],4))end

funcs.Drawing.new = function(Type) -- Drawing.new
    local baseProps = {
     Visible = false,
     Color = Color3.new(0,0,0),
     ClassName = nil
    }
    if Type == 'Line' then
        local a = Instance.new("Frame", Instance.new("ScreenGui", DrawingDict))
        a.Visible = false
        a.Size = UDim2.new(0, 0, 0, 0)
        a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        a.BackgroundTransparency = 1
        a.BorderSizePixel = 0

        local meta = baseProps
        meta.ClassName = Type
        meta.__index = {
            Thickness = 1,
            From = Vector2.new(0, 0),
            To = Vector2.new(0, 0),
            Transparency = 0,
            Remove = function(a)
                a:Destroy()
            end,
            Destroy = function()
                a:Destroy()
            end,
            updateLine = function(self)
             local from = self.From
             local to = self.To
             local distance = (to - from).Magnitude
             local angle = math.deg(math.atan2(to.Y - from.Y, to.X - from.X))

             a.Size = UDim2.new(0, distance, 0, self.Thickness)
             a.Position = UDim2.new(0, from.X, 0, from.Y)
             a.Rotation = angle
            end
        }

        meta.__newindex = function(self, key, value)
            if key == 'Thickness' and typeof(value) == 'number' then
                rawset(self, key, value)
                a.Size = UDim2.new(0, (self.To - self.From).Magnitude, 0, value)
            elseif key == 'Visible' and typeof(value) == 'boolean' then
                rawset(self, key, value)
                a.Visible = value
            elseif key == 'Color' and typeof(value) == 'Color3' then
                rawset(self, key, value)
                a.BackgroundColor3 = value
            elseif key == 'Transparency' and typeof(value) == 'number' and value <= 1 then
                rawset(self, key, value)
                a.BackgroundTransparency = 1 - value
            elseif key == 'From' and typeof(value) == 'Vector2' then
                rawset(self, key, value)
                self:updateLine()
            elseif key == 'To' and typeof(value) == 'Vector2' then
                rawset(self, key, value)
                self:updateLine()
            end
        end
        table.insert(drawCache, meta)
        return setmetatable({}, meta)
    elseif Type == 'Square' then
        local a = Instance.new("Frame", DrawingDict)
        a.Visible = false
        a.Size = UDim2.new(0, 0, 0, 0)
        a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        a.BackgroundTransparency = 1
        a.BorderSizePixel = 0
        local b = Instance.new("UIStroke", a)
        b.Color = Color3.fromRGB(255, 255, 255)
        b.Enabled = true

        local meta = baseProps
        meta.ClassName = Type
        meta.__index = {
            Size = Vector2.new(0,0),
            Position = Vector2.new(0, 0),
            Remove = function()
                a:Destroy()
            end,
            Destroy = function()
                a:Destroy()
            end,
            updateSquare = function(self)
             a.Size = UDim2.new(0, self.Size.X, 0, self.Size.Y)
             a.Position = UDim2.new(0, self.Position.X, 0, self.Position.Y)
            end
        }

        meta.__newindex = function(self, key, value)
            if key == 'Filled' and typeof(value) == 'boolean' then
                rawset(self, key, value)
                b.Enabled = not value
                a.BackgroundTransparency = value and 0 or 1
            elseif key == 'Visible' and typeof(value) == 'boolean' then
                rawset(self, key, value)
                a.Visible = value
            elseif key == 'Color' and typeof(value) == 'Color3' then
                rawset(self, key, value)
                a.BackgroundColor3 = value
                b.Color = value
            elseif key == 'Position' and typeof(value) == 'Vector2' then
                rawset(self, key, value)
                self:updateSquare()
            elseif key == 'Size' and typeof(value) == 'Vector2' then
                rawset(self, key, value)
                self:updateSquare()
            end
        end
        table.insert(drawCache, meta)
        return setmetatable({}, meta)
    elseif Type == 'Circle' then
        local a = Instance.new("Frame", Instance.new("ScreenGui", DrawingDict))
        a.Visible = false
        a.Size = UDim2.new(0, 0, 0, 0)
        a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        a.BackgroundTransparency = 1
        a.BorderSizePixel = 0
        local b = Instance.new("UIStroke", a)
        b.Color = Color3.fromRGB(255, 255, 255)
        b.Enabled = false
        b.Thickness = 1
        local c = Instance.new("UICorner", a)
        c.CornerRadius = UDim.new(1, 0)

        local meta = baseProps
        meta.ClassName = Type
        meta.__index = {
            Thickness = 1,
            Filled = false,
            NumSides = 0,
            Radius = 1,
            Position = Vector2.new(0, 0),
            Transparency = 0,
            Remove = function()
                a:Destroy()
            end,
            Destroy = function()
                a:Destroy()
            end,
            updateCircle = function(self)
             a.Size = UDim2.new(0, self.Radius, 0, self.Radius)
             a.Position = UDim2.new(0, self.Position.X, 0, self.Position.Y)
             b.Enabled = not self
             b.Color = self.Color
            end
        }

        meta.__newindex = function(self, key, value)
            if key == 'Thickness' and typeof(value) == 'number' then
                rawset(self, key, value)
                b.Thickness = value
            elseif key == 'Visible' and typeof(value) == 'boolean' then
                rawset(self, key, value)
                a.Visible = value
            elseif key == 'Color' and typeof(value) == 'Color3' then
                rawset(self, key, value)
                a.BackgroundColor3 = value
                a.Color = value
            elseif key == 'Transparency' and typeof(value) == 'number' then
                rawset(self, key, value)
                a.BackgroundTransparency = 1 - value
            elseif key == 'Position' and typeof(value) == 'Vector2' then
                rawset(self, key, value)
                self:updateCircle()
            elseif key == 'Radius' and typeof(value) == 'number' then
                rawset(self, key, value)
                self:updateCircle()
            elseif key == 'NumSides' and typeof(value) == 'number' then
                rawset(self, key, value)
            elseif key == 'Filled' and typeof(value) == 'boolean' then
                rawset(self, key, value)
                self:updateCircle()
            end
        end

        table.insert(drawCache, meta)
        return setmetatable({}, meta)
    elseif Type == 'Text' then
        local a = Instance.new("TextLabel", DrawingDict)
        a.Visible = false
        a.Size = UDim2.new(0, 0, 0, 0)
        a.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        a.BackgroundTransparency = 1
        a.BorderSizePixel = 0
        a.TextStrokeColor3 = Color3.new(0,0,0)
        a.TextStrokeTransparency = 1

        local meta = baseProps
        meta.ClassName = Type
        meta.__index = {
            Text = '',
            Transparency = 0,
            Size = 0,
            Center = false,
            Outline = false,
            OutlineColor = Color3.new(0,0,0),
            Position = Vector2.new(0,0),
            Font = 3,
            Remove = function()
                a:Destroy()
            end,
            Destroy = function()
                a:Destroy()
            end,
            updateText = function(self)
             a.TextScaled = true
             a.Size = UDim2.new(0, self.Size * 3, 0, self.Size / 2)
             a.Position = UDim2.new(0, self.Position.X, 0, self.Position.Y)
             a.Text = self.Text
             a.Font = Fonts[self.Font]
             a.Visible = self.Visible
             a.TextColor3 = self.Color
             a.TextTransparency = 1 - self.Transparency
             a.BorderSizePixel = self.Outline and 1 or 0
             if self.Center then
              a.TextXAlignment = Enum.TextXAlignment.Center
              a.TextYAlignment = Enum.TextYAlignment.Center
             else
              a.TextXAlignment = Enum.TextXAlignment.Left
              a.TextYAlignment = Enum.TextYAlignment.Top
             end
             a.TextStrokeTransparency = self.Outline and 0 or 1
             a.TextStrokeColor3 = self.OutlineColor
            end
        }

        meta.__newindex = function(self, key, value)
            if key == 'Text' and typeof(value) == 'string' then
                rawset(self, key, value)
            elseif key == 'Visible' and typeof(value) == 'boolean' then
                rawset(self, key, value)
                a.Visible = value
            elseif key == 'Color' and typeof(value) == 'Color3' then
                rawset(self, key, value)
            elseif key == 'Transparency' and typeof(value) == 'number' then
                rawset(self, key, value)
            elseif key == 'Position' and typeof(value) == 'Vector2' then
                rawset(self, key, value)
            elseif key == 'Size' and typeof(value) == 'number' then
                rawset(self, key, value)
            elseif key == 'Outline' and typeof(value) == 'boolean' then
                rawset(self, key, value)
            elseif key == 'Center' and typeof(value) == 'boolean' then
                rawset(self, key, value)
            elseif key == 'OutlineColor' and typeof(value) == 'Color3' then
                rawset(self, key, value)
            elseif key == 'Font' and typeof(value) == 'number' then
                rawset(self, key, value)
            end
            self:updateText()
        end

        table.insert(drawCache, meta)
        return setmetatable({}, meta)
    elseif Type == 'Image' then
        local a = Instance.new("ImageLabel", DrawingDict)
        a.Visible = false
        a.Size = UDim2.new(0, 0, 0, 0)
        a.ImageColor3 = Color3.fromRGB(255,255,255)
        a.BackgroundTransparency = 1
        a.BorderSizePixel = 0

        local meta = baseProps
        meta.ClassName = 'Image'
        meta.__index = {
            Text = '',
            Transparency = 0,
            Size = Vector2.new(0, 0),
            Position = Vector2.new(0,0),
            Color = Color3.fromRGB(255, 255, 255),
            Image = '',
            Remove = function()
                a:Destroy()
            end,
            Destroy = function()
                a:Destroy()
            end,
            updateImage = function(self)
             a.Size = UDim2.new(0, self.Size.X, 0, self.Size.Y)
             a.Position = UDim2.new(0, self.Position.X, 0, self.Position.Y)
             a.Visible = self.Visible
             a.ImageColor3 = self.Color
             a.ImageTransparency = 1 - self.Transparency
             a.BorderSizePixel = self.Outline and 1 or 0
             a.Image = self.Image
            end
        }

        meta.__newindex = function(self, key, value)
            if key == 'Visible' and typeof(value) == 'boolean' then
                rawset(self, key, value)
            elseif key == 'Color' and typeof(value) == 'Color3' then
                rawset(self, key, value)
            elseif key == 'Transparency' and typeof(value) == 'number' then
                rawset(self, key, value)
            elseif key == 'Position' and typeof(value) == 'Vector2' then
                rawset(self, key, value)
            elseif key == 'Size' and typeof(value) == 'number' then
                rawset(self, key, value)
            elseif key == 'Image' and typeof(value) == 'string' then
                rawset(self, key, value)
            else
             return
            end
            self:updateImage()
        end

        table.insert(drawCache, meta)
        return setmetatable({}, meta)
    end
end

funcs.randomstring = funcs.crypt.random
funcs.getprotecteduis = function()
 return protecteduis
end
funcs.getprotectedguis = funcs.getprotecteduis
funcs.cleardrawcache = function()
 table.clear(drawCache)
end
funcs.checkcaller = function()
 local info = debug.info(getgenv, 'slnaf')
 return debug.info(1, 'slnaf')==info
end
local Count = 0
local Total = 0
for index, _ in pairs(Descendants(funcs)) do
 if not getgenv()[index] then
  Total = Total + 1
 end
end
print('Running MoreUNC | Roblox',version(),' | Discord https://discord.gg/gYhqMRBeZV')
for i, v in pairs(Descendants(funcs)) do
 if not getgenv()[i] then Count = Count + 1 end
 local Result = SafeOverride(i, v)
 local str = Result == 1 and ('%s %s already exists.'):format(type(v), i) or Result == 2 and ("Added %s %s to the global environment. (%d/%d)"):format(type(v), i, Count, Total) or Result ~= 1 and Result ~= 2 and ("Unknown result for function %s."):format(type(v), i)
 print(str)
end
funcs.syn.protect_gui(DrawingDict)
funcs.syn.protect_gui(ClipboardUI)
-- loadstring for incognito thing idk
local path = game:GetService('CoreGui'):FindFirstChild("incognito");
if path and path:FindFirstChild("main") then
 local execPath = path.main.container.buttons.execute
 local a = execPath:Clone()
 execPath:Destroy()
 a.Parent = path.main.container.buttons
 a.MouseButton1Click:Connect(function()
  loadstring(path.main.container.editor.scroll.source.Text)()
 end)
end
end

local SelectedTab = nil
local tabsamount = 0
local Tabs = {}
if game:GetService("CoreGui"):FindFirstChild("incognito") then
 game:GetService("CoreGui"):FindFirstChild("incognito"):Destroy()
end

local Converted = {
	["_incognito"] = Instance.new("ScreenGui");
	["_main"] = Instance.new("Frame");
	["_mainround"] = Instance.new("UICorner");
	["_sidebar"] = Instance.new("Frame");
	["_logo"] = Instance.new("ImageLabel");
	["_logoround"] = Instance.new("UICorner");
	["_executiontab"] = Instance.new("ImageButton");
	["_scripthubtab"] = Instance.new("ImageButton");
	["_settingstab"] = Instance.new("ImageButton");
	["_executortabselected"] = Instance.new("Frame");
	["_UICorner"] = Instance.new("UICorner");
	["_scriptstabselected"] = Instance.new("Frame");
	["_UICorner1"] = Instance.new("UICorner");
	["_optionstabselected"] = Instance.new("Frame");
	["_UICorner2"] = Instance.new("UICorner");
	["_executorpage"] = Instance.new("Frame");
	["_executorstroke"] = Instance.new("UIStroke");
	["_executorround"] = Instance.new("UICorner");
	["_console"] = Instance.new("Frame");
	["_consoleseperator"] = Instance.new("Frame");
	["_consoletext"] = Instance.new("TextLabel");
	["_welcomtext"] = Instance.new("TextLabel");
	["_welcomtext1"] = Instance.new("TextLabel");
	["_execute"] = Instance.new("ImageButton");
	["_UICorner3"] = Instance.new("UICorner");
	["_UIStroke"] = Instance.new("UIStroke");
	["_clear"] = Instance.new("ImageButton");
	["_UICorner4"] = Instance.new("UICorner");
	["_UIStroke1"] = Instance.new("UIStroke");
	["_tabseperator"] = Instance.new("Frame");
	["_tabs"] = Instance.new("ScrollingFrame");
	["_scriptonetab"] = Instance.new("TextButton");
	["_UICorner5"] = Instance.new("UICorner");
	["_scripttwotab"] = Instance.new("TextButton");
	["_UICorner6"] = Instance.new("UICorner");
	["_scriptthreetab"] = Instance.new("TextButton");
	["_UICorner7"] = Instance.new("UICorner");
    ["_textboxscrolling"] = Instance.new("ScrollingFrame");
	["_tab1box"] = Instance.new("TextBox");
	["_tab1maineditor"] = Instance.new("TextLabel");
	["_tab2box"] = Instance.new("TextBox");
	["_tab2maineditor"] = Instance.new("TextLabel");
	["_tab3box"] = Instance.new("TextBox");
	["_tab3maineditor"] = Instance.new("TextLabel");
    ["_tab1lines"] = Instance.new("TextLabel");
	["_tab2lines"] = Instance.new("TextLabel");
	["_tab3lines"] = Instance.new("TextLabel");
	["_scriptpage"] = Instance.new("Frame");
	["_executorstroke1"] = Instance.new("UIStroke");
	["_executorround1"] = Instance.new("UICorner");
	["_infiniteyieldholder"] = Instance.new("Frame");
	["_executeiystroke"] = Instance.new("UIStroke");
	["_executeiyround"] = Instance.new("UICorner");
	["_iylogo"] = Instance.new("ImageLabel");
	["_executorround2"] = Instance.new("UICorner");
	["_iylabel"] = Instance.new("TextLabel");
	["_executeiy"] = Instance.new("TextButton");
	["_executeiybtnround"] = Instance.new("UICorner");
	["_executeiyicon"] = Instance.new("ImageLabel");
	["_executeiylabel"] = Instance.new("TextLabel");
	["_dexexplorerholder"] = Instance.new("Frame");
	["_executedexstroke"] = Instance.new("UIStroke");
	["_executedexround"] = Instance.new("UICorner");
	["_dexicon"] = Instance.new("ImageLabel");
	["_executorround3"] = Instance.new("UICorner");
	["_dexlabel"] = Instance.new("TextLabel");
	["_executedex"] = Instance.new("TextButton");
	["_executedexbtnround"] = Instance.new("UICorner");
	["_executedexicon"] = Instance.new("ImageLabel");
	["_executedexlabel"] = Instance.new("TextLabel");
	["_remotespyholder"] = Instance.new("Frame");
	["_executeremotespystroke"] = Instance.new("UIStroke");
	["_executeremotespyround"] = Instance.new("UICorner");
	["_remotespyicon"] = Instance.new("ImageLabel");
	["_executorround4"] = Instance.new("UICorner");
	["_remotespylabel"] = Instance.new("TextLabel");
	["_executeremotespy"] = Instance.new("TextButton");
	["_executeremotespybtnround"] = Instance.new("UICorner");
	["_executeremotespyicon"] = Instance.new("ImageLabel");
	["_executeremotespylabel"] = Instance.new("TextLabel");
	["_settingspage"] = Instance.new("Frame");
	["_executorstroke2"] = Instance.new("UIStroke");
	["_executorround5"] = Instance.new("UICorner");
	["_emptynotice"] = Instance.new("TextLabel");
}

Converted["_incognito"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_incognito"].Name = "incognito"
Converted["_incognito"].Parent = game:GetService("CoreGui")

Converted["_main"].BackgroundColor3 = Color3.fromRGB(25.000000409781933, 28.000000230968, 35.00000171363354)
Converted["_main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_main"].BorderSizePixel = 0
Converted["_main"].Position = UDim2.new(0.5, 0, .5, 0)
Converted['_main'].AnchorPoint = Vector2.new(.5, .5)
Converted["_main"].Size = UDim2.new(0, 681, 0, 394)
Converted["_main"].Name = "main"
Converted["_main"].Parent = Converted["_incognito"]

Converted["_mainround"].CornerRadius = UDim.new(0, 18)
Converted["_mainround"].Name = "mainround"
Converted["_mainround"].Parent = Converted["_main"]

Converted["_sidebar"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_sidebar"].BackgroundTransparency = 1
Converted["_sidebar"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_sidebar"].BorderSizePixel = 0
Converted["_sidebar"].Size = UDim2.new(0, 131, 0, 394)
Converted["_sidebar"].Name = "sidebar"
Converted["_sidebar"].Parent = Converted["_main"]

Converted["_logo"].Image = "rbxassetid://17463669567"
Converted["_logo"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_logo"].BackgroundTransparency = 1
Converted["_logo"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_logo"].BorderSizePixel = 0
Converted["_logo"].Position = UDim2.new(0.0534351133, 0, 0, 0)
Converted["_logo"].Size = UDim2.new(0, 71, 0, 71)
Converted["_logo"].Name = "logo"
Converted["_logo"].Parent = Converted["_sidebar"]

Converted["_logoround"].CornerRadius = UDim.new(0, 20)
Converted["_logoround"].Name = "logoround"
Converted["_logoround"].Parent = Converted["_logo"]

Converted["_executiontab"].Image = "rbxassetid://17567674604"
Converted["_executiontab"].ImageColor3 = Color3.fromRGB(255, 255, 255)
Converted["_executiontab"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_executiontab"].BackgroundTransparency = 1
Converted["_executiontab"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_executiontab"].BorderSizePixel = 0
Converted["_executiontab"].Position = UDim2.new(0.238435119, 0, 0.322335035, 0)
Converted["_executiontab"].Size = UDim2.new(0, 28, 0, 28)
Converted["_executiontab"].Name = "executiontab"
Converted["_executiontab"].Parent = Converted["_sidebar"]

Converted["_scripthubtab"].Image = "rbxassetid://17567627306"
Converted["_scripthubtab"].ImageColor3 = Color3.fromRGB(101.00000157952309, 101.00000157952309, 104.00000140070915)
Converted["_scripthubtab"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_scripthubtab"].BackgroundTransparency = 1
Converted["_scripthubtab"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_scripthubtab"].BorderSizePixel = 0
Converted["_scripthubtab"].Position = UDim2.new(0.238435119, 0, 0.46952796, 0)
Converted["_scripthubtab"].Size = UDim2.new(0, 28, 0, 28)
Converted["_scripthubtab"].Name = "scripthubtab"
Converted["_scripthubtab"].Parent = Converted["_sidebar"]

Converted['_consoletab'] = Converted["_scripthubtab"]:Clone()
Converted["_consoletab"].Image = "rbxassetid://17567215116"
Converted["_consoletab"].ImageColor3 = Color3.fromRGB(101.00000157952309, 101.00000157952309, 104.00000140070915)
Converted["_consoletab"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_consoletab"].BackgroundTransparency = 1
Converted["_consoletab"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_consoletab"].BorderSizePixel = 0
Converted["_consoletab"].Position = UDim2.new(0.238435119, 0, 0.604045749, 0)
Converted["_consoletab"].Size = UDim2.new(0, 28, 0, 28)
Converted["_consoletab"].Name = "consoletab"
Converted["_consoletab"].Parent = Converted["_sidebar"]

Converted["_settingstab"].Image = "rbxassetid://17567689119"
Converted["_settingstab"].ImageColor3 = Color3.fromRGB(101.00000157952309, 101.00000157952309, 104.00000140070915)
Converted["_settingstab"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_settingstab"].BackgroundTransparency = 1
Converted["_settingstab"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_settingstab"].BorderSizePixel = 0
Converted["_settingstab"].Position = UDim2.new(0.238435119, 0, 0.604045749+(0.604045749-0.46952796), 0)
Converted["_settingstab"].Size = UDim2.new(0, 28, 0, 28)
Converted["_settingstab"].Name = "settingstab"
Converted["_settingstab"].Parent = Converted["_sidebar"]

Converted['_apitab'] = Converted["_settingstab"]:Clone()
Converted['_apitab'].Image = 'rbxassetid://17568378230'
Converted['_apitab'].Parent = Converted['_sidebar']
Converted['_apitab'].Position = Converted["_settingstab"].Position + UDim2.new(0, 0, (0.604045749-0.46952796), 0)

Converted["_executortabselected"].BackgroundColor3 = Color3.fromRGB(74.0000031888485, 77.00000301003456, 105.00000134110451)
Converted["_executortabselected"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_executortabselected"].BorderSizePixel = 0
Converted["_executortabselected"].Position = UDim2.new(0.0599999987, 0, 0.333999995, 0)
Converted["_executortabselected"].Size = UDim2.new(0, 2, 0, 20)
Converted["_executortabselected"].Name = "executortabselected"
Converted["_executortabselected"].Parent = Converted["_sidebar"]

function selectMainTab(tab)
 for i, v in pairs(Converted['_sidebar']:GetChildren()) do
  if v:IsA("ImageButton") then
   if v == tab then v.ImageColor3 = Color3.fromRGB(212.00000256299973, 211.00000262260437, 212.00000256299973) else
   v.ImageColor3 = Color3.fromRGB(101.00000157952309, 101.00000157952309, 104.00000140070915)
  end
  end
 end
end
function selectPage(tab)
 for i, v in pairs(Converted['_main']:GetChildren()) do
  if v.Name:sub(#v.Name-#"page"+1, #v.Name) == 'page' then
   if v == tab then v.Visible = true else v.Visible = false end
  end
 end
end

Converted['_executiontab'].MouseButton1Click:Connect(function()
 selectPage(Converted['_executorpage'])
 local Tween = game:GetService("TweenService"):Create(Converted['_executortabselected'], TweenInfo.new(.25), {Position=UDim2.new(0.0599999987, 0, 0.333999995, 0)})
 Tween:Play()
 selectMainTab(Converted['_executiontab'])
 Tween.Completed:Wait()
end)
Converted['_scripthubtab'].MouseButton1Click:Connect(function()
 selectPage(Converted["_scriptpage"])
 local Tween = game:GetService("TweenService"):Create(Converted['_executortabselected'], TweenInfo.new(.25), {Position=UDim2.new(0.0599999987, 0, 0.477999995, 0)})
 Tween:Play()
 selectMainTab(Converted["_scripthubtab"])
 Tween.Completed:Wait()
end)
Converted['_consoletab'].MouseButton1Click:Connect(function()
 selectPage(Converted['_consolepage'])
 local Tween = game:GetService("TweenService"):Create(Converted['_executortabselected'], TweenInfo.new(.25), {Position=UDim2.new(0.0599999987, 0, 0.613999995, 0)})
 Tween:Play()
 selectMainTab(Converted["_consoletab"])
 Tween.Completed:Wait()
end)
Converted['_settingstab'].MouseButton1Click:Connect(function()
 selectPage(Converted['_settingspage'])
 local Tween = game:GetService("TweenService"):Create(Converted['_executortabselected'], TweenInfo.new(.25), {Position=UDim2.new(0.0599999987, 0, 0.747999995, 0)})
 Tween:Play()
 selectMainTab(Converted['_settingstab'])
 Tween.Completed:Wait()
end)
Converted['_apitab'].MouseButton1Click:Connect(function()
 selectPage(Converted['_apipage'])
 local Tween = game:GetService("TweenService"):Create(Converted['_executortabselected'], TweenInfo.new(.25), {Position=UDim2.new(0.0599999987, 0, 0.887999995, 0)})
 Tween:Play()
 selectMainTab(Converted['_apitab'])
 Tween.Completed:Wait()
end)

Converted["_UICorner"].CornerRadius = UDim.new(0, 10)
Converted["_UICorner"].Parent = Converted["_executortabselected"]

Converted["_scriptstabselected"].BackgroundColor3 = Color3.fromRGB(74.0000031888485, 77.00000301003456, 105.00000134110451)
Converted["_scriptstabselected"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_scriptstabselected"].BorderSizePixel = 0
Converted["_scriptstabselected"].Position = UDim2.new(0.0599999987, 0, 0.479900002, 0)
Converted["_scriptstabselected"].Size = UDim2.new(0, 2, 0, 20)
Converted["_scriptstabselected"].Visible = true
Converted["_scriptstabselected"].BackgroundTransparency = 1
Converted["_scriptstabselected"].Name = "scriptstabselected"
Converted["_scriptstabselected"].Parent = Converted["_sidebar"]

Converted["_UICorner1"].CornerRadius = UDim.new(0, 10)
Converted["_UICorner1"].Parent = Converted["_scriptstabselected"]

Converted["_optionstabselected"].BackgroundColor3 = Color3.fromRGB(74.0000031888485, 77.00000301003456, 105.00000134110451)
Converted["_optionstabselected"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_optionstabselected"].BorderSizePixel = 0
Converted["_optionstabselected"].Position = UDim2.new(0.0599999987, 0, 0.612999976, 0)
Converted["_optionstabselected"].Size = UDim2.new(0, 2, 0, 20)
Converted["_optionstabselected"].Visible = true
Converted["_optionstabselected"].BackgroundTransparency = 1
Converted["_optionstabselected"].Name = "optionstabselected"
Converted["_optionstabselected"].Parent = Converted["_sidebar"]

Converted["_UICorner2"].CornerRadius = UDim.new(0, 10)
Converted["_UICorner2"].Parent = Converted["_optionstabselected"]

Converted["_executorpage"].BackgroundColor3 = Color3.fromRGB(24.000000469386578, 24.000000469386578, 30.00000011175871)
Converted["_executorpage"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_executorpage"].BorderSizePixel = 0
Converted["_executorpage"].Position = UDim2.new(0.133627012, 0, 0.0456852801, 0)
Converted["_executorpage"].Size = UDim2.new(0, 570, 0, 361)
Converted["_executorpage"].Visible = true
Converted["_executorpage"].Name = "executorpage"
Converted["_executorpage"].Parent = Converted["_main"]

Converted["_executorstroke"].Color = Color3.fromRGB(38.0000015348196, 38.0000015348196, 48.000000938773155)
Converted["_executorstroke"].Thickness = 1.5
Converted["_executorstroke"].Name = "executorstroke"
Converted["_executorstroke"].Parent = Converted["_executorpage"]

Converted["_executorround"].CornerRadius = UDim.new(0, 18)
Converted["_executorround"].Name = "executorround"
Converted["_executorround"].Parent = Converted["_executorpage"]

Converted['_consolepage'] = Converted['_executorpage']:Clone()
Converted['_consolepage'].Parent = Converted['_main']
Converted["_consolepage"].Visible = false

Converted['_apipage'] = Converted['_executorpage']:Clone()
Converted['_apipage'].Parent = Converted['_main']
Converted['_apipage'].Visible = false
Converted['_apipage'].Name = 'apipage'

Converted["_execute"].Image = "http://www.roblox.com/asset/?id=6026663699"
Converted["_execute"].ImageColor3 = Color3.fromRGB(142.00000673532486, 143.00000667572021, 151.00000619888306)
Converted["_execute"].BackgroundColor3 = Color3.fromRGB(32.00000189244747, 32.00000189244747, 42.000001296401024)
Converted["_execute"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_execute"].BorderSizePixel = 0
Converted["_execute"].Position = UDim2.new(0.857894719, 0, 0.889196694, 0)
Converted["_execute"].Size = UDim2.new(0, 31, 0, 31)
Converted["_execute"].Name = "execute"
Converted["_execute"].Parent = Converted["_executorpage"]
Converted["_execute"].AutoButtonColor = false

Converted["_UICorner3"].CornerRadius = UDim.new(0, 7)
Converted["_UICorner3"].Parent = Converted["_execute"]

Converted["_UIStroke"].Color = Color3.fromRGB(36.00000165402889, 37.00000159442425, 45.00000111758709)
Converted["_UIStroke"].Thickness = 2
Converted["_UIStroke"].Parent = Converted["_execute"]

local NewTab = Converted['_execute']:Clone()
NewTab.Parent = Converted['_executorpage']
NewTab.Image = 'rbxassetid://7072716017'
NewTab.Position = UDim2.new(0.857894719-(0.926315784-0.857894719), 0, 0.889196694, 0)

Converted["_clear"].Image = "http://www.roblox.com/asset/?id=6035047409"
Converted["_clear"].ImageColor3 = Color3.fromRGB(142.00000673532486, 143.00000667572021, 151.00000619888306)
Converted["_clear"].BackgroundColor3 = Color3.fromRGB(32.00000189244747, 32.00000189244747, 42.000001296401024)
Converted["_clear"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_clear"].BorderSizePixel = 0
Converted["_clear"].Position = UDim2.new(0.926315784, 0, 0.889196694, 0)
Converted["_clear"].Size = UDim2.new(0, 31, 0, 31)
Converted["_clear"].Name = "clear"
Converted["_clear"].Parent = Converted["_executorpage"]
Converted["_clear"].AutoButtonColor = false

Converted["_UICorner4"].CornerRadius = UDim.new(0, 7)
Converted["_UICorner4"].Parent = Converted["_clear"]

Converted["_UIStroke1"].Color = Color3.fromRGB(36.00000165402889, 37.00000159442425, 45.00000111758709)
Converted["_UIStroke1"].Thickness = 2
Converted["_UIStroke1"].Parent = Converted["_clear"]

Converted["_tabseperator"].BackgroundColor3 = Color3.fromRGB(38.0000015348196, 38.0000015348196, 48.000000938773155)
Converted["_tabseperator"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_tabseperator"].BorderSizePixel = 0
Converted["_tabseperator"].Position = UDim2.new(0, 0, 0.0905361846, 0)
Converted["_tabseperator"].Size = UDim2.new(0, 570, 0, 2)
Converted["_tabseperator"].Name = "tabseperator"
Converted["_tabseperator"].Parent = Converted["_executorpage"]

Converted["_tabs"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_tabs"].BackgroundTransparency = 1
Converted["_tabs"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_tabs"].BorderSizePixel = 0
Converted["_tabs"].Size = UDim2.new(0, 570, 0, 34)
Converted["_tabs"].Name = "tabs"
Converted["_tabs"].Parent = Converted["_executorpage"]
Converted["_tabs"].CanvasSize = UDim2.new(0, 0, 0, 0)
Converted['_tabs'].AutomaticCanvasSize = Enum.AutomaticSize.X
Converted['_tabs'].ScrollBarThickness = 0

local layout = Instance.new("UIListLayout", Converted["_tabs"])
layout.VerticalAlignment = Enum.VerticalAlignment.Center
layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
layout.FillDirection = Enum.FillDirection.Horizontal
layout.Padding = UDim.new(0, 4)
layout.SortOrder = Enum.SortOrder.LayoutOrder
Instance.new("UIPadding", Converted["_tabs"]).PaddingLeft = UDim.new(0, 4)

Converted["_scriptonetab"].Font = Enum.Font.Gotham
Converted["_scriptonetab"].Text = "Tab"
Converted["_scriptonetab"].TextColor3 = Color3.fromRGB(212.00000256299973, 211.00000262260437, 212.00000256299973)
Converted["_scriptonetab"].TextScaled = true
Converted["_scriptonetab"].BackgroundColor3 = Color3.fromRGB(38.0000015348196, 38.0000015348196, 48.000000938773155)
Converted["_scriptonetab"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_scriptonetab"].BorderSizePixel = 0
Converted["_scriptonetab"].Position = UDim2.new(0.0192982461, 0, 0.176470593, 0)
Converted["_scriptonetab"].Size = UDim2.new(0, 68, 0, 23)
Converted["_scriptonetab"].Name = "tab"
Converted["_scriptonetab"].Parent = Converted["_tabs"]
Converted["_scriptonetab"].AutoButtonColor = false
Converted['_scriptonetab'].Visible = false

local a = Instance.new("UITextSizeConstraint", Converted['_scriptonetab'])
a.MaxTextSize = 14
a.MinTextSize = 12

Converted["_UICorner5"].CornerRadius = UDim.new(0, 15)
Converted["_UICorner5"].Parent = Converted["_scriptonetab"]

Converted["_textboxscrolling"].CanvasSize = UDim2.new(0, 0, 50, 0)
Converted['_textboxscrolling'].AutomaticCanvasSize = Enum.AutomaticSize.XY
Converted["_textboxscrolling"].ScrollBarImageColor3 = Color3.fromRGB(212.00000256299973, 211.00000262260437, 212.00000256299973)
Converted["_textboxscrolling"].ScrollBarThickness = 5
Converted["_textboxscrolling"].Active = true
Converted["_textboxscrolling"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_textboxscrolling"].BackgroundTransparency = 1
Converted["_textboxscrolling"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_textboxscrolling"].BorderSizePixel = 0
Converted["_textboxscrolling"].Position = UDim2.new(0, 0, 0.102493078, 0)
Converted["_textboxscrolling"].Size = UDim2.new(0, 570, 0, 244)
Converted["_textboxscrolling"].Name = "textboxscrolling"
Converted["_textboxscrolling"].Parent = Converted["_executorpage"]

Converted["_tab1box"].ClearTextOnFocus = false
Converted["_tab1box"].Font = Enum.Font.Gotham
Converted["_tab1box"].MultiLine = true
Converted["_tab1box"].PlaceholderColor3 = Color3.fromRGB(84.00000259280205, 85.0000025331974, 91.00000217556953)
Converted["_tab1box"].PlaceholderText = "-- Welcome to Incognito. Be careful executing unknown scripts there are vulns!"
Converted["_tab1box"].RichText = true
Converted["_tab1box"].Text = ""
Converted["_tab1box"].ZIndex = 99999
Converted["_tab1box"].TextColor3 = Color3.fromRGB(212.00000256299973, 211.00000262260437, 212.00000256299973)
Converted["_tab1box"].TextSize = 14
Converted["_tab1box"].TextTransparency = 0
Converted["_tab1box"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_tab1box"].TextYAlignment = Enum.TextYAlignment.Top
Converted["_tab1box"].BackgroundColor3 = Color3.fromRGB(24.000000469386578, 24.000000469386578, 30.00000011175871)
Converted["_tab1box"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_tab1box"].BorderSizePixel = 0
Converted["_tab1box"].Position = UDim2.new(0.0689999983, 0, 0, 0)
Converted["_tab1box"].Size = UDim2.new(0, 525, 0, 18040)
Converted["_tab1box"].Name = "tab1box"
Converted["_tab1box"].Parent = Converted["_textboxscrolling"]

Converted["_tab1maineditor"].Font = Enum.Font.Gotham
Converted["_tab1maineditor"].Text = ""
Converted["_tab1maineditor"].TextColor3 = Color3.fromRGB(212.00000256299973, 211.00000262260437, 212.00000256299973)
Converted["_tab1maineditor"].TextSize = 14
Converted["_tab1maineditor"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_tab1maineditor"].TextYAlignment = Enum.TextYAlignment.Top
Converted["_tab1maineditor"].BackgroundColor3 = Color3.fromRGB(24.000000469386578, 24.000000469386578, 30.00000011175871)
Converted["_tab1maineditor"].BackgroundTransparency = 0.9900000095367432
Converted["_tab1maineditor"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_tab1maineditor"].BorderSizePixel = 0
Converted["_tab1maineditor"].Size = UDim2.new(0, 525, 0, 18040)
Converted["_tab1maineditor"].Name = "tab1maineditor"
Converted["_tab1maineditor"].Parent = Converted["_tab1box"]
Converted["_tab1maineditor"].Text = ''
Converted["_tab1maineditor"].ZIndex = -9999

Converted["_tab1lines"].Font = Enum.Font.Gotham
Converted["_tab1lines"].Text = "1"
Converted["_tab1lines"].TextColor3 = Color3.fromRGB(156.00000590085983, 156.00000590085983, 156.00000590085983)
Converted["_tab1lines"].TextSize = 14
Converted["_tab1lines"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_tab1lines"].TextYAlignment = Enum.TextYAlignment.Top
Converted["_tab1lines"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_tab1lines"].BackgroundTransparency = 1
Converted["_tab1lines"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_tab1lines"].BorderSizePixel = 0
Converted["_tab1lines"].Position = UDim2.new(0.0192982461, 0, 0, 0)
Converted["_tab1lines"].Size = UDim2.new(0, 28, 0, 18040)
Converted["_tab1lines"].Name = "tab1lines"
Converted["_tab1lines"].Parent = Converted["_textboxscrolling"]

Converted["_scriptpage"].BackgroundColor3 = Color3.fromRGB(24.000000469386578, 24.000000469386578, 30.00000011175871)
Converted["_scriptpage"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_scriptpage"].BorderSizePixel = 0
Converted["_scriptpage"].Position = UDim2.new(0.133627012, 0, 0.0456852801, 0)
Converted["_scriptpage"].Size = UDim2.new(0, 570, 0, 361)
Converted["_scriptpage"].Visible = false
Converted["_scriptpage"].Name = "scriptpage"
Converted["_scriptpage"].Parent = Converted["_main"]

Converted["_executorstroke1"].Color = Color3.fromRGB(38.0000015348196, 38.0000015348196, 48.000000938773155)
Converted["_executorstroke1"].Thickness = 1.5
Converted["_executorstroke1"].Name = "executorstroke"
Converted["_executorstroke1"].Parent = Converted["_scriptpage"]

Converted["_executorround1"].CornerRadius = UDim.new(0, 18)
Converted["_executorround1"].Name = "executorround"
Converted["_executorround1"].Parent = Converted["_scriptpage"]

Converted['_settingspage'] = Converted['_scriptpage']:Clone()
Converted['_settingspage'].Parent = Converted['_main']

local ScriptNames = {
 'MoreUNC', -- hehe self promo
 'Blox Fruits',
 'Pet Simulator 99',
 'Adopt Me',
 'Blade Ball',
 'UNC Test' -- hehe self promo 2
}

local Scripts = Instance.new("ScrollingFrame", Converted['_scriptpage'])
Scripts.Size = UDim2.new(1, 0, .85, 0)
Scripts.Position = UDim2.new(0, 0, .15, 0)
Scripts.ScrollBarThickness = 0
Scripts.CanvasSize = UDim2.new(0,0,0,0)
Scripts.AutomaticCanvasSize = Enum.AutomaticSize.XY
Scripts.Name = 'Scripts'
Scripts.BackgroundTransparency = 1
local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.Parent = Scripts
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0.49, 0, 0.49, 0)
UIGridLayout.CellPadding = UDim2.new(0,5,0,5)
UIGridLayout.Name = 'Layout'
local SearchBar = Instance.new("TextBox", Converted['_scriptpage'])
SearchBar.Font = Enum.Font.Gotham
SearchBar.PlaceholderText = 'Try \'' .. ScriptNames[math.random(1, #ScriptNames)] .. '\''
SearchBar.TextSize = 14
SearchBar.Size = UDim2.new(1, 0, .15, 0)
SearchBar.TextColor3 = Color3.fromRGB(212.00000256299973, 211.00000262260437, 212.00000256299973)
SearchBar.TextXAlignment = Enum.TextXAlignment.Left
SearchBar.TextYAlignment = Enum.TextYAlignment.Center
SearchBar.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
SearchBar.BackgroundTransparency = 1
SearchBar.Text = ''
Instance.new('UIPadding', SearchBar).PaddingLeft = UDim.new(.025, 0)
Instance.new('UIPadding', Scripts).PaddingLeft = UDim.new(0, 5)
local Glass = Instance.new("ImageLabel", SearchBar)
Glass.Image = 'rbxassetid://17558788274'
Glass.BackgroundTransparency = 1
Glass.Size = UDim2.new(0, 31, 0, 31)
Glass.Position = UDim2.new(.95, 0, .5, 0)
Glass.AnchorPoint = Vector2.new(.95, .5)
local Template = Instance.new("Frame")
Template.Parent = nil
Template.Size = UDim2.new(.3, 0, .3, 0)
Template.BackgroundColor3 = Color3.fromRGB(30.000000469386578, 30.000000469386578, 36.00000011175871)
Template.BorderSizePixel = 0
Instance.new("UICorner", Template).CornerRadius = UDim.new(0, 8)
local Title = Instance.new("TextLabel", Template)
Title.Text = ''
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Size = UDim2.new(1, 0, .2, 0)
Title.TextScaled = true
Title.Position = UDim2.new(0, 0, .15, 0)
Title.Name = 'Title'
Title.TextColor3 = Color3.fromRGB(240, 112, 48)
local T = Instance.new("UITextSizeConstraint", Title)
T.MaxTextSize = 18
T.MinTextSize = 14
local GameName = Instance.new("TextLabel", Template)
GameName.Text = ''
GameName.BackgroundTransparency = 1
GameName.Font = Enum.Font.GothamBold
GameName.Size = UDim2.new(1, 0, .15, 0)
GameName.TextScaled = true
GameName.Position = UDim2.new(0, 0, 0, 0)
GameName.Name = 'GameName'
GameName.TextColor3 = Color3.fromRGB(212.00000256299973, 211.00000262260437, 212.00000256299973)
local T2 = Instance.new("UITextSizeConstraint", GameName)
T2.MaxTextSize = 18
T2.MinTextSize = 14
local Execute = Instance.new("TextButton", Template)
Execute.Text = 'Execute'
Execute.Font = Enum.Font.GothamBold
Execute.Size = UDim2.new(.5, 0, .2, 0)
Execute.TextScaled = true
Execute.Position = UDim2.new(0, 0, .8, 0)
Execute.Name = 'Execute'
Execute.TextColor3 = Color3.fromRGB(212.00000256299973, 211.00000262260437, 212.00000256299973)
Execute.BackgroundColor3 = Color3.fromRGB(66, 66, 227)
Instance.new("UICorner", Execute).CornerRadius = UDim.new(0, 4)
local Add = Instance.new("TextButton", Template)
Add.Text = 'Save'
Add.Font = Enum.Font.GothamBold
Add.Size = UDim2.new(.5, 0, .2, 0)
Add.TextScaled = true
Add.Position = UDim2.new(.5, 0, .8, 0)
Add.Name = 'Add'
Add.TextColor3 = Color3.fromRGB(212.00000256299973, 211.00000262260437, 212.00000256299973)
Add.BackgroundColor3 = Color3.fromRGB(66, 66, 227)
Instance.new("UICorner", Add).CornerRadius = UDim.new(0, 4)
local Owner = Instance.new("TextLabel", Template)
Owner.Text = ''
Owner.Font = Enum.Font.GothamBold
Owner.Size = UDim2.new(1, 0, .1, 0)
Owner.Position = UDim2.new(0, 0, .41, 0)
Owner.TextScaled = true
Owner.Name = 'Owner'
Owner.TextColor3 = Color3.fromRGB(212.00000256299973, 211.00000262260437, 212.00000256299973)
Owner.BackgroundTransparency = 1
local T3 = Instance.new("UITextSizeConstraint", Owner)
T3.MaxTextSize = 18
T3.MinTextSize = 14
local Views = Instance.new("TextLabel", Template)
Views.Text = ''
Views.Font = Enum.Font.GothamBold
Views.Size = UDim2.new(1, 0, .1, 0)
Views.Position = UDim2.new(0, 0, .51, 0)
Views.TextScaled = true
Views.Name = 'Views'
Views.TextColor3 = Color3.fromRGB(212.00000256299973, 211.00000262260437, 212.00000256299973)
Views.BackgroundTransparency = 1
local Likes = Instance.new("ImageLabel", Template)
Likes.Name = 'Likes'
Likes.Image = 'rbxassetid://17560366102'
Likes.Size = UDim2.new(.1, 0, .15, 0)
Likes.Position = UDim2.new(.025, 0, .35, 0)
Likes.BackgroundTransparency = 1
local LikeCount = Instance.new("TextLabel", Template)
LikeCount.Name = 'LikeCount'
LikeCount.Font = Enum.Font.GothamBold
LikeCount.TextSize = 13
LikeCount.Size = UDim2.new(.1, 0, .15, 0)
LikeCount.Position = UDim2.new(.025, 0, .5, 0)
LikeCount.BackgroundTransparency = 1
LikeCount.Text = ''
LikeCount.TextColor3 = Color3.fromRGB(212, 211, 212)
local Dislikes = Instance.new("ImageLabel", Template)
Dislikes.Name = 'Dislikes'
Dislikes.Image = Likes.Image
Dislikes.Rotation = 180 -- yes i did that instead of creating a dislike image, shut up.
Dislikes.Size = UDim2.new(.1, 0, .15, 0)
Dislikes.Position = UDim2.new(.9, 0, .35, 0)
Dislikes.BackgroundTransparency = 1
local DislikeCount = Instance.new("TextLabel", Template)
DislikeCount.Name = 'DislikeCount'
DislikeCount.Font = Enum.Font.GothamBold
DislikeCount.TextSize = 13
DislikeCount.Size = UDim2.new(.1, 0, .15, 0)
DislikeCount.Position = UDim2.new(.9, 0, .5, 0)
DislikeCount.BackgroundTransparency = 1
DislikeCount.Text = ''
DislikeCount.TextColor3 = Color3.fromRGB(212, 211, 212)
local IsVerified = Instance.new("ImageLabel", Template)
IsVerified.Name = 'IsVerified'
IsVerified.Image = 'rbxassetid://17560487520'
IsVerified.Size = UDim2.new(.085, 0, .15, 0)
IsVerified.Position = UDim2.new(.5, 0, .735, 0)
IsVerified.AnchorPoint = Vector2.new(.5, .735)
IsVerified.BackgroundTransparency = 1
Converted['_consolepage'].Name = 'consolepage'
local ConsoleFrame = Instance.new("ScrollingFrame", Converted['_consolepage'])
ConsoleFrame.Size = UDim2.new(1, 0, .9, 0)
ConsoleFrame.Position = UDim2.new(0, 0, .1, 0)
ConsoleFrame.ScrollBarThickness = 0
ConsoleFrame.CanvasSize = UDim2.new(0,0,0,0)
ConsoleFrame.AutomaticCanvasSize = Enum.AutomaticSize.XY
ConsoleFrame.Name = 'ConsoleFrame'
ConsoleFrame.BackgroundTransparency = 1
Instance.new("UIListLayout", ConsoleFrame)
Instance.new("UIPadding", ConsoleFrame).PaddingLeft = UDim.new(0, 4)
local Clear = Instance.new("ImageButton", Converted['_consolepage'])
Clear.Image = 'rbxassetid://17568108556'
Clear.Size = UDim2.new(0, 28, 0, 28)
Clear.Position = UDim2.new(0, 4, .05, 0)
Clear.AnchorPoint = Vector2.new(0, .05)
Clear.BackgroundTransparency = 1
Clear.BorderSizePixel = 0
Clear.MouseButton1Click:Connect(function()
 for _, v in pairs(ConsoleFrame:GetChildren()) do if v:IsA("TextLabel") then v:Destroy() end end
end)

local ConsoleSearch = Instance.new("TextBox", Converted['_consolepage'])
ConsoleSearch.Font = Enum.Font.Gotham
ConsoleSearch.PlaceholderText = 'Search'
ConsoleSearch.TextSize = 14
ConsoleSearch.Size = UDim2.new(.2, 0, .15, 0)
ConsoleSearch.TextColor3 = Color3.fromRGB(212.00000256299973, 211.00000262260437, 212.00000256299973)
ConsoleSearch.TextXAlignment = Enum.TextXAlignment.Left
ConsoleSearch.TextYAlignment = Enum.TextYAlignment.Center
ConsoleSearch.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
ConsoleSearch.BackgroundTransparency = 1
ConsoleSearch.Text = ''
ConsoleSearch.Position = UDim2.new(1, 0, 0, 0)
ConsoleSearch.AnchorPoint = Vector2.new(1, 0)

ConsoleSearch.FocusLost:Connect(function(aaaaa)
 if not aaaaa then return end
 local words = ConsoleSearch.Text
 if words:sub(1,1) == '!' then -- the NOT operator
  words = words:sub(2, #words)
  for _, v in pairs(ConsoleFrame:GetChildren()) do
    if v:IsA("TextLabel") then
     local text = v.Text:gsub('[INFO] ', ''):gsub('[WARN] ', ''):gsub("[ERROR] ", ''):lower()
     if text:find(words:lower()) then v.Visible = false else v.Visible = true end
    end
  end
 else
  for _, v in pairs(ConsoleFrame:GetChildren()) do
   if v:IsA("TextLabel") then
    local text = v.Text:gsub('[INFO] ', ''):gsub('[WARN] ', ''):gsub("[ERROR] ", ''):lower()
    if not text:find(words:lower()) then v.Visible = false else v.Visible = true end
   end
  end
 end
end)

local ConsoleGlass = Instance.new("ImageLabel", ConsoleSearch)
ConsoleGlass.Image = 'rbxassetid://17558788274'
ConsoleGlass.BackgroundTransparency = 1
ConsoleGlass.Size = UDim2.new(0, 31, 0, 31)
ConsoleGlass.Position = UDim2.new(.95, 0, .5, 0)
ConsoleGlass.AnchorPoint = Vector2.new(.95, .5)

Instance.new("UICorner", Clear).CornerRadius = UDim.new(0, 8)
local MSGTemplate = Instance.new("TextLabel", nil)
MSGTemplate.BackgroundTransparency = 1
MSGTemplate.Font = Enum.Font.GothamMedium
MSGTemplate.Text = ''
MSGTemplate.TextColor3 = Color3.fromRGB(30, 117, 199)
MSGTemplate.BorderSizePixel = 0
MSGTemplate.TextXAlignment = Enum.TextXAlignment.Left
MSGTemplate.TextScaled = true
MSGTemplate.Size = UDim2.new(1, 0, .15, 0)
local TextThingajkw = Instance.new("UITextSizeConstraint", MSGTemplate)
TextThingajkw.MinTextSize = 12
TextThingajkw.MaxTextSize = 14
local UrlBox = Instance.new("TextBox", Converted['_apipage'])
UrlBox.PlaceholderText = 'URL'
UrlBox.Font = Enum.Font.GothamBold
UrlBox.Text = ''
UrlBox.Size = UDim2.new(1, 0, .1, 0)
UrlBox.Position = UDim2.new(0, 4, 0, 0)
UrlBox.TextColor3 = Color3.fromRGB(212, 211, 212)
UrlBox.BackgroundTransparency = 1
UrlBox.TextXAlignment = Enum.TextXAlignment.Left
UrlBox.TextScaled = true
local __ = Instance.new("UITextSizeConstraint", UrlBox)
__.MinTextSize = 12
__.MaxTextSize = 16
local UrlBox2 = UrlBox:Clone()
UrlBox2.Parent = Converted['_apipage']
UrlBox2.Position = UDim2.new(0, 4, .1, 0)
UrlBox2.PlaceholderText = 'Method'
local Send = Instance.new('ImageButton', Converted['_apipage'])
Send.BackgroundTransparency = 1
Send.Size = UDim2.fromOffset(35, 35)
Send.Image = 'rbxassetid://17568889033'
Send.Position = UDim2.new(.5, 0, .6, 0)
local Url = ''
local Method = "GET"
local Methods = {
 'HEAD',
 'POST',
 'PUT',
 'OPTIONS',
 'GET',
 'PING',
 'DELETE'
}

UrlBox.FocusLost:Connect(function(___)
 if not ___ then return end
 Url = UrlBox.Text
end)
UrlBox2.FocusLost:Connect(function(___)
 if not ___ then return end
 Method = UrlBox2.Text
end)
Send.MouseButton1Click:Connect(function()
 for i, v in pairs(request({
  Url = Url,
  Method = table.find(Methods, Method:upper()) and Method:upper() or 'GET'
 })) do print(i, v) end
end)

getgenv().print = function(...)
 local args = {...}
 local str = ''
 for i, v in pairs(args) do
  str = str .. tostring(v)
  if i ~= #args then
   str = str .. ' '
  end
 end
 local abb = MSGTemplate:Clone()
 abb.Parent = ConsoleFrame
 abb.Text = '[INFO] ' .. str
 return oldprint(...)
end
getgenv().warn = function(...)
 local args = {...}
 local str = ''
 for i, v in pairs(args) do
  str = str .. tostring(v)
  if i ~= #args then
   str = str .. ' '
  end
 end
 local abb = MSGTemplate:Clone()
 abb.Parent = ConsoleFrame
 abb.Text = '[WARN] ' .. str
 abb.TextColor3 = Color3.fromRGB(241,128,45)
 return oldwarn(...)
end
getgenv().error = function(str, level)
 local abb = MSGTemplate:Clone()
 abb.Parent = ConsoleFrame
 abb.Text = '[ERROR] ' .. str
 abb.TextColor3 = Color3.fromHex('#FF003F')
 return olderror(str, level)
end

function num2thing(num)
 if num < 1000 then return tostring(num) end
 if num > 1000 and num < 1000 * 1000 then
  return tostring(math.round(num / 1000)) .. 'K'
 elseif num > 1000 and num > 1000 * 1000 then
  return tostring(math.round(num / 1000 / 1000)) .. 'M'
 end
end

function main(searchFor)
    local Url = 'https://scriptblox.com/api/script/fetch'
    local query = 'page=1&q=' .. crypt.url.encode(searchFor)
    Url = Url .. (query and '?' .. query or '')
    local result = game:HttpGet(Url)
    for _, v in pairs(game:GetService("HttpService"):JSONDecode(result).result.scripts) do
     task.spawn(function()
     local info = game:GetService("HttpService"):JSONDecode(game:HttpGet('https://scriptblox.com/api/script/'..v.slug)).script
     local title = v.title
     local views = v.views
     local self = {
      verified = v.verified,
      free = v.scriptType == 'free',
      gameid = v.game and v.game.name ~= 'Universal Script 📌' and v.game.gameId or 'Universal',
      likes = info.likeCount,
      dislikes = info.dislikeCount,
      patched = v.isPatched,
      views = views,
      title = title,
      keyless = not v.key,
      code = info.script
     }
     local note = ("--[[\n SCRIPT DESCRIPTION: %s\n SCRIPT URL: %s\n]]\n"):format(info.features:gsub('\n', '\n '), 'https://scriptblox.com/script/' .. v.slug)
     local b = Template:Clone()
     b.Title.Text = self.title
     b.GameName.Text = v.game.name
     b.Add.MouseButton1Click:Connect(function()
      newTab(self.title, note .. self.code)
     end)
     b.Execute.MouseButton1Click:Connect(function()
      local s, e = loadstring('local s, e = pcall(function()\n' .. self.code .. '\nend) return s, e')()
      if not s then error(e) end
     end)
     b.Owner.Text = '@' .. v.owner.username
     b.Views.Text = num2thing(self.views) .. ' Views'
     b.DislikeCount.Text = tostring(self.dislikes)
     b.LikeCount.Text = tostring(self.likes)
     b.IsVerified.Visible = self.verified
     b.Parent = Scripts
     b.Visible = true
    end)
    end
end
SearchBar.FocusLost:Connect(function(a)
 if not a then return end
 for _, v in pairs(Scripts:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
 main(SearchBar.Text)
end)

local ripple = Instance.new("Frame")
ripple.BackgroundColor3 = Color3.fromRGB(194, 194, 194)
ripple.BackgroundTransparency = 1
ripple.Size = UDim2.new(0, 0, 0, 0)
ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
ripple.AnchorPoint = Vector2.new(0.5, 0.5)
ripple.ZIndex = 10
ripple.BorderSizePixel = 0
ripple.Parent = Converted["_execute"]

local rippleRound = Instance.new("UICorner")
rippleRound.CornerRadius = UDim.new(0, 7)
rippleRound.Parent = ripple

local ripple2 = ripple:Clone()
ripple2.Parent = Converted["_clear"]

local ripple3 = ripple:Clone()
ripple3.Parent = NewTab

local UserInputService = game:GetService('UserInputService');

local frame = Converted["_main"]

local isDragging = false
local dragStartPos = nil
local frameStartPos = nil

local function handleInput(input)
    if isDragging then
        local delta = input.Position - dragStartPos
        frame.Position = UDim2.new(
            frameStartPos.X.Scale, 
            frameStartPos.X.Offset + delta.X, 
            frameStartPos.Y.Scale, 
            frameStartPos.Y.Offset + delta.Y
        )
    end
end

local function startDrag(input)
    isDragging = true
    dragStartPos = input.Position
    frameStartPos = frame.Position
    input.UserInputState = Enum.UserInputState.Begin
end

local function stopDrag(input)
    isDragging = false
    input.UserInputState = Enum.UserInputState.End
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        startDrag(input)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        handleInput(input)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        stopDrag(input)
    end
end)

function getTab(index)
 local clone = {}
 for i, v in pairs(Tabs) do table.insert(clone, v) end
 return clone[index]
end
function selectTab(tab)
 for i, v in pairs(Tabs) do v.Instance.BackgroundColor3 = Color3.fromRGB(38.0000015348196, 38.0000015348196, 48.000000938773155) end
 tab.Instance.BackgroundColor3 = Color3.fromRGB(54.0000015348196, 54.0000015348196, 58.000000938773155)
 Converted["_tab1box"].Text = tab.Code
end
function newTab(name, code, custom)
 tabsamount = tabsamount + 1
 name = name or ('Tab #' .. tostring(tabsamount))
 local c = Converted["_scriptonetab"]:Clone()
 c.Name = name
 c.Text = name
 c.Parent = Converted['_scriptonetab'].Parent
 Tabs[c] = {Code=code or '', Instance=c}
 c.Visible = true
 c.MouseButton1Click:Connect(function()
  if SelectedTab then
   Tabs[SelectedTab].Code = Converted['_tab1box'].Text
  end
  SelectedTab = c
  selectTab(Tabs[SelectedTab])
 end)
 return c
end
Converted['_clear'].MouseButton1Click:Connect(function()
 if tabsamount <= 1 then Tabs[SelectedTab].Code = '' Converted['_tab1box'].Text = '' return end
 if SelectedTab then Tabs[SelectedTab] = nil SelectedTab:Destroy() end
 local tbl2 = {}
 for a, b in pairs(Tabs) do table.insert(tbl2, b) end
 tabsamount = tabsamount -1
 Converted['_tab1box'].Text = tbl2[#Tabs+1].Code
 SelectedTab = tbl2[#Tabs+1].Instance
 selectTab(tbl2[#Tabs+1])
end)
Converted['_execute'].MouseButton1Click:Connect(function()
 if SelectedTab then
  Tabs[SelectedTab].Code = Converted['_tab1box'].Text
 end
 local s,e = loadstring('local s, e = pcall(function()\n' .. Tabs[SelectedTab].Code .. '\nend) return s, e')()
 if not s then error('Error while executing script: ' .. e) end
end)
NewTab.MouseButton1Click:Connect(function()
 local newtab1 = newTab()
 Tabs[SelectedTab].Code = Converted['_tab1box'].Text
 SelectedTab = newtab1
 Converted['_tab1box'].Text = Tabs[SelectedTab].Code
 selectTab(Tabs[SelectedTab])
end)
SelectedTab = newTab()
SelectedTab.BackgroundColor3 = Color3.fromRGB(54.0000015348196, 54.0000015348196, 58.000000938773155)
local function updateLineNumbers()
    local textBoxText = Converted['_tab1box'].Text
    local lines = textBoxText:split('\n')
    local lineCount = #lines

    local newLineNumbers = ''
    for i = 1, lineCount do
        newLineNumbers = newLineNumbers .. tostring(i) .. '\n'
    end
    Converted['_tab1lines'].Text = newLineNumbers

    Tabs[SelectedTab].Code = textBoxText
end

Converted['_tab1box'].Changed:Connect(function(property)
    if property == "Text" then
        updateLineNumbers()
    end
end)
main('')
