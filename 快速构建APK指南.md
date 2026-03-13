# 快速构建APK指南

## 前提条件
- 已安装 Android Studio（Hedgehog 2023.1.1 或更高版本）
- 已配置好 JDK 11 或更高版本

## 第一步：打开项目

1. 启动 Android Studio
2. 选择 `File` -> `Open`
3. 浏览并选择项目文件夹：`C:/Users/文兄/CodeBuddy/20260310170730`
4. 等待 Gradle 同步完成（首次同步需要几分钟）

## 第二步：构建 Debug APK（推荐测试用）

### 方法1：通过菜单构建
1. 在顶部菜单栏选择 `Build`
2. 选择 `Build Bundle(s) / APK(s)`
3. 选择 `Build APK(s)`
4. 等待构建完成（通常1-3分钟）
5. 构建完成后，会弹出提示框，点击 `locate`
6. APK文件位置：`app/build/outputs/apk/debug/app-debug.apk`

### 方法2：通过运行按钮
1. 点击工具栏的绿色运行按钮 ▶️
2. 等待构建和安装完成

## 第三步：构建 Release APK（正式发布用）

### 创建签名密钥（如果还没有）

在命令行执行：
```bash
keytool -genkey -v -keystore release-key.keystore -alias release-key -keyalg RSA -keysize 2048 -validity 10000
```

按照提示输入：
- Keystore 密码：记住这个密码
- 姓名、组织等信息
- Key 密码：可以与Keystore密码相同

### 配置签名（在 app/build.gradle.kts 中）

在 `android {}` 块内添加：

```kotlin
signingConfigs {
    create("release") {
        storeFile = file("release-key.keystore")
        storePassword = "你的密钥库密码"
        keyAlias = "release-key"
        keyPassword = "你的密钥密码"
    }
}
```

然后在 `release` 构建类型中引用：

```kotlin
buildTypes {
    release {
        isMinifyEnabled = true
        isShrinkResources = true
        signingConfig = signingConfigs.getByName("release")
        proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro"
        )
    }
}
```

### 构建 Release APK

1. 在顶部菜单栏选择 `Build`
2. 选择 `Generate Signed Bundle / APK`
3. 选择 `APK`，点击 `Next`
4. 选择刚才创建的密钥库文件，输入密码
5. 选择 `release` 构建类型
6. 点击 `Finish` 开始构建
7. APK文件位置：`app/build/outputs/apk/release/app-release.apk`

## 第四步：安装APK到手机

### 方法1：使用 ADB（推荐）
```bash
adb install app-debug.apk
```

### 方法2：直接传输安装
1. 将APK文件通过USB、微信等方式发送到手机
2. 在手机上打开APK文件
3. 点击"安装"
4. 如果提示"未知来源"，去设置中允许安装

## 快速命令行构建

在项目根目录下执行：

### Debug版本
```bash
# Windows
gradlew.bat assembleDebug

# Linux/Mac
./gradlew assembleDebug
```

### Release版本
```bash
# Windows
gradlew.bat assembleRelease

# Linux/Mac
./gradlew assembleRelease
```

## 常见问题解决

### 1. Gradle同步失败
- 检查网络连接
- 尝试在 `gradle.properties` 中添加：
```properties
systemProp.http.proxyHost=你的代理地址
systemProp.http.proxyPort=端口号
```

### 2. 构建失败：SDK未找到
- 在 Android Studio 中：`Tools` -> `SDK Manager`
- 安装 Android SDK Platform 34
- 安装 Android SDK Build-Tools 34.0.0

### 3. 找不到 ADB 命令
- 将 Android SDK 的 `platform-tools` 目录添加到系统 PATH
- 或直接使用完整路径：`C:/Users/你的用户名/AppData/Local/Android/Sdk/platform-tools/adb.exe`

### 4. APK安装失败：解析包错误
- 确认APK文件完整
- 检查手机系统版本（需Android 7.0+）
- 重新构建APK

## 输出文件位置

所有构建的APK都在：`app/build/outputs/apk/`

- Debug版本：`app/build/outputs/apk/debug/app-debug.apk`
- Release版本：`app/build/outputs/apk/release/app-release.apk`

## 下一步

构建完成后：
1. 安装到手机测试
2. 点击"立即打开"按钮
3. 应该会自动跳转到粤省事小程序

如果遇到问题，请查看详细README文档或提交Issue。
