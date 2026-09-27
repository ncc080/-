@echo off
:: ===== 息屏工具 =====
:: 关闭显示器（屏幕熄灭），但系统/程序继续运行。
:: 移动鼠标或按任意键即可唤醒屏幕。
:: 原理：向系统广播 SC_MONITORPOWER 消息（参数 2 = 关闭显示器）。

:: 隐藏窗口标题闪烁，直接执行
powershell -NoProfile -Command "$t = Add-Type -MemberDefinition '[DllImport(\"user32.dll\")] public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);' -Name Win32 -Namespace Win -PassThru; $t::SendMessage(-1, 0x0112, 0xF170, 2)" >nul 2>&1

exit /b
