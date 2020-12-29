package com.agm.payfort_plugin.payfort_plugin_example

import android.content.Intent
import android.os.Bundle
import android.util.Log
import androidx.annotation.NonNull
import com.payfort.fort.android.sdk.base.FortSdk
import com.payfort.fort.android.sdk.base.callbacks.FortCallBackManager
import com.payfort.fort.android.sdk.base.callbacks.FortCallback
import com.payfort.sdk.android.dependancies.base.FortInterfaces
import com.payfort.sdk.android.dependancies.models.FortRequest
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.HashMap

class MainActivity: FlutterActivity() {
    private var fortCallback: FortCallBackManager? = null
    var deviceId = "";
    var sdkToken = ""
    private val CHANNEL = "agm.flutter.apps/e-commerce"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            var token = call.argument<String>("sdkToken")
            var merchantRef = call.argument<String>("merchantRef")
            var name = call.argument<String>("name")
            var lang = call.argument<String>("lang")
            var command = call.argument<String>("command")
            var amount = call.argument<String>("amount")
            var email = call.argument<String>("email")
            if (call.method == "initPayFort") {
                Log.e("native sdk token", token!!)
                Log.e("native merchant", merchantRef!!)
                fortCallback = FortCallBackManager.Factory.create() as FortCallback
                deviceId = FortSdk.getDeviceId(this@MainActivity)
                Log.d("DeviceId", deviceId)
                val fortrequest = FortRequest()
                val requestMap: MutableMap<String, Any> = HashMap()
                requestMap["command"] = command!!
                requestMap["customer_email"] = email!!
                requestMap["currency"] = "EGP"
                requestMap["amount"] = amount!!
                requestMap["language"] = lang!!
                requestMap["merchant_reference"] = merchantRef.toString()
                requestMap["customer_name"] = name!!
                requestMap["sdk_token"] = token!!
                fortrequest.requestMap = requestMap
                fortrequest.isShowResponsePage = true // to [display/use] the SDK response page
                try {
                    FortSdk.getInstance().registerCallback(this@MainActivity, fortrequest, FortSdk.ENVIRONMENT.TEST, 5, fortCallback, true, object : FortInterfaces.OnTnxProcessed {
                        override fun onCancel(requestParamsMap: Map<String, Any>, responseMap: Map<String, Any>) {
                            Log.d("Cancelled", responseMap.toString())
                            result.success(responseMap)
                        }

                        override fun onSuccess(requestParamsMap: Map<String, Any>, fortResponseMap: Map<String, Any>) {
                            Log.i("Success", fortResponseMap.toString())
                            result.success(fortResponseMap)
                        }

                        override fun onFailure(requestParamsMap: Map<String, Any>, fortResponseMap: Map<String, Any>) {
                            Log.e("Failure", fortResponseMap.toString())
                            result.success(fortResponseMap)
                        }
                    })
                } catch (e: Exception) {
                    Log.e("execute Payment", "all FortSdk", e)
                }


            } else if (call.method == "getID") {
                result.success(FortSdk.getDeviceId(this@MainActivity))
            } else {
                result.notImplemented()
            }
        }
    }





    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 5) {
            fortCallback!!.onActivityResult(requestCode, resultCode, data)
        }
    }
}
