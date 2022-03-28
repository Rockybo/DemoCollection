
import lldb
import shlex
import os
import time
from threading import Timer

def po_to_file(debugger, command, result, internal_dict):
    #Change the output file to a path/name of your choice
    f = open("./lldb_output.txt","a")
    debugger.SetOutputFileHandle(f, True);
    #Change command to the command you want the output of
    f.write("var name: " + command + "\n\n")
    
    debugger.HandleCommand('po %s' % (command))

def rm_po_cache(debugger, command, result, internal_dict):
    os.remove("./lldb_output.txt")
    print("deleted ./lldb_output.txt")

def delay_launch_shell_cmd(debugger, command, result, internal_dict):
    print("delay call: " + command)
    task = Timer(2.0, call_shell_cmd, [command])
    task.start()

def delay_launch_lldb_cmd(debugger, command, result, internal_dict):
    print("delay call: " + command)
    task = Timer(2.0, call_lldb_cmd, (debugger, command, result, internal_dict))
    task.start()

def call_shell_cmd(command):
	print("did call: " + command)
	os.system(command)

def call_lldb_cmd(*argv):
    debugger = argv[0] 
    command = argv[1]
    print("did call: " + command)
    debugger.HandleCommand('%s' % (command))

# def break_point_and_get_var(debugger, command, result, internal_dict):
#     """
#     set breakpoint and get variable value: file_name line_num var_name
#     """
 
#     argv = shlex.split(command) #获取输入的参数
#     debugger.HandleCommand('breakpoint set -f "%s -l %s"' % (argv[0], argv[1]))

#     interpreter = lldb.debugger.GetCommandInterpreter()
#     return_object = lldb.SBCommandReturnObject()     # 用来保存结果
#     interpreter.HandleCommand('dis', return_object)  # 执行dis命令
#     output = return_object.GetOutput(); #获取反汇编后的结果
 
#     br_index = output.rfind('br     x16') #查找最后的 bx x16
#     br_index = br_index - 20 #位置减去20
#     addr_index = output.index('0x', br_index) #查找0x开头的字符串
#     br_addr = output[br_index:br_index+11] #找到之后偏移11位
 
#     debugger.HandleCommand('b ' + br_addr) #添加断点
#     debugger.HandleCommand('continue') #运行
#     debugger.HandleCommand('si') #单步步入
#     print "hello, world"
 
def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand("command script add -f " + __name__ + ".po_to_file po2f")
    debugger.HandleCommand("command script add -f " + __name__ + ".rm_po_cache rm_po_cache")
    debugger.HandleCommand("command script add -f " + __name__ + ".delay_launch_shell_cmd delay_launch_shell_cmd")
    debugger.HandleCommand("command script add -f " + __name__ + ".delay_launch_lldb_cmd delay_launch_lldb_cmd")