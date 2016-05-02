

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var startNavButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var searchLocationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        addBorderToButton()
        // Do any additional setup after loading the view.
    }
    
    func addBorderToButton()
    {
        exitButton.layer.cornerRadius = 1
        exitButton.layer.borderWidth = 1
        exitButton.layer.borderColor = UIColor.blackColor().CGColor;
        
        startNavButton.layer.cornerRadius = 1
        startNavButton.layer.borderWidth = 1
        startNavButton.layer.borderColor = UIColor.blackColor().CGColor;
        
      /*  bookmarkButton.layer.cornerRadius = 5
        bookmarkButton.layer.borderWidth = 1
        bookmarkButton.layer.borderColor = UIColor.blackColor().CGColor;
        
        searchLocationButton.layer.cornerRadius = 5
        searchLocationButton.layer.borderWidth = 1
        searchLocationButton.layer.borderColor = UIColor.blackColor().CGColor;
 */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitButtonAction(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.playAudio("back")
        self .dismissViewControllerAnimated(true, completion:nil)
    }
    
    @IBAction func searchButtonAction(sender: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.playAudio("search")
    }
    
    @IBAction func navigateButtonAction(sender: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.playAudio("current")
    }
    
    @IBAction func bookmarkButtonAction(sender: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.playAudio("bookmark")
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
