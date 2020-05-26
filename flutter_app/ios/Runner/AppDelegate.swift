import UIKit
import Flutter

@UIApplicationMain

/**flutter项目启动调用函数*/
@objc class AppDelegate: FlutterAppDelegate {
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    
    
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
}

/**swift项目启动调用函数*/
func application(application: UIApplication,didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    /*
    var window: UIWindow?
    var viewController: UIViewController?

    self.window = UIWindow.init(frame: UIScreen.main.bounds)
    let vc = ViewController()
    self.viewController = vc
    self.window?.rootViewController = self.viewController
    self.window?.makeKeyAndVisible()
     
    */
    return true
}
