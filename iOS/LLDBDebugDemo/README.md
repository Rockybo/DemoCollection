## README

### 用法

1. `Xcode` 打开 `LLDBDebugDemo.xcodeproj`，选择对应的模拟器，`cmd + R`。
2. `cmd + .` 结束运行。
3. Xcode - Products - LLDBDebugDemo.app - `show in Finder`。
4. 把源码目录下的 `lldb_debug.cmd` 和 `lldb_helper.py` 复制到 `LLDBDebugDemo.app` 所在目录。
5. 终端切换到 `LLDBDebugDemo.app` 所在目录。
6. 终端执行 `lldb --source lldb_debug.cmd`。
7. 此时终端会在模拟器启动 `LLDBDebugDemo.app`，不过进程是处于暂停的状态。
8. 终端输入 `continue` 继续执行。
9. 点击模拟器上的 `Test` 按钮，此时在 `LLDBDebugDemo.app` 所在目录下会生成 `lldb_output.txt` 文件，里面记录了变量值和变量名，如下所示。

```
100000000

var name: limit2

999999999

var name: limit1

9999

var name: limit3
```

### 后续思路

1. 结合语法分析，自动生成类似 `lldb_debug.cmd` 的文件，主要是确定在哪一行设置断点，以及断点时需要打印的变量名是什么，然后按需设置断点和变量名，类似：

```

breakpoint set --file StringUtility.m --line 35
br com add 2
po2f limit2
c
DONE

```

2. 通过另外的脚本或程序处理变量的输出 `lldb_output.txt`，生成新的测试用例。

### 难点处理

对于复杂对象类型，输出到文件后如何通过代码创建？（可以考虑保存二进制，然后从二进制恢复到内存）

#### 参考

1. https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/gdb_to_lldb_transition_guide/document/lldb-command-examples.html
2. https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/gdb_to_lldb_transition_guide/document/lldb-terminal-workflow-tutorial.html
3. https://stackoverflow.com/questions/54682602/how-to-automate-capturing-output-data-with-lldb-if-that-data-is-only-available-o