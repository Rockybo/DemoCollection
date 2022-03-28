command script import ./lldb_helper.py
rm_po_cache

target create "LLDBDebugDemo.app"

breakpoint set --file StringUtility.m --line 20
br com add 1
po2f limit1
c
DONE

breakpoint set --file StringUtility.m --line 35
br com add 2
po2f limit2
c
DONE

breakpoint set --file StringUtility.m --line 52
br com add 3
po2f limit3
c
DONE

delay_launch_shell_cmd xcrun simctl launch booted com.huya.LLDBDebugDemo
process attach -n LLDBDebugDemo --waitfor
