package com.example.miniprogramlauncher

data class MiniProgram(
    val id: Int,
    val name: String,
    val appId: String,
    val path: String = "",
    val userName: String = ""
)
