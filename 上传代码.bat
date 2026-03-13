@echo off
chcp 65001 >nul
cd /d C:\Users\文兄\CodeBuddy\20260310170730

echo ====================================
echo 初始化 Git 仓库并上传代码
echo ====================================
echo.

REM 使用完整路径调用 Git
set GIT_PATH=C:\Program Files\Git\bin\git.exe
if not exist "%GIT_PATH%" set GIT_PATH=C:\Program Files (x86)\Git\bin\git.exe
if not exist "%GIT_PATH%" set GIT_PATH=D:\Program Files\Git\bin\git.exe

echo [1/5] 初始化 Git 仓库...
"%GIT_PATH%" init
if %errorlevel% neq 0 (
    echo [错误] Git 初始化失败，请检查 Git 安装路径
    echo 当前尝试的路径: %GIT_PATH%
    pause
    exit /b 1
)
echo [√] Git 仓库初始化完成
echo.

echo [2/5] 配置远程仓库...
"%GIT_PATH%" remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    "%GIT_PATH%" remote add origin https://github.com/jqwx1986/wxxcx.git
    echo [√] 远程仓库已添加
) else (
    "%GIT_PATH%" remote set-url origin https://github.com/jqwx1986/wxxcx.git
    echo [√] 远程仓库已更新
)
echo.

echo [3/5] 配置 Git 用户信息...
"%GIT_PATH%" config user.name "jqwx1986"
"%GIT_PATH%" config user.email "jqwx1986@users.noreply.github.com"
echo [√] Git 用户信息已配置
echo.

echo [4/5] 添加所有文件到暂存区...
"%GIT_PATH%" add .
if %errorlevel% neq 0 (
    echo [警告] 添加文件失败
)
echo [√] 文件已添加
echo.

echo [5/5] 提交代码...
"%GIT_PATH%" commit -m "Initial commit: 粤省事小程序启动器"
if %errorlevel% neq 0 (
    echo [警告] 提交失败或没有文件需要提交
) else (
    echo [√] 代码已提交
)
echo.

echo ====================================
echo 推送代码到 GitHub
echo ====================================
echo.
echo 重要提示：
echo 1. 用户名输入：jqwx1986
echo 2. 密码输入：GitHub Personal Access Token（不是GitHub密码）
echo.
echo 还没有Token？访问创建：
echo https://github.com/settings/tokens
echo.

"%GIT_PATH%" branch -M main

echo 正在推送代码，请在弹出的窗口中输入用户名和Token...
"%GIT_PATH%" push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ====================================
    echo [√] 上传成功！
    echo ====================================
    echo.
    echo 下一步：
    echo 1. 访问：https://github.com/jqwx1986/wxxcx/actions
    echo 2. 等待 GitHub Actions 自动构建（5-10分钟）
    echo 3. 下载 APK 文件
    echo.
    echo 构建页面：https://github.com/jqwx1986/wxxcx/actions
    echo.
) else (
    echo.
    echo ====================================
    echo [×] 上传失败
    echo ====================================
    echo.
    echo 请检查：
    echo - Token 是否正确
    echo - 网络连接是否正常
    echo.
)

pause
