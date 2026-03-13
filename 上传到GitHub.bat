@echo off
chcp 65001 >nul
echo ====================================
echo 粤省事启动器 - GitHub 上传脚本
echo ====================================
echo.

REM 检查是否已初始化 Git
if not exist ".git" (
    echo [1/4] 初始化 Git 仓库...
    git init
    echo ✓ Git 仓库初始化完成
    echo.
) else (
    echo ✓ Git 仓库已存在
    echo.
)

REM 检查是否已添加远程仓库
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo [2/4] 请输入你的 GitHub 仓库地址：
    echo 格式：https://github.com/你的用户名/仓库名.git
    echo.
    set /p REPO_URL="仓库地址: "
    git remote add origin %REPO_URL%
    echo ✓ 远程仓库已添加
    echo.
) else (
    echo ✓ 远程仓库已配置
    echo.
)

echo [3/4] 添加文件到暂存区...
git add .
echo ✓ 文件已添加
echo.

echo [4/4] 提交代码...
git commit -m "Initial commit: 粤省事小程序启动器"
echo ✓ 代码已提交
echo.

echo ====================================
echo 推送代码到 GitHub...
echo ====================================
echo.

REM 检查分支
git branch --show-current >nul 2>&1
if %errorlevel% neq 0 (
    git checkout -b main
)

echo 正在推送代码到 main 分支...
git push -u origin main
echo.

if %errorlevel% equ 0 (
    echo ====================================
    echo ✓ 代码推送成功！
    echo ====================================
    echo.
    echo 下一步：
    echo 1. 访问你的 GitHub 仓库页面
    echo 2. 点击 "Actions" 标签
    echo 3. 等待构建完成（约 3-5 分钟）
    echo 4. 下载构建的 APK 文件
    echo.
) else (
    echo ====================================
    echo ✗ 代码推送失败
    echo ====================================
    echo.
    echo 可能的原因：
    echo - 仓库地址不正确
    echo - 没有在 GitHub 上创建仓库
    echo - 没有配置 GitHub 认证
    echo.
    echo 解决方法：
    echo 1. 访问 https://github.com/new 创建仓库
    echo 2. 配置 GitHub Personal Access Token
    echo - Settings -^> Developer settings -^> Personal access tokens
    echo - 生成 token 时选择 "repo" 权限
    echo - 使用 token 作为密码进行身份验证
    echo.
)

pause
