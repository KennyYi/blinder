package com.kenny.blinder

import android.app.Activity
import android.view.WindowManager
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** BlinderPlugin */
class BlinderPlugin: FlutterPlugin, ActivityAware, MethodCallHandler {

  private lateinit var channel: MethodChannel
  private lateinit var activity: Activity

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "blinder")
    channel.setMethodCallHandler(this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onMethodCall(call: MethodCall, result: Result) {

    when (call.method) {
      "blind" -> {
        activity.window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
        result.success(null)
      }
      "open" -> {
        activity.window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
        result.success(null)
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromActivityForConfigChanges() {
    // Do nothing
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    // Do nothing
  }

  override fun onDetachedFromActivity() {
    // Do nothing
  }
}
