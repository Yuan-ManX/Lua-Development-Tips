
-------------------------- print 注释 --------------------------------
-- Debug 功能
print('Lua Tips!')

-- 注释 

--[[
    多行注释-1
]]

--[[
    多行注释-2
]]--


-------------------------- 变量类型(动态类型) --------------------------------

-- 获取变量类型
typ = type('123')

-- 变量(nil、Numbe、String、Boolean)
a = nil
b = 2
c = 'lua 字符串'
d = true


-------------------------- 字符串操作及运算符 -------------------------------

-- 获取字符串长度 # 号
s = 'asbabsab'
print(#a)

-- 字符串多行打印
print('123\n123')

s = [[
    123
    45
    678
    9
]]
print(s)

-- 字符串拼接 通过..
print( '123' .. '456' )

-- %d 与数字拼接
-- %a 与任何字符拼接
-- %s 与字符配对
print(string.format("你猜猜这是哪里，那个%d呢", R))

-- 字符串转换类型
a = 1
print(tostring(a))


--------------------------- 条件判断 --------------------------------

-- 条件分支语句
a = 9

--if 条件 then ...end
-- 单分支
if a > 5 then
    print('111')
end

-- 双分支
--if 条件 then ...else...end
if a < 5 then
    print('123')
else
    print('456')
end

-- 多分支
--if 条件 then ...elseif...else...end
if a > 5 then
    print('123')
elseif a == 9 then
    print('456')
elseif a == 8 then
    print('789')
else
    print('0')
end



--------------------------- 循环(3种) --------------------------------

-- while语句
-- while 条件 do ......end
num = 1
while num < 10 do
    print(num)
    num = num + 1
end

-- do while语句
-- repeat ......until 条件(结束条件)
num = 0
repeat
    print(num)
    num = num + 1
until num > 10 --满足条件跳出 结束条件

-- for语句
-- for ...do...end
for i = 1,5 do -- 默认递增 i会默认+1
    print(i)
end

for i = 1,5,2 do -- 默认递增 i会默认+1
    print(i)
end

-- 减小
for i = 5,1,-1 do -- 默认递增 i会默认+1
    print(i)
end



--------------------------- function 函数 --------------------------------

-- function 函数

-- function 函数名()
-- end

-- a = function()
-- end

-- 无参数无返回值
function name()
    print('123')
end
-- 调用
name()

-- 有参数
function name(x)
    print('args:'..x)
end
-- 调用
name(1)

-- 有返回值
function name(x)
    return x + 1
end
-- 调用
result = name(1)

-- 函数的类型
data = function ()
    print('123')
end
print(type(data))

-- 函数的重载(函数名相同，参数类型不同或者参数个数不同)
-- lua中 函数不支持重载 默认调用最后一个声明的函数

-- 变长参数
function name(...)
    -- 变长参数使用 用一个表存起来 再用
    arg = {...}
    -- 查看参数
    for i=1,#agr do
        print(arg[i])
    end
end
-- 实例
name(1,2,3,4,5,6,7,8,9)

-- 函数嵌套
function name()
    name_01 = function ()
        print('123')
    end
    return name_01
end
-- 调用
data = name()
data()

-- 第二种写法(闭包)
function name(x)
    -- 改变传入参数的生命周期
    return function (y)
        return x + y
    end
end
-- 调用
data = name(10)
print(data(1))



--------------------------- table 表 --------------------------------

-- table 表 (复杂数据类型)
-- 所有的复杂类型都是table(表)

-- 数组
array = {1,2,3,4,5,6}
-- lua 的索引从1开始
print(array[1])
-- #号是通用的获取长度的关键字
-- 在打印长度时 空被忽略
-- 如果表中某一位变成nil 会影响#获取的长度
print(#array)

-- 数组的遍历
for i=1,#a do
    print(array[i])
end

-- 二维数组
a = {{1,2,3},
    {4,5,6}}
print(a[1[1]])

-- 二维数组的遍历
for i=1,#a do
    b = a[i]
    for j=1,#b do
        print(b[j])
    end
end

-- 自定义索引
data = {[0] = 1, 2, 3, [-1] = 6, 5}
print(data[0])
print(#data)

-- 迭代器遍历
-- # 号得到长度 其实并不准确 一般不用#来遍历
a = {[0] = 1, 2, 3, 4, [-1] = 5}

-- ipairs
-- ipairs遍历 还是 从1开始往后遍历的 小于等于0的值得不到
-- 只能找到连续索引的 键 如果中间断序了 它也无法遍历出后面的内容
for i,k in ipairs(a) do
    print("ipairs遍历键值"..i.."_"..k)
end

-- pairs 能够找到所有键值
for i,v in pairs(a) do
    print("pairs遍历键值"..i.."_"..k)
end

-- 只有索引键
for i in pairs(a) do
    print("pairs遍历键值"..i)
end


-- 字典
-- 字典的声明
-- 字典是由键值对构成
a = {['名字'] = '你猜', ['年龄'] = 100}
print(a['名字'])

-- 字典的遍历
-- 如果要模拟字典 遍历一定要用pairs
for k,v in pairs(a) do
    print(k,v)
end

for k in pairs(a) do
    print(k)
end



-- 类和结构体
-- lua 中默认没有oop 需要自己来实现
data = {
    age = 100,
    name = 'dog',
    up = function ()
        print('哮天犬')
    end
}
-- 类似一个类中有很多 静态变量和函数
print(data.age)
data.up()



-- 表的公共操作
data1 = {{age = 100, name = 'dog'}, {age = 50, name = 'cat'}}
data2 = {{age = 1, name = 'pig'}}

-- 插入
print(#data1)
table.insert(data1, data2)
print(#data1)

-- 删除指定元素 remove
-- remove方法 传表进去 会移除最后一个索引的内容
table.remove(data1)
print(#data1)

-- remove方法 传两个参数 第一个参数 是要移除内容的表
-- 第二个参数 是要移除内容的索引
table.remove(data1, 1)

-- 拼接 table.concat
tb = {'123', '456'}
-- 连接函数 用于拼接表中元素 返回值 是一个字符串
str = table.concat(tb, ":")
print(str)




--------------------------- userdata 数据结构 --------------------------------

-- userdata 数据结构



--------------------------- thread 协同程序 异步 --------------------------------

-- thread 协同程序 异步

-- 协程的创建
-- coroutine.create() 常用方法 返回值是一个thread对象
fun = function ()
    print('协程启动！')
end
-- 创建
co = coroutine.create(fun)
-- 协程的本质是一个线程对象
print(co)
print(type(co))

-- coroutine.warp() 返回值是一个函数
co2 = coroutine.wrap(fun)
print(co2)
print(type(co2))


-- 协程的运行
-- 第一种方式 对应的 create创建的协程
coroutine.resume(co)
-- 第二种方式 
co2()


-- 协程的挂起
fun2 = function ()
    while true do
        print('协程启动！')
        -- 协程的挂起函数
        coroutine.yield()
    end  
end

co3 = coroutine.create(fun2)
coroutine.resume(co3)


-- 协程的状态
-- coroutine.status(协程对象)
-- dead 结束
-- suspended 暂停
-- running 进行中
print(coroutine.status(co3))
print(coroutine.status(co))

-- 这个函数可以得到当前正在 运行的协程的线程号
print(coroutine.running())




--------------------------- metatable 元表 --------------------------------

-- 元表概念
-- 任何表变量都可以作为另一个表变量的元素
-- 任何表变量都可以有自己的元素
-- 当子表中进行一些特定操作时 会执行元素的内容

-- 设置元表
meta = {}
myTable = {}

-- 设置元表函数
-- 第一个参数 子表
-- 第二个参数 元表
setmetatable(myTable, meta)


-- 特定操作
-- 特定操作 tostring
meta2 = {
    -- 当子表要被当成字符串使用时，会默认调用这个元素中的tostring方法
    _tostring = function (n)
        return n.name
    end
}
myTable2 = {
    name = '123'
}

-- 设置元表函数
-- 第一个参数 子表
-- 第二个参数 元表
setmetatable(myTable2, meta2)
print(myTable2)


-- 特定操作 call
meta3 = {
    -- 当子表要被当成字符串使用时，会默认调用这个元素中的__tostring方法
    __tostring = function (n)
        return n.name
    end,
    -- 当子表被当成一个函数来使用时，会默认调用这个__call中的内容
    __call = function (a)
        print(a)
        print('123')
    end
}
myTable3 = {
    name = '123'
}

-- 设置元表函数
-- 第一个参数 子表
-- 第二个参数 元表
setmetatable(myTable3, meta3)
print(myTable3)

myTable3(1)




-- 特定操作 运算符重载
meta4 = {
    -- 相当于运算符重载 当子表使用+运算符时 会调用这个方法
    -- 运算符+
    __add = function (t1, t2)
        return t1.age + t2.age
    end,
    -- 运算符-
    __sub = function (t1, t2)
        return t1.age - t2.age
    end,
    -- 运算符*
    __mul = function (t1, t2)
        return t1.age * t2.age
    end,
    -- 运算符/
    __div = function (t1, t2)
        return t1.age / t2.age
    end
}

myTable4 = {age = 1}
setmetatable(myTable4, meta4)
myTable5 = {age = 2}

print(myTable5 + myTable4)
print(myTable5 - myTable4)  


-- 特定操作 index和newIndex
meta6 ={
    age = 1
    -- __index = {age = 2}
}
meta6.__index = meta6

myTable6 = {}
setmetatable(myTable6, meta6)

-- __index 当子表中 找不到某一个属性时
-- 会到元素中 __index指定的表去找索引
print(myTable6.age)


-- newIndex 当赋值时，如果赋值一个不存在的索引
-- 那么会把这个值 赋值到newIndex所指的表中 不会修改自己
meta7 = {}
myTable7 = {}
meta7.__newindex = {}

setmetatable(myTable7, meta7)





--------------------------- OOP 面向对象设计 --------------------------------

-- 封装
-- 面向对象 类 其实都是基于 table来实现
-- 元表相关的知识点
Object = {}
Object.id = 1

function Object:Test()
    print(self.id)
end


-- 冒号 是会自动将调用这个函数的对象 作为第一个参数传入的写法
function Object:new()
    -- self 代表的是 我们默认传入的第一个参数
    -- 对象就是变量 返回一个新的变量
    -- 返回出的内容 本质上就是表对象
    local obj = {}
    -- 元表知识 __index 当找自己的变量 找不到时 就会去找元表当中__index指向的内容
    self.__index = self
    setmetatable(obj, self)
    return obj
end

local myObj = Object:new()
print(myObj)
print(myObj.id)
myObj:Test()
-- 对空表中 申明一个新的属性 叫做id
myObj.id = 2
print(myObj.id)



-- 继承
-- 写一个用于继承的方法
function Object:subClass(className)
    -- _G知识点 是总表 所有声明的全局标量 都以键值对的形式存在其中
    _G[className] = {}
    -- 写继承的规则
    -- 用到元表
    local obj = _G[className]
    self.__index = self

    -- 子类 定义个base属性 base属性代表父类
    obj.base = self
    setmetatable(obj, self)
end

Object:subClass("Person")

local p1 = Person:new()
print(p1)
p1,id = 1
print(p1.id)

Object:subClass("Monster")
local ml = Monster:new()
print(m1)
ml.id = 2
print(ml.id)



-- 多态
-- 相同行为 不同表象 就是多态
-- 形同方法 不同执行逻辑 就是多态
Object.subClass("GameObject")
GameObject.posX = 0
GameObject.posY = 0
function GameObject:Move()
    self.posX = self.posX + 1
    self.posY = self.posY + 1
    print(self.posX)
    print(self.posY)
end

GameObject:subClass("Player")
function Player:Move()
    -- base 指的是 GameObject 表（类）
    -- 这种方法调用 相当于是把基类 作为第一个参数传入了方法中
    -- self.base:Move()
    self.base.Move(self)
end

local p1 = Player:new()
p1:Move()

local p2 = Player:new()
p2:Move()





------------------------------- 自带库文件(string\table\os\math\package) ---------------------------------

-- string

-- table

-- 时间
print(os.time())
-- 自己传入参数 得到时间
print(os.time({year = 2022, mouth = 11}))


-- 数学运算
-- math

-- 绝对值
print(math.abs(-1))
-- 弧度转角度
print(math.deg(math.pi))
-- 三角函数 传弧度
print(math.cos(math.pi))

-- 向下向上取整
print(math.floor(2.6))
print(math.ceil(5.2))

-- 最大最小值
print(math.max(1, 2))
print(math.mix(4, 5))

-- 小数分离 分成整数和小数部分
print(math.modf(1.2))

-- 幂运算
print(math.pow(2, 5))

-- 随机数
print(math.random(100))

-- 开方
print(math.sqrt(4))


-- 路径
-- lua脚本加载路径
print(package.path)
package.path = package.path .. ";C:\\"
print(package.path)