
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
    }

    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/
    
    @IBAction func exitButtonAction(sender: AnyObject) {
        
        self .dismissViewControllerAnimated(true, completion:nil)
    }
    
    @IBAction func navigateButtonAction(sender: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.playAudio()
    }
    
    @IBAction func bookmarkButtonAction(sender: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.playAudio()
    }

}
