
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    let imvc = ItemsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorderToButton()
        
        imvc.configureBeacon();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addBorderToButton()
    {
        exitButton.layer.cornerRadius = 1
        exitButton.layer.borderWidth = 1
        exitButton.layer.borderColor = UIColor.blackColor().CGColor;
       /*
        startButton.layer.cornerRadius = 1
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.blackColor().CGColor;
 */
    }
    
    @IBAction func startButtonAction(sender: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.playAudio("beep-06")
    }

}

