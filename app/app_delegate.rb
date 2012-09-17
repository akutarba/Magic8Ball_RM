class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor=UIColor.yellowColor
    @window.rootViewController = Magic8BallViewController.alloc.init
    @window.makeKeyAndVisible
    true
  end
end
