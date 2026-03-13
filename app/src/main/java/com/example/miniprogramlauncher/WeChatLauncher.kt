package com.example.miniprogramlauncher

import android.content.Context
import android.content.pm.PackageManager
import android.widget.Toast
import com.tencent.mm.opensdk.modelbiz.WXLaunchMiniProgram
import com.tencent.mm.opensdk.openapi.IWXAPI
import com.tencent.mm.opensdk.openapi.WXAPIFactory

class WeChatLauncher(private val context: Context) {

    companion object {
        private const val APP_ID = "wxd68206e86d8d5689"
    }

    private val api: IWXAPI = WXAPIFactory.createWXAPI(context, APP_ID, true)

    init {
        api.registerApp(APP_ID)
    }

    fun isWeChatInstalled(): Boolean {
        return try {
            context.packageManager.getPackageInfo("com.tencent.mm", PackageManager.GET_ACTIVITIES)
            true
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }

    fun launchMiniProgram(miniProgram: MiniProgram) {
        if (!isWeChatInstalled()) {
            Toast.makeText(context, R.string.install_wechat, Toast.LENGTH_LONG).show()
            return
        }

        val req = WXLaunchMiniProgram.Req().apply {
            this.userName = miniProgram.userName
            this.path = miniProgram.path
            this.miniprogramType = WXLaunchMiniProgram.Req.MINIPTOOL_TYPE_DEFAULT
        }

        val result = api.sendReq(req)
        if (!result) {
            Toast.makeText(context, R.string.wechat_error, Toast.LENGTH_SHORT).show()
        }
    }
}
