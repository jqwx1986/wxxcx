@echo off
chcp 65001 >nul
cls
echo ====================================
echo 粤省事启动器 - 一键上传到 GitHub
echo ====================================
echo.
echo 仓库地址：https://github.com/jqwx1986/wxxcx.git
echo.

REM 检查 Git 是否安装
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Git，请先安装 Git
    echo.
    echo 下载地址：https://git-scm.com/download/win
    echo.
    echo 安装步骤：
    echo 1. 点击上面的链接下载 Git for Windows
    echo 2. 运行安装程序，一路点击"Next"
    echo 3. 安装完成后，重新运行本脚本
    echo.
    pause
    exit /b 1
)

echo [1/6] 初始化 Git 仓库...
git init
if %errorlevel% neq 0 (
    echo [错误] Git 初始化失败
    pause
    exit /b 1
)
echo ✓ Git 仓库初始化完成
echo.

echo [2/6] 配置远程仓库...
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    git remote add origin https://github.com/jqwx1986/wxxcx.git
    echo ✓ 远程仓库已添加
) else (
    git remote set-url origin https://github.com/jqwx1986/wxxcx.git
    echo ✓ 远程仓库已更新
)
echo.

echo [3/6] 配置 Git 用户信息...
echo.
echo 请输入你的 GitHub 用户名（默认：jqwx1986）：
set /p USERNAME=
if "%USERNAME%"=="" set USERNAME=jqwx1986

git config user.name "%USERNAME%"
git config user.email "%USERNAME%@users.noreply.github.com"
echo ✓ Git 用户信息已配置
echo.

echo [4/6] 添加所有文件到暂存区...
git add .
echo ✓ 文件已添加
echo.

echo [5/6] 提交代码...
git commit -m "Initial commit: 粤省事小程序启动器"
if %errorlevel% neq 0 (
    echo.
    echo [警告] 没有文件需要提交，或提交失败
    echo.
) else (
    echo ✓ 代码已提交
)
echo.

echo [6/6] 推送代码到 GitHub...
echo.
echo ====================================
echo 重要提示
echo ====================================
echo.
echo 推送时需要身份验证：
echo 1. 用户名：输入 %USERNAME%
echo 2. 密码：输入 GitHub Personal Access Token（不是 GitHub 密码！）
echo.
echo 如果还没有 Token，请按以下步骤创建：
echo.
echo 1. 访问：https://github.com/settings/tokens
echo 2. 点击 "Generate new token" → "Generate new token (classic)"
echo 3. 勾选 "repo" 权限
echo 4. 点击 "Generate"
echo 5. 复制生成的 Token（只显示一次！）
echo.
echo ====================================
echo.

pause

REM 检查是否在 main 分支
git branch --show-current >nul 2>&1
if %errorlevel% neq 0 (
    git checkout -b main
    echo 已创建并切换到 main 分支
    echo.
)

REM 推送到 GitHub
echo 正在推送代码...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ====================================
    echo ✓ 上传成功！
    echo ====================================
    echo.
    echo 下一步：
    echo 1. 访问：https://github.com/jqwx1986/wxxcx/actions
    echo 2. 等待 GitHub Actions 自动构建（约 5-10 分钟）
    echo 3. 构建完成后下载 APK 文件
    echo.
    echo 构建页面：https://github.com/jqwx1986/wxxcx/actions
    echo.
) else (
    echo.
    echo ====================================
    echo ✗ 上传失败
    echo ====================================
    echo.
    echo 可能的原因：
    echo - Token 输入错误或过期
    echo - 网络连接问题
    echo - 没有正确的权限
    echo.
    echo 解决方法：
    echo 1. 检查 Token 是否正确
    echo 2. 确保网络连接正常
    echo 3. 重新生成 Token 并重试
    echo.
)

echo.
pause
