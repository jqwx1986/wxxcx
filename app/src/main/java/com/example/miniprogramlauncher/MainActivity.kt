package com.example.miniprogramlauncher

import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.miniprogramlauncher.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private lateinit var weChatLauncher: WeChatLauncher

    private val miniProgram = MiniProgram(
        id = 1,
        name = "粤省事",
        appId = "wxd68206e86d8d5689",
        userName = "gh_c6941d2b067d",
        path = "pages/index/index"
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setSupportActionBar(binding.toolbar)

        weChatLauncher = WeChatLauncher(this)

        setupUI()
    }

    private fun setupUI() {
        binding.nameText.text = miniProgram.name
        binding.launchButton.setOnClickListener {
            weChatLauncher.launchMiniProgram(miniProgram)
        }
    }
}
