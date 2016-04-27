//
//  FloorViewController.swift
//  BeaconNavigator
//
//  Created by mubahir on 04/04/2016.
//  Copyright © 2016 mubahir. All rights reserved.
//

import UIKit

class FloorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var bookMarkButton: UIButton!
    @IBOutlet weak var findTextField: UITextField!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    var items: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorderToButton()
        
        var frameRect = findTextField.frame
        frameRect.size.height = 60 // <-- Specify the height you want here.
        findTextField.frame = frameRect;
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FloorViewController.methodOfReceivedNotification(_:)), name:"NotificationIdentifier", object: nil)
        tableView.hidden = true
        bookMarkButton.hidden=true
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
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
    
    @IBAction func findButtonAction(sender: AnyObject) {
        
        
        findTextField .resignFirstResponder()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.playAudio("beep-06")
        
        let x = (findTextField.text! as NSString).substringWithRange(NSMakeRange(0, 1))
        populateFloorData(x as String)
        tableView.hidden = false
        bookMarkButton.hidden = false
        findTextField.hidden = true
        findButton.hidden = true
        tableView.reloadData()
    }
    
    func populateFloorData(number: String)
    {
        if(number=="1")
        {
            items = ["First Floor", "Nearest Room is 101", "You are standing near entrance", "Your nearest location in helping desk","Elevator is 100 meter away straight","On your left is head office","Library on third floor"]
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.playAudio("beep-06")
            
        }
        else if (number=="2")
        {
            items = ["Second Floor", "Nearest Room is 201", "You are standing near entrance", "Your nearest location in helping desk","Elevator is 200 meter away straight","On your left is cafe area","Library on third floor"]
        }
        else if(number=="3")
        {
            items = ["Third Floor", "Nearest Room is 301", "You are standing near entrance", "Your nearest location in helping desk","Elevator is 300 meter away straight","On your left is meeting room","Library on third floor"]
        }
        else
        {
            items = ["Forrth Floor", "Nearest Room is 401", "You are standing near entrance", "Your nearest location in helping desk","Elevator is 400 meter away straight","On your left is cafe area","Library on third floor"]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.backgroundColor = tableView.backgroundColor
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text = self.items[indexPath.row]
        cell.textLabel?.font = cell.textLabel?.font.fontWithSize(18)
        return cell
    }
    
    func methodOfReceivedNotification(notification: NSNotification){
        //Take Action on Notification
        let item = notification.object as! Item
        /*
        if(item.majorValue==1)
        {
            firstFloorButton.backgroundColor = UIColor.redColor()
            secondFloorButton.backgroundColor = UIColor.clearColor()
            thirdFloorButton.backgroundColor = UIColor.clearColor()
            fourthFloorButton.backgroundColor = UIColor.clearColor()
        }
        else if(item.majorValue==2)
        {
            firstFloorButton.backgroundColor = UIColor.clearColor();
            secondFloorButton.backgroundColor = UIColor.redColor()
            thirdFloorButton.backgroundColor = UIColor.clearColor()
            fourthFloorButton.backgroundColor = UIColor.clearColor()
        }
        else if(item.majorValue==3)
        {
            firstFloorButton.backgroundColor = UIColor.clearColor();
            secondFloorButton.backgroundColor = UIColor.clearColor()
            thirdFloorButton.backgroundColor = UIColor.redColor()
            fourthFloorButton.backgroundColor = UIColor.clearColor()
        }
        else if(item.majorValue==4)
        {
            firstFloorButton.backgroundColor = UIColor.clearColor();
            secondFloorButton.backgroundColor = UIColor.clearColor()
            thirdFloorButton.backgroundColor = UIColor.clearColor()
            fourthFloorButton.backgroundColor = UIColor.redColor()
        }*/
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
