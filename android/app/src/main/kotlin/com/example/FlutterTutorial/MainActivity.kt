package com.example.FlutterTutorial
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

// configureFlutterEngine를 오버라이드 하는 곳에서만
// 문제없이 빌드가 됨. 버전 업그레이드를 하면서
// GeneratedPluginRegistrant는 설정이 어려움
private val CHANNEL ="com.psw.dev/test"
class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call, result ->
                    methoProcess(call, result)
                }
    }

    private fun methoProcess(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "getTest") {
            result.success("This is Channel Test")
        }
    }
}
