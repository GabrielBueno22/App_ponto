import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let proxyChannel = FlutterMethodChannel(name: "flutter.native/helper", binaryMessenger: controller)
    
    proxyChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: FlutterResult) -> Void in
        if call.method == "getProxy"{
            result(self.getProxy())
        }else{
            return
        }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func getProxy() -> String{
        let proxies = CFNetworkCopySystemProxySettings()?.takeUnretainedValue()
        print("CFNetwork Proxies: \(proxies)")
        if let response = proxies as? [String: AnyObject]{
            let proxy : Any
            let port : Any
            do{
                proxy = response["HTTPProxy"] ?? ""
                port = response["HTTPPort"] ?? ""
            }catch{
                proxy = ""
                port = ""
            }

            print("Proxy \(String(describing: proxy)):\(String(describing: port))")
            if String(describing: proxy) == "" || String(describing: port) as! String == ""{
                return ""
            }else{
                return "\(proxy):\(port)"
            }
        }
        
        
        return ""
    }
}
