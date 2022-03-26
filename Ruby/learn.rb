# ruby 的中文编码
#!/usr/bin/ruby -w
# -*- coding: UTF-8 -*-

# ruby 环境变量
# env 命令来查看所有环境变量的列表。例如： ➜gem env / pod env


# Ruby BEGIN 语句
puts "这是主 Ruby 程序"
 
BEGIN {
   puts "初始化 Ruby 程序"
}
# 初始化 Ruby 程序
# 这是主 Ruby 程序

# Ruby END 语句
puts "这是主 Ruby 程序"
 
END {
   puts "停止 Ruby 程序"
}
BEGIN {
   puts "初始化 Ruby 程序"
}

# 注释
=begin

=end

# 数组
arry = ["1", 10, "3"]
arry.each do | i |
    puts i
end

#hash
hsh = colors = {"red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f}
hsh.each do |key, value|
    print key, " is ", value, "\n"
end

# 范围类型
(10..15).each do |n|
    print n, '-'
end  

# 类
$cus = "cus1" # 全局变量
class Customer
    @@no_of_customers = 0 # 类变量
    @cust_id = "1" # 实例变量
    def initialize(id, name, adr)
        @cust_id = id 
        @cust_name = name
        @cust_addr = addr
    end
    def buy # 
        _price = 10 # 局部变量
        sum = _price * 10 #局部变量
    end

    def Customer.return_date # 类方法
    end
 
end
cust1 = Customer.new
cust2 = Customer.new("1", "John", "beijing")

Customer.return_date # 调用类方法
# __FILE__: 当前源文件的名称
# __LINE__: 当前行在源文件中的编号

# <=> 联合比较运算符。如果第一个操作数等于第二个操作数则返回 0，如果第一个操作数大于第二个操作数则返回 1，如果第一个操作数小于第二个操作数则返回 -1


age = 5
case age
when 0..2
    puts "婴儿"
when 3..6
    puts "小孩"
else
    puts "其他年龄"
end

i = 0
num = 5
# do 可以忽略不写
while i < num do
    puts "循环语句 i = #{i}"
    i+=1
end


a = 0
b = 5
begin
   puts("在循环语句中 a = #{a}" )
   a +=1
end while a < b

for i in 0..5
    puts "局部变量的值为 #{i}"
end

(0..5).each do |i|
    puts "局部变量的值为 #{i}"
end

# break 语句
for i in 0..5
    if i > 2 then
       break
    end
    puts "局部变量的值为 #{i}"
end

# next 语句：跳到循环的下一个迭代。如果在块内调用，则终止块的执行（yield 表达式返回 nil）。
for i in 0..5
    if i < 2 then
       next
    end
    puts "局部变量的值为 #{i}"
 end

 # ruby的方法，默认都有一个返回值，这个返回的值是最后一个语句的值
 # return 用于返回一个或多个返回值
 def test
    i = 100
    j = 200
    k = 300
 return i, j, k
 end

 # 可变数量的参数
 def sample (*test)
    puts "参数个数为 #{test.length}"
    for i in 0...test.length
       puts "参数值为 #{test[i]}"
    end
 end
 sample "Zara", "6", "F"
 sample "Mac", "36", "M", "MCA"

 # BEGIN 和 END 块
BEGIN { 
# BEGIN 代码块
puts "BEGIN 代码块"
} 

END { 
# END 代码块
puts "END 代码块"
}
# MAIN 代码块
puts "MAIN 代码块"

=begin
打印结果如下：
    BEGIN 代码块
    MAIN 代码块
    END 代码块
=end

# Ruby 中的 Mixins
module A
    def a1
    end
    def a2
    end
end
module B
    def b1
    end
    def b2
    end
end

class Sample
include A
include B
    def s1
    end
end
samp=Sample.new
samp.a1
samp.a2
samp.b1
samp.b2
samp.s1