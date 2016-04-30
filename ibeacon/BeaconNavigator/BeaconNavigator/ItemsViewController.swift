import UIKit
import CoreLocation

struct ItemsViewControllerConstant {
    static let storedItemsKey = "storedItems"
    
    static let firstFloorBeaconName = "First Floor"
    static let firstfloorUDID = "52414449-5553-4E45-5457-4F524B53434F"
//EF54FDA7-9C15-4805-8091-3D1C54C16D3A
    static let firstfloorMajorValue = "1"
    static let firstfloorMinorValue = "101"
    
    
    static let secondFloorBeaconName = "Second Floor"
    static let secondfloorUDID = "5AFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF"
    static let secondfloorMajorValue = "2"
    static let secondfloorMinorValue = "201"
    
    
    static let thirdFloorBeaconName = "Third Floor"
    static let thirdfloorUDID = "92AB49BE-4127-42F4-B532-90FA1E26491"
    static let thirdfloorMajorValue = "3"
    static let thirdfloorMinorValue = "301"
}

public class ItemsViewController: UIViewController {
    @IBOutlet weak var itemsTableView: UITableView!
    
    var items: [Item] = []
    let locationManager = CLLocationManager()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    public func configureBeacon()
    {
        locationManager.requestAlwaysAuthorization()
        loadItems()
        locationManager.delegate = self
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func loadItems() {
        //if let storedItems = NSUserDefaults.standardUserDefaults().arrayForKey(ItemsViewControllerConstant.storedItemsKey) {
        
        
            let firstFloorBeacon = add(ItemsViewControllerConstant.firstFloorBeaconName,udidS: ItemsViewControllerConstant.firstfloorUDID,majorS: ItemsViewControllerConstant.firstfloorMajorValue,minorS: ItemsViewControllerConstant.firstfloorMinorValue);
            
            startMonitoringItem(firstFloorBeacon)
        items.append(firstFloorBeacon)
 
            let secondFloorBeacon = add(ItemsViewControllerConstant.secondFloorBeaconName,udidS: ItemsViewControllerConstant.secondfloorUDID,majorS: ItemsViewControllerConstant.secondfloorMajorValue,minorS: ItemsViewControllerConstant.secondfloorMinorValue);
            
            startMonitoringItem(secondFloorBeacon)
        items.append(secondFloorBeacon)
            
            let thirdFloorBeacon = add(ItemsViewControllerConstant.thirdFloorBeaconName,udidS: ItemsViewControllerConstant.thirdfloorUDID,majorS: ItemsViewControllerConstant.thirdfloorMajorValue,minorS: ItemsViewControllerConstant.thirdfloorMinorValue);
            
            startMonitoringItem(thirdFloorBeacon)
        items.append(thirdFloorBeacon)
            
        
            /*for itemData in storedItems {
                let item = NSKeyedUnarchiver.unarchiveObjectWithData(itemData as! NSData) as! Item
                items.append(item)
                startMonitoringItem(item)
            }*/
        //}
    }
    

    func add(nameS : String, udidS:String, majorS:String, minorS:String) -> Item{
    
        let uuid = NSUUID(UUIDString: (udidS))
        let major = UInt16(Int(majorS)!)
        let minor = UInt16(Int(minorS)!)
        
         return Item(name: nameS, uuid: uuid!, majorValue: major, minorValue: minor)
        
        
    }
    
    func persistItems() {
        var itemsDataArray:[NSData] = []
        for item in items {
            let itemData = NSKeyedArchiver.archivedDataWithRootObject(item)
            itemsDataArray.append(itemData)
        }
        NSUserDefaults.standardUserDefaults().setObject(itemsDataArray, forKey: ItemsViewControllerConstant.storedItemsKey)
    }
    
    func beaconRegionWithItem(item:Item) -> CLBeaconRegion {
        let beaconRegion = CLBeaconRegion(proximityUUID: item.uuid, major: item.majorValue, minor: item.minorValue, identifier: item.name)
        return beaconRegion
    }
    
    func startMonitoringItem(item:Item) {
        let beaconRegion = beaconRegionWithItem(item)
        locationManager.startMonitoringForRegion(beaconRegion)
        locationManager.startRangingBeaconsInRegion(beaconRegion)
    }
    
    func stopMonitoringItem(item:Item) {
        let beaconRegion = beaconRegionWithItem(item)
        locationManager.stopMonitoringForRegion(beaconRegion)
        locationManager.stopRangingBeaconsInRegion(beaconRegion)
    }
    
    // MARK: Unwind Segue actions
    @IBAction func saveItem(segue: UIStoryboardSegue) {
        let addItemViewController = segue.sourceViewController as! AddItemViewController
        if let newItem = addItemViewController.newItem {
            items.append(newItem)
            itemsTableView.beginUpdates()
            let newIndexPath = NSIndexPath(forRow: items.count-1, inSection: 0)
            itemsTableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
            itemsTableView.endUpdates()
            startMonitoringItem(newItem)
            persistItems()
        }
    }
    
    @IBAction func cancelItem(segue: UIStoryboardSegue) {
        // Do nothing
    }
}

// MARK: UITableViewDataSource
extension ItemsViewController : UITableViewDataSource {
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Item", forIndexPath: indexPath) as! ItemCell
        let item = items[indexPath.row]
        cell.item = item
        return cell
    }
    
    public func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let itemToRemove = items[indexPath.row] as Item
            stopMonitoringItem(itemToRemove)
            tableView.beginUpdates()
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            tableView.endUpdates()
            persistItems()
        }
    }
}

// MARK: UITableViewDelegate
extension ItemsViewController: UITableViewDelegate {
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let item = items[indexPath.row] as Item
        let uuid = item.uuid.UUIDString
        let detailMessage = "UUID: \(uuid)\nMajor: \(item.majorValue)\nMinor: \(item.minorValue)"
        let detailAlert = UIAlertController(title: "Details", message: detailMessage, preferredStyle: .Alert)
        detailAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(detailAlert, animated: true, completion: nil)
    }
}

// MARK: CLLocationManagerDelegate
extension ItemsViewController: CLLocationManagerDelegate {
    public func locationManager(manager: CLLocationManager, monitoringDidFailForRegion region: CLRegion?, withError error: NSError) {
        print("Failed monitoring region: \(error.description)")
    }
    
    public func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        print("Location manager failed: \(error.description)")
    }
    
    public func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        if let beacons = beacons as? [CLBeacon] {
            for beacon in beacons {
                for item in items {
                    if item == beacon {
                        item.lastSeenBeacon = beacon
                        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                        appDelegate.beaconDetected(item)
                    }
                }
            }
        }
    }
}

