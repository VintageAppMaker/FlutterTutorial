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
    var channel : MethodChannel? = null
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel?.setMethodCallHandler { call, result ->
            methoProcess(call, result)
        }
    }

    private fun methoProcess(call: MethodCall, result: MethodChannel.Result) {
        when(call.method){
            "getString" -> {
                result.success("Android에서 문자열을 반환")
            }

            "startCallback" -> {
                callbackFired()
            }
        }
    }

    fun callbackFired() {
        channel!!.invokeMethod("callbackString", "callback을 호출하고 문자열을 넘김")
    }
}
