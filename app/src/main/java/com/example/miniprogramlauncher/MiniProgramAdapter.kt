package com.example.miniprogramlauncher

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.miniprogramlauncher.databinding.ItemMiniprogramBinding

class MiniProgramAdapter(
    private val miniPrograms: List<MiniProgram>,
    private val onLaunchClick: (MiniProgram) -> Unit
) : RecyclerView.Adapter<MiniProgramAdapter.MiniProgramViewHolder>() {

    inner class MiniProgramViewHolder(private val binding: ItemMiniprogramBinding) :
        RecyclerView.ViewHolder(binding.root) {

        fun bind(miniProgram: MiniProgram) {
            binding.nameText.text = miniProgram.name
            binding.appIdText.text = miniProgram.appId
            binding.launchButton.setOnClickListener {
                onLaunchClick(miniProgram)
            }
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MiniProgramViewHolder {
        val binding = ItemMiniprogramBinding.inflate(
            LayoutInflater.from(parent.context),
            parent,
            false
        )
        return MiniProgramViewHolder(binding)
    }

    override fun onBindViewHolder(holder: MiniProgramViewHolder, position: Int) {
        holder.bind(miniPrograms[position])
    }

    override fun getItemCount(): Int = miniPrograms.size
}
