import UIKit
import CoreLocation

struct ItemsViewControllerConstant {
  static let storedItemsKey = "storedItems"
}

class ItemsViewController: UIViewController {
  @IBOutlet weak var itemsTableView: UITableView!
  
    let locationManager = CLLocationManager()
    
  var items: [Item] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    locationManager.requestAlwaysAuthorization()
    
    loadItems()
    locationManager.delegate = self
    
  }
    
    func beaconRegionWithItem(item:Item) -> CLBeaconRegion {
        let beaconRegion = CLBeaconRegion(proximityUUID: item.uuid,
            major: item.majorValue,
            minor: item.minorValue,
            identifier: item.name)
        return beaconRegion
    }
    
    func startMonitoringItem(item: Item) {
        let beaconRegion = beaconRegionWithItem(item)
        locationManager.startMonitoringForRegion(beaconRegion)
        locationManager.startRangingBeaconsInRegion(beaconRegion)
    }
    
    func stopMonitoringItem(item: Item) {
        let beaconRegion = beaconRegionWithItem(item)
        locationManager.stopMonitoringForRegion(beaconRegion)
        locationManager.stopRangingBeaconsInRegion(beaconRegion)
    }
    
    
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func loadItems() {
    if let storedItems = NSUserDefaults.standardUserDefaults().arrayForKey(ItemsViewControllerConstant.storedItemsKey) {
      for itemData in storedItems {
        let item: Item = NSKeyedUnarchiver.unarchiveObjectWithData(itemData as! NSData) as! Item
        items.append(item)
        startMonitoringItem(item)
      }
    }
  }
  
  func persistItems() {
    var itemsDataArray:[NSData] = []
    for item in items {
      let itemData = NSKeyedArchiver.archivedDataWithRootObject(item)
      itemsDataArray.append(itemData)
    }
    NSUserDefaults.standardUserDefaults().setObject(itemsDataArray, forKey: ItemsViewControllerConstant.storedItemsKey)
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
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Item", forIndexPath: indexPath) as! ItemCell
    let item = items[indexPath.row]
    cell.item = item
    return cell
  }
  
  func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
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
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    let item = items[indexPath.row] as Item
    let uuid = item.uuid.UUIDString
    let detailMessage = "UUID: \(uuid)\nMajor: \(item.majorValue)\nMinor: \(item.minorValue)"
    let detailAlert = UIAlertController(title: "Details", message: detailMessage, preferredStyle: .Alert)
    detailAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    self.presentViewController(detailAlert, animated: true, completion: nil)
  }
}

// MARK: - CLLocationManagerDelegate

extension ItemsViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager!, monitoringDidFailForRegion region: CLRegion!, withError error: NSError!) {
        print("Failed monitoring region: \(error.description)")
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print("Location manager failed: \(error.description)")
    }
    
   /* func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        if let beacons = beacons as? [CLBeacon] {
            for beacon in beacons {
                for item in items {
                    if item == beacon {
                        item.lastSeenBeacon = beacon
                    }
                }
            }
        }
    }*/
}
