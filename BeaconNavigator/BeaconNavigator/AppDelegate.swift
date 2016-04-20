
import UIKit
import AVFoundation
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //var audioPlayer:AVAudioPlayer
    var player = AVPlayer()
    var CurrentBeacon : NSString = ""
    
    let locationManager = CLLocationManager()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        // Override point for customization after application launch.
        //audioPlayer =  AVAudioPlayer()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func playAudio()
    {
        let coinSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("beep-06", ofType: "wav")!)
        let playerItem = AVPlayerItem(URL: coinSound)
        player = AVPlayer(playerItem:playerItem)
        player.rate = 1.0;
        player.play()
        
    }
    
    func beaconDetected(i: Item)
    {
        
        
         if(i.majorValue==1)
         {
         CurrentBeacon = "1"
         }
         else if(i.majorValue==2)
         {
         CurrentBeacon = "2"
         }
         else if(i.majorValue==3)
         {
         CurrentBeacon = "3"
         }
         else if(i.majorValue==4)
         {
         CurrentBeacon = "4"
         
        
    //CurrentBeacon = i.majorValue as String
    NSNotificationCenter.defaultCenter().postNotificationName("NotificationIdentifier", object: i)
    }


}
}


extension AppDelegate: CLLocationManagerDelegate {
    public func locationManager(manager: CLLocationManager, monitoringDidFailForRegion region: CLRegion?, withError error: NSError) {
        print("Failed monitoring region: \(error.description)")
    }
    
    public func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        print("Location manager failed: \(error.description)")
    }
    
    public func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
       // if let beacons = beacons as? [CLBeacon] {
         //   for beacon in beacons {
                /*for item in items {
                    if item == beacon {
                        item.lastSeenBeacon = beacon
                        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                        appDelegate.beaconDetected(item)
                    }
                }*/
           // }
        //}
    }
}


