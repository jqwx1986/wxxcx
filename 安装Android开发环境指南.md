# Android开发环境安装指南

## 方案1：安装 Android Studio（推荐）

### 1. 下载 Android Studio

访问官网下载：
https://developer.android.com/studio

或者使用国内镜像下载：
https://developer.android.google.cn/studio

**推荐版本**：Android Studio Hedgehog (2023.1.1) 或更高版本

**下载大小**：约 1GB

### 2. 安装 Android Studio

1. 双击下载的安装程序（exe文件）
2. 按照 安装向导 点击"Next"
3. 选择安装路径（默认即可）
4. 勾选：
   - ✅ Android Studio
   - ✅ Android Virtual Device（可选，用于模拟器）
5. 点击"Install"开始安装
6. 安装过程约 5-10 分钟
7. 安装完成后，勾选"Start Android Studio"，点击"Finish"

### 3. 首次启动配置

1. **欢迎界面**：选择 "Standard" 标准安装，点击"Next"
2. **SDK下载**：会自动下载以下内容（需要网络）：
   - Android SDK Platform 34
   - Android SDK Build-Tools 34.0.0
   - Android SDK Platform-Tools
   - Intel x86 Emulator Accelerator (HAXM)

**下载大小**：约 2-3GB
**下载时间**：取决于网速，通常 10-30 分钟

3. **接受许可协议**：点击 "Accept" -> "Next"

4. **完成配置**：等待下载完成后，点击 "Finish"

### 4. 打开项目

1. 在 Android Studio 中选择 `File` -> `Open`
2. 浏览到：`C:/Users/文兄/CodeBuddy/20260310170730`
3. 选择项目文件夹，点击"OK"
4. 等待 Gradle 同步完成（首次需要下载依赖）

**同步时间**：首次约 5-10 分钟，后续几秒

### 5. 构建 APK

1. 点击菜单 `Build` -> `Build Bundle(s) / APK(s)` -> `Build APK(s)`
2. 等待构建完成（1-3 分钟）
3. 构建完成后，点击弹窗中的 "locate"
4. APK 位置：`app/build/outputs/apk/debug/app-debug.apk`

---

## 方案2：使用在线构建平台（无需安装）

如果你不想安装 Android Studio，可以使用在线构建平台：

### 推荐：GitHub Actions

1. **注册 GitHub 账号**（如果没有）
   - https://github.com/signup

2. **创建仓库**
   - 点击 "New repository"
   - 仓库名称：`yueshengshi-launcher`
   - 选择 "Public" 或 "Private"
   - 点击 "Create repository"

3. **上传代码**
   - 将项目文件夹的内容上传到 GitHub

4. **创建 GitHub Actions 工作流**
   在项目根目录创建 `.github/workflows/build.yml`：

```yaml
name: Build APK

on:
  push:
    branches: [ main, master ]
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3

    - name: Set up JDK 11
      uses: actions/setup-java@v3
      with:
        java-version: '11'
        distribution: 'temurin'

    - name: Grant execute permission for gradlew
      run: chmod +x gradlew

    - name: Build with Gradle
      run: ./gradlew assembleDebug

    - name: Upload APK
      uses: actions/upload-artifact@v3
      with:
        name: app-debug
        path: app/build/outputs/apk/debug/*.apk
```

5. **触发构建**
   - 提交代码到 GitHub
   - 或者手动触发：Actions 标签 -> 选择工作流 -> "Run workflow"

6. **下载 APK**
   - 构建完成后，在 Actions 页面下载 Artifact

---

## 方案3：使用云IDE（推荐新手）

### Android Studio Cloud（官方）

1. 访问：https://developer.android.com/studio/run-managed-device

### Replit（免费）

1. 访问：https://replit.com/
2. 创建新的 Android 项目
3. 上传代码文件
4. 在线构建 APK

---

## 常见问题

### 1. 下载速度慢
**解决方案**：
- 使用国内镜像源下载 Android Studio
- 或使用 VPN 加速下载

### 2. Gradle 下载失败
**解决方案**：
在 `gradle.properties` 中添加国内镜像：
```properties
# 使用阿里云镜像
maven { url 'https://maven.aliyun.com/repository/public' }
maven { url 'https://maven.aliyun.com/repository/google' }
maven { url 'https://maven.aliyun.com/repository/jcenter' }
```

### 3. SDK 下载失败
**解决方案**：
- 检查网络连接
- 在 Android Studio 中手动下载 SDK：
  `Tools` -> `SDK Manager` -> `SDK Platforms` -> 选择需要的版本 -> Apply

### 4. 同步失败
**解决方案**：
- 点击 `File` -> `Invalidate Caches...` -> `Invalidate and Restart`
- 删除 `.gradle` 文件夹，重新同步

---

## 推荐方案对比

| 方案 | 优点 | 缺点 | 适用人群 |
|------|------|------|----------|
| 安装 Android Studio | 功能完整，可调试 | 下载安装慢，占用磁盘大 | 开发者，长期使用 |
| GitHub Actions | 无需安装，自动化 | 需要GitHub账号，每次都要push | 不想安装软件的用户 |
| 云IDE | 开箱即用，无需安装 | 性能有限，免费额度有限 | 快速测试，临时使用 |

## 我的建议

**如果你经常需要开发Android应用**：
→ 选择 **方案1**：安装 Android Studio

**如果只是这一次需要APK**：
→ 选择 **方案2**：使用 GitHub Actions（最简单）

**如果只是想快速测试**：
→ 选择 **方案3**：使用云IDE

---

选择一个方案，我可以继续帮你！
