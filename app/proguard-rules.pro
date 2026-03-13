# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.

-keep class com.tencent.mm.opensdk.** { *; }
-dontwarn com.tencent.mm.**
-keep class com.tencent.wxop.** { *; }
-dontwarn com.tencent.wxop.**
-keep class com.tencent.mm.opensdk.modelmsg.** { *; }
-keep class com.tencent.mm.opensdk.modelbiz.** { *; }
-keep class com.tencent.mm.opensdk.openapi.IWXAPI { *; }
