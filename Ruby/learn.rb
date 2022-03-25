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
