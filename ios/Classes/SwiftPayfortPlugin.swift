import Flutter
import UIKit

public class SwiftPayfortPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "payfort_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftPayfortPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
//    if call.method == "getID" {
//        result(self.getId())
//        
//        
//    } else if call.method == "initPayFort" {
//        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
//        let payFort = PayFortController(enviroment: KPayFortEnviromentSandBox)
//        guard let args = call.arguments as? Dictionary<String, String> else { return }
//        let token = args["sdkToken"]
//        let merchantRef = args["merchantRef"]
//        let name = args["name"]
//        let lang = args["lang"]
//        let command = args["command"]
//        let amount = args["amount"]
//        let email = args["email"]
//        
//        let request: NSMutableDictionary = .init()
//        request.setValue(amount, forKey: "amount")
//        request.setValue(command, forKey: "command")
//        request.setValue("EGP", forKey: "currency")
//        request.setValue(email, forKey: "customer_email")
//        request.setValue(lang, forKey: "language")
//        request.setValue(merchantRef, forKey: "merchant_reference")
//        request.setValue(token , forKey: "sdk_token")
//        payFort?.isShowResponsePage = true
//        payFort?.callPayFort(withRequest: request, currentViewController: controller,
//                            success: { (requestDic, responeDic) in
//                                print("success")
//                                print("responeDic=(responeDic)")
//                                print("responeDic=(responeDic)")
//                                result(responeDic)
//        },
//                            canceled: { (requestDic, responeDic) in
//                                print("canceled")
//                                print("requestDic=(requestDic)")
//                                print("responeDic=(responeDic)")
//                                result(responeDic)
//        },
//                            faild: { (requestDic, responeDic, message) in
//                                print("faild")
//                                print("requestDic=(requestDic)")
//                                print("responeDic=(responeDic)")
//                                print("message=(message)")
//                                result(message)
//        })
//        
//    }

  }
func getId() -> String { UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString }
}
