# GitHub Actions 自动构建 APK 完整操作指南

## 📋 前置要求

- ✅ 已有 GitHub 账号（如果没有：https://github.com/signup）
- ✅ 已安装 Git（Windows 10/11 通常自带）
- ✅ 项目代码已准备好

---

## 第一步：创建 GitHub 仓库

### 1.1 登录 GitHub
访问：https://github.com/login

### 1.2 创建新仓库
1. 点击右上角 `+` 号 → `New repository`
2. 填写信息：
   - **Repository name**: `yueshengshi-launcher` （或任意名称）
   - **Description**: `粤省事小程序启动器`
   - **Public/Private**: 选择 `Private`（私有）或 `Public`（公开）
3. 点击 `Create repository`

### 1.3 记录仓库地址
创建成功后，你会看到类似这样的地址：
```
https://github.com/你的用户名/yueshengshi-launcher.git
```
**复制这个地址，后面要用！**

---

## 第二步：配置 GitHub 认证（重要！）

### 方法 A：使用 Personal Access Token（推荐）

#### 2.1 生成 Token
1. 点击 GitHub 右上角头像 → `Settings`
2. 左侧菜单选择 `Developer settings`
3. 点击 `Personal access tokens` → `Tokens (classic)`
4. 点击 `Generate new token` → `Generate new token (classic)`

#### 2.2 配置 Token 权限
填写：
- **Note**: `Git Upload Token`
- **Expiration**: 选择 90 days 或 No expiration
- **Select scopes**: 勾选 `repo`（这会选中所有 repo 相关权限）

点击 `Generate token`

#### 2.3 复制 Token
⚠️ **重要**：Token 只显示一次，立即复制并保存！

#### 2.4 配置 Git 使用 Token
打开 PowerShell 或命令提示符，执行：

```powershell
# 配置 Git 用户信息（如果还没配置）
git config --global user.name "你的GitHub用户名"
git config --global user.email "你的GitHub邮箱"

# 以后推送时，密码使用这个 Token
```

**注意**：当代码推送时，用户名填 GitHub 用户名，**密码填 Token**（不是 GitHub 密码）

---

### 方法 B：使用 SSH Key（更安全，但配置复杂）

如果你熟悉 SSH，可以配置 SSH Key：
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id_ed25519.pub  # 复制公钥
```

然后添加到 GitHub：Settings → SSH and GPG keys → New SSH key

---

## 第三步：上传代码到 GitHub

### 方法 A：使用自动脚本（最简单）

#### 3.1 运行上传脚本
1. 进入项目文件夹：
   ```powershell
   cd C:\Users\文兄\CodeBuddy\20260310170730
   ```

2. 双击运行 `上传到GitHub.bat`

3. 按照提示输入：
   - 仓库地址：粘贴第一步复制的地址
   - 如果需要认证：
     - 用户名：你的 GitHub 用户名
     - 密码：**粘贴刚才生成的 Token**

4. 等待上传完成

---

### 方法 B：使用命令行

#### 3.1 初始化 Git 仓库
```powershell
cd C:\Users\文兄\CodeBuddy\20260310170730
git init
```

#### 3.2 添加远程仓库
```powershell
git remote add origin https://github.com/你的用户名/yueshengshi-launcher.git
```

#### 3.3 提交代码
```powershell
git add .
git commit -m "Initial commit: 粤省事小程序启动器"
```

#### 3.4 推送到 GitHub
```powershell
git branch -M main
git push -u origin main
```

**推送时如果要求身份验证**：
- 用户名：GitHub 用户名
- 密码：**粘贴 Token**

---

## 第四步：等待自动构建

### 4.1 查看构建状态
1. 访问你的 GitHub 仓库
2. 点击顶部的 **"Actions"** 标签
3. 你会看到正在运行的构建任务

### 4.2 构建流程
GitHub Actions 会自动：
1. ✅ 检出代码
2. ✅ 设置 JDK 11 环境
3. ✅ 下载 Gradle 和依赖
4. ✅ 编译代码
5. ✅ 构建 Debug APK
6. ✅ 构建 Release APK
7. ✅ 上传 APK 到 Artifacts

### 4.3 构建时间
- 首次构建：约 8-10 分钟
- 后续构建：约 5-7 分钟

---

## 第五步：下载 APK

### 5.1 访问构建页面
1. 在 GitHub 仓库点击 `Actions` 标签
2. 点击最近的构建任务（带有绿色 ✓）
3. 滚动到页面最底部

### 5.2 下载 APK
在 **"Artifacts"** 区域，你会看到两个文件：

| 文件名 | 说明 | 推荐度 |
|--------|------|--------|
| `yueshengshi-debug` | 测试版本 | 测试用 |
| `yueshengshi-release` | 正式版本 | ✅ 推荐 |

**点击下载**

### 5.3 解压文件
下载的是 `.zip` 文件，解压后得到 `.apk` 文件：
- `app-debug.apk`
- `app-release.apk`

---

## 第六步：安装到手机

### 6.1 传输 APK
选择一种方式：
- USB 数据线直接传输
- 微信/QQ 发送到手机
- 百度网盘等云盘
- 邮件发送

### 6.2 允许安装未知来源应用
1. 打开手机 `设置`
2. 搜索"安装未知来源应用"
3. 允许你用来打开 APK 的应用（如文件管理器）

### 6.3 安装 APK
1. 在手机上找到 `.apk` 文件
2. 点击文件
3. 点击 `安装`
4. 等待安装完成

### 6.4 测试运行
1. 打开"粤省事启动器"应用
2. 点击"立即打开"按钮
3. 应该会自动跳转到粤省事小程序

---

## 🎉 完成！

现在你已经有了一个可以使用的 APK 文件了！

---

## 📸 操作流程图解

```
创建 GitHub 仓库
      ↓
生成认证 Token
      ↓
运行上传脚本
      ↓
等待自动构建 (5-10分钟)
      ↓
下载 APK 文件
      ↓
安装到手机
      ↓
完成！
```

---

## 🔧 常见问题

### Q1: 推送代码时提示身份验证失败
**A:**
- 确保使用的是 Token，不是 GitHub 密码
- 检查 Token 是否有 `repo` 权限
- 尝试重新生成 Token

### Q2: GitHub Actions 构建失败
**A:**
- 查看详细错误日志
- 常见原因：
  - Gradle 配置问题
  - 依赖下载失败
  - 代码语法错误
- 重新触发构建

### Q3: APK 安装失败
**A:**
- 检查手机系统版本（需要 Android 7.0+）
- 允许"未知来源"应用安装
- 重新下载 APK

### Q4: 打开应用后无法跳转
**A:**
- 确保手机已安装微信
- 检查微信是否是最新版本
- 重启手机后重试

### Q5: 如何重新构建新版本？
**A:**
- 修改代码
- 提交并推送：`git push`
- GitHub Actions 会自动触发新构建

---

## 📚 相关文档

- [GitHub Actions 官方文档](https://docs.github.com/cn/actions)
- [Git 官方文档](https://git-scm.com/doc)
- [Personal Access Token 创建指南](https://docs.github.com/cn/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)

---

## 🆘 需要帮助？

如果遇到问题：
1. 检查这篇文档的"常见问题"部分
2. 查看 GitHub Actions 的构建日志
3. 搜索 GitHub Issues

祝你构建顺利！🚀
