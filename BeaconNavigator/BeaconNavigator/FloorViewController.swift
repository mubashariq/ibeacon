//incomplete
import UIKit

class FloorViewController: UIViewController {

    @IBOutlet weak var firstFloorButton: UIButton!
    @IBOutlet weak var secondFloorButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FloorViewController.methodOfReceivedNotification(_:)), name:"NotificationIdentifier", object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func methodOfReceivedNotification(notification: NSNotification){
        //Take Action on Notification
        let item = notification.object as! Item
        if(item.majorValue==1)
        {
            firstFloorButton.backgroundColor = UIColor.redColor()
            secondFloorButton.backgroundColor = UIColor.clearColor()

        }
        else if(item.majorValue==2)
        {
            firstFloorButton.backgroundColor = UIColor.clearColor();
            secondFloorButton.backgroundColor = UIColor.redColor()
        }
        else if(item.majorValue==3)
        {
            firstFloorButton.backgroundColor = UIColor.clearColor();
            secondFloorButton.backgroundColor = UIColor.clearColor()
        }
        else if(item.majorValue==4)
        {
            firstFloorButton.backgroundColor = UIColor.clearColor();
            secondFloorButton.backgroundColor = UIColor.clearColor()
        }
    }
    
    @IBAction func exitButtonAction(sender: AnyObject) {
        
        self .dismissViewControllerAnimated(true, completion:nil)
    }
    
    func firstFloor()
    {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
