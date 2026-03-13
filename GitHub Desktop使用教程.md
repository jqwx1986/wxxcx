# GitHub Desktop 详细使用教程

## 第一步：下载和安装 GitHub Desktop

### 1.1 下载
访问以下链接：
https://desktop.github.com/

点击 "Download for Windows" 按钮

### 1.2 安装
1. 双击下载的安装程序（.exe 文件）
2. 点击 "Install"
3. 等待安装完成
4. 点击 "Finish"

---

## 第二步：登录 GitHub 账号

### 2.1 启动 GitHub Desktop
安装完成后，GitHub Desktop 会自动启动

### 2.2 登录
1. 选择 "Sign in to GitHub.com"
2. 输入你的 GitHub 用户名：`jqwx1986`
3. 输入密码
4. 点击 "Sign in"

### 2.3 授权
点击 "Authorize GitHub Desktop" 按钮授权访问

---

## 第三步：创建仓库并推送代码

### 3.1 创建新仓库

1. **打开 GitHub Desktop**
   - 点击左上角的 `+` 号（或者 `File` → `Add Local Repository`）

2. **选择项目文件夹**
   - 点击 `Create a new repository on your hard drive`
   - **Name**：`wxxcx`（或任意名称）
   - **Description**：`粤省事小程序启动器`
   - **Local path**：点击 `Choose` 选择文件夹
     - 浏览到：`C:\Users\文兄\CodeBuddy\20260310170730`
   - **Initialize with a README**：不勾选（因为我们已有代码）
   - **Git ignore**：不选择
   - **License**：不选择

3. 点击 `Create repository`

### 3.2 推送到 GitHub

创建仓库后：

1. **查看文件列表**
   - 你会看到左侧列出了所有文件

2. **提交更改**
   - 左下角输入提交信息：
     ```
     Initial commit: 粤省事小程序启动器
     ```
   - 点击 `Commit to main` 按钮（左下角）

3. **发布到 GitHub**
   - 点击顶部工具栏的 `Publish repository` 按钮
   - **Repository name**：`wxxcx`
   - **Keep this code private**：选择是否私有（默认即可）
   - 点击 `Publish repository`

4. **完成！**
   - 代码会自动上传到 GitHub
   - 你可以访问：https://github.com/jqwx1986/wxxcx

---

## 第四步：等待 GitHub Actions 构建

### 4.1 访问 Actions 页面
在浏览器中打开：
https://github.com/jqwx1986/wxxcx/actions

或者：
1. 访问你的仓库：https://github.com/jqwx1986/wxxcx
2. 点击顶部的 `Actions` 标签

### 4.2 查看构建状态
你会看到构建任务：
- 🟡 黄色圆点：正在构建
- ✅ 绿色对勾：构建成功
- ❌ 红色叉号：构建失败

### 4.3 等待时间
- **首次构建**：8-10 分钟
- **后续构建**：5-7 分钟

你可以关闭页面，几分钟后回来查看。

---

## 第五步：下载 APK

### 5.1 进入构建详情
1. 在 Actions 页面，点击最新的构建任务
2. 点击带有绿色 ✓ 的构建

### 5.2 找到 Artifacts
滚动到页面最底部，找到 **"Artifacts"** 区域

你会看到两个文件：
- `yueshengshi-debug` - Debug 版本
- `yueshengshi-release` - Release 版本（推荐）✅

### 5.3 下载和解压
1. 点击下载图标 📥
2. 下载的是 `.zip` 文件
3. 解压后得到 `.apk` 文件

---

## 第六步：安装到手机

### 6.1 传输 APK
选择一种方式：
- USB 数据线连接
- 微信/QQ 发送到手机
- 云盘（百度网盘、OneDrive）
- 邮件发送

### 6.2 允许安装未知来源应用
1. 手机打开 `设置`
2. 搜索"安装未知来源"
3. 找到文件管理器
4. 设置为"允许"

### 6.3 安装
1. 在手机上找到 `.apk` 文件
2. 点击文件
3. 点击 `安装`
4. 等待安装完成

### 6.4 测试
1. 打开"粤省事启动器"应用
2. 点击"立即打开"按钮
3. 应该会自动跳转到粤省事小程序

---

## 📸 界面说明

### GitHub Desktop 主界面

```
┌─────────────────────────────────────┐
│ File  Repository  Branch  Help      │  ← 顶部菜单栏
├─────────────────────────────────────┤
│                                     │
│  Current Repository                 │
│  ┌─────────────────────────────┐  │
│  │ wxxcx - main               │  │
│  │ Publish repository          │  │  ← 发布按钮
│  └─────────────────────────────┘  │
│                                     │
│  Changes                            │  │  ← 文件列表
│  ├─ app/                          │
│  ├─ src/                          │
│  └─ ...                           │
│                                     │
│  Summary                            │
│  ┌─────────────────────────────┐  │
│  │ Initial commit: ...         │  │  ← 提交信息
│  └─────────────────────────────┘  │
│  Commit to main                    │  ← 提交按钮
└─────────────────────────────────────┘
```

---

## 🔧 常见操作

### 查看仓库状态
在 GitHub Desktop 左侧可以看到：
- 当前仓库
- 分支（main）
- 未提交的更改
- 历史记录

### 提交更改
1. 修改代码后，点击 `Fetch origin` 获取最新
2. 在 `Changes` 列表中查看更改的文件
3. 输入提交信息
4. 点击 `Commit to main`

### 推送到 GitHub
点击 `Publish repository` 或 `Push origin`

### 拉取最新代码
点击 `Fetch origin`

---

## ❓ 常见问题

### Q1: 提示"找不到仓库路径"
**A:** 确保选择的是正确的文件夹：
`C:\Users\文兄\CodeBuddy\20260310170730`

### Q2: 点击 "Create repository" 后没有反应
**A:** 检查：
- 文件夹路径是否正确
- 是否有权限访问该文件夹
- 重新启动 GitHub Desktop

### Q3: 提示"无法连接到 GitHub"
**A:** 检查：
- 网络连接是否正常
- 是否已登录 GitHub
- 重新登录 GitHub Desktop

### Q4: 推送时出现错误
**A:** 检查：
- 仓库名称是否正确
- 是否有权限推送
- 网络是否正常

### Q5: 如何重新推送
**A:**
1. 在 GitHub Desktop 中点击 `Fetch origin`
2. 点击 `Push origin`
3. 如果提示冲突，先 `Pull origin` 再 `Push origin`

---

## 💡 小技巧

### 查看文件差异
点击任何文件，可以在右侧查看修改前后的对比

### 撤销更改
- 右键点击文件 → `Discard changes` 撤销未提交的更改
- 右键点击文件 → `Restore this file` 恢复删除的文件

### 切换分支
- 点击顶部工具栏的 `main` 分支名
- 选择要切换的分支

### 查看历史记录
- 点击左侧的 `History` 标签
- 可以看到所有提交历史

---

## 📋 完整操作流程图

```
下载 GitHub Desktop
        ↓
登录 GitHub 账号
        ↓
创建本地仓库
        ↓
提交更改 (Commit)
        ↓
发布到 GitHub (Publish)
        ↓
等待 Actions 构建 (5-10分钟)
        ↓
下载 APK
        ↓
安装到手机
        ↓
完成！
```

---

## 🎯 总结

使用 GitHub Desktop 的优势：
- ✅ 图形界面，操作简单
- ✅ 无需记忆命令
- ✅ 可视化查看更改
- ✅ 适合新手

现在开始操作吧！按照上面的步骤一步一步来，很快就能完成。🚀
