# 粤省事小程序启动器

一个简洁的Android应用，专门用于快速跳转到"粤省事"微信小程序。

## 应用截图

### 主界面
应用采用Material Design 3设计风格，界面简洁美观：
- 大图标展示粤省事品牌形象
- 清晰的应用名称和描述
- 一键启动按钮

## 功能特性

- 🚀 **一键跳转** - 点击按钮即可快速打开粤省事小程序
- 💚 **官方认证** - 使用粤省事官方AppID和userName
- 🎨 **Material Design** - 遵循Material Design 3设计规范
- 📱 **兼容性好** - 支持Android 7.0及以上系统

## 粤省事小程序信息

- **小程序名称**：粤省事
- **AppID**：wxd68206e86d8d5689
- **userName**：gh_c6941d2b067d
- **功能**：广东省政务服务平台，提供各类政务服务

## 技术栈

- **语言**：Kotlin
- **最低SDK**：API 24 (Android 7.0)
- **目标SDK**：API 34 (Android 14)
- **UI框架**：Material Design Components
- **第三方库**：微信开放SDK 6.8.0
- **架构模式**：MVVM

## 开发环境配置

### 1. 安装必要软件

#### Android Studio
1. 访问 [Android Studio 官网](https://developer.android.com/studio)
2. 下载并安装最新版本的 Android Studio Hedgehog (2023.1.1) 或更高版本

#### JDK
- JDK 11 或更高版本（Android Studio自带）

### 2. 打开项目

1. 启动 Android Studio
2. 选择 `File` -> `Open`
3. 浏览并选择项目根目录（包含 `build.gradle.kts` 文件）
4. 等待 Gradle 同步完成（首次同步可能需要下载依赖，需要几分钟）

### 3. 项目结构

```
app/
├── src/main/
│   ├── java/com/example/miniprogramlauncher/
│   │   ├── MainActivity.kt              # 主Activity
│   │   ├── MiniProgram.kt               # 小程序数据模型
│   │   ├── WeChatLauncher.kt            # 微信启动器
│   │   └── wxapi/
│   │       └── WXPayEntryActivity.kt    # 微信回调Activity
│   ├── res/
│   │   ├── layout/
│   │   │   └── activity_main.xml        # 主界面布局
│   │   ├── values/
│   │   │   ├── strings.xml              # 字符串资源
│   │   │   ├── colors.xml               # 颜色资源
│   │   │   └── themes.xml               # 主题资源
│   │   └── drawable/
│   │       └── icon_background.xml      # 图标背景
│   └── AndroidManifest.xml              # 应用清单文件
├── build.gradle.kts                     # 应用级构建配置
└── proguard-rules.pro                   # 混淆规则
```

## 构建APK

### 方法1：使用 Android Studio（推荐）

#### Debug版本APK
1. 连接Android设备或启动模拟器
2. 点击工具栏的绿色运行按钮 ▶️
3. 或者选择 `Build` -> `Build Bundle(s) / APK(s)` -> `Build APK(s)`
4. 构建完成后，点击弹出的提示中的 "locate"
5. APK文件位置：`app/build/outputs/apk/debug/app-debug.apk`

#### Release版本APK
1. 选择 `Build` -> `Generate Signed Bundle / APK`
2. 选择 `APK`，点击 `Next`
3. 创建或选择密钥库（Keystore）
4. 选择 `release` 构建类型
5. 点击 `Finish` 开始构建
6. APK文件位置：`app/build/outputs/apk/release/app-release.apk`

### 方法2：使用命令行

在项目根目录下执行：

```bash
# Windows
gradlew.bat assembleDebug

# Linux/Mac
./gradlew assembleDebug
```

Release版本：
```bash
# Windows
gradlew.bat assembleRelease

# Linux/Mac
./gradlew assembleRelease
```

### 创建调试用签名密钥（可选）

如果只需要测试，可以使用调试签名（无需额外配置）。

如果需要正式发布，需要创建自己的签名密钥：

```bash
keytool -genkey -v -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
```

## 安装APK到设备

### 方法1：使用 ADB
```bash
adb install app-debug.apk
```

### 方法2：直接安装
1. 将APK文件传输到Android设备
2. 在文件管理器中找到APK文件
3. 点击安装
4. 如提示"未知来源"，需要在设置中允许安装

## 运行项目

### 使用真机
1. 开启开发者选项：设置 -> 关于手机 -> 连续点击"版本号"7次
2. 启用USB调试：设置 -> 开发者选项 -> USB调试
3. 用USB数据线连接电脑
4. 在Android Studio中点击运行

### 使用模拟器
1. 在Android Studio中点击 `Tools` -> `Device Manager`
2. 点击 `Create Device` 创建新的虚拟设备
3. 选择设备型号（如 Pixel 6）
4. 选择系统镜像（推荐 API 34）
5. 创建完成后，点击运行

## 常见问题

### 1. Gradle同步失败
**解决方案**：
- 检查网络连接
- 尝试使用代理或VPN
- 在 `gradle.properties` 中添加镜像源：
```properties
# 使用阿里云镜像
maven { url 'https://maven.aliyun.com/repository/public' }
```

### 2. 找不到微信应用
**解决方案**：
- 确保设备已安装微信
- 检查应用是否已被授予启动其他应用的权限

### 3. 跳转失败
**解决方案**：
- 检查微信AppID是否正确：`wxd68206e86d8d5689`
- 确认小程序userName是否正确：`gh_c6941d2b067d`
- 查看Android Studio Logcat日志获取详细错误信息

### 4. 编译错误
**解决方案**：
- 检查JDK版本是否正确
- 更新Android Studio和Gradle插件
- 执行 `Build` -> `Clean Project` -> `Rebuild Project`
- 删除 `.gradle` 文件夹后重新同步

### 5. 安装APK时提示"解析包错误"
**解决方案**：
- 确保APK文件完整未损坏
- 检查Android系统版本是否满足要求（最低Android 7.0）
- 尝试重新下载或重新构建APK

## 权限说明

应用需要以下权限（在 `AndroidManifest.xml` 中声明）：
- `INTERNET` - 用于微信SDK通信
- `ACCESS_NETWORK_STATE` - 检查网络状态

## 微信开放平台配置

如果需要正式发布应用，需要在[微信开放平台](https://open.weixin.qq.com/)进行配置：

1. 注册并登录微信开放平台
2. 创建移动应用
3. 填写应用信息：
   - 应用名称：粤省事启动器
   - 应用包名：com.example.miniprogramlauncher
   - 应用签名：使用 keystore 获取 MD5 值
4. 获取正式的AppID并替换代码中的AppID

获取签名命令：
```bash
keytool -list -v -keystore your-keystore.jks
```
将显示的 MD5 值去掉冒号后，在微信开放平台进行配置。

## 修改应用图标

1. 准备图标资源：
   - mipmap-mdpi: 48x48
   - mipmap-hdpi: 72x72
   - mipmap-xhdpi: 96x96
   - mipmap-xxhdpi: 144x144
   - mipmap-xxxhdpi: 192x192

2. 替换 `app/src/main/res/mipmap-*` 目录下的图标文件

## 修改应用名称

编辑 `app/src/main/res/values/strings.xml`：
```xml
<string name="app_name">粤省事</string>
```

## 版本历史

### v1.0.0 (2026-03-10)
- 初始版本发布
- 实现粤省事小程序跳转功能
- Material Design 3 界面设计

## 许可证

本项目仅供个人学习和交流使用。

粤省事是广东省政务服务的官方小程序，版权归原作者所有。

## 技术支持

如有问题或建议，欢迎：
- 提交 Issue
- 查看微信开放平台文档

## 免责声明

本应用仅作为快捷启动工具，不存储任何用户数据。
所有政务服务均通过粤省事官方小程序进行，本应用不承担任何责任。
