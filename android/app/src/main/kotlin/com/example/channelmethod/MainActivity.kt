package com.example.channelmethod

import io.flutter.embedding.android.FlutterActivity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.app/openCSV"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "openCSV") {
                val filePath = call.argument<String>("filePath")
                if (filePath != null) {
                    openCSV(filePath)
                }
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun openCSV(filePath: String) {
        val file = File(filePath)
        val uri = Uri.fromFile(file)
        val intent = Intent(Intent.ACTION_VIEW)

        intent.setDataAndType(uri, "text/csv")
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)

        if (intent.resolveActivity(packageManager) != null) {
            startActivity(intent)
        } else {
            // No app available to handle the CSV file
            // Show a message to the user
            showToast("No app found to open the file")
        }
    }

    private fun showToast(message: String) {
        // Implement your toast message logic here
    }
}
