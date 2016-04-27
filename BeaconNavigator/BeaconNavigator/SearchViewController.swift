//
//  SearchViewController.swift
//  BeaconNavigator
//
//  Created by mubashir on 13/03/2016.
//  Copyright © 2016 mubashir. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorderToButton()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitButtonAction(sender: AnyObject) {
        
        self .dismissViewControllerAnimated(true, completion:nil)
    }

    func addBorderToButton()
    {
        exitButton.layer.cornerRadius = 1
        exitButton.layer.borderWidth = 1
        exitButton.layer.borderColor = UIColor.blackColor().CGColor;
        
        startButton.layer.cornerRadius = 1
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.blackColor().CGColor;
        
        /*  bookmarkButton.layer.cornerRadius = 5
         bookmarkButton.layer.borderWidth = 1
         bookmarkButton.layer.borderColor = UIColor.blackColor().CGColor;
         
         searchLocationButton.layer.cornerRadius = 5
         searchLocationButton.layer.borderWidth = 1
         searchLocationButton.layer.borderColor = UIColor.blackColor().CGColor;
         */
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
