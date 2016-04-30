//
//  MainNavigation.swift
//  BeaconNavigator
//
//  Created by mubashir on 13/03/2016.
//  Copyright © 2016 mubashir. All rights reserved.
//

import UIKit

class MainNavigation: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorderToButton()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        populateFloorData()
        // Do any additional setup after loading the view.
    }
    func populateFloorData()
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if(appDelegate.CurrentBeacon=="1")
        {
        items = ["First Floor", "Nearest Room is 101", "You are standing near entrance", "Your nearest location is helping desk","Elevator is 100 meter away straight","On your left is cafe area","Library is on third floor"]
        }
        else if (appDelegate.CurrentBeacon=="2")
        {
            items = ["Second Floor", "Nearest Room is 201", "You are standing near elevator", "Your nearest location is Mare building entrance","Elevator is 200 meter away straight","On your left is head office","Library is on third floor"]
        }
        else if(appDelegate.CurrentBeacon=="3")
        {
             items = ["Third Floor", "Nearest Room is 301", "You are standing near to stairs", "Your nearest location is silva building","Elevator is 300 meter away straight","On your left is meeting room","Library is 10 meter away left"]
        }
        else
        {
            items = ["Fourth Floor", "Nearest Room is 401", "You are standing near head office of informatic department", "Your nearest location is room 402","Elevator is 400 meter away straight","On your left is cafe area","Library is on third floor"]
        }
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitButtonAction(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.playAudio("beep-06")
        self .dismissViewControllerAnimated(true, completion:nil)
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        if(indexPath.row==1)
        {
            appDelegate.playAudio("beep-06")
        }
        else if(indexPath.row==2)
        {
            appDelegate.playAudio("beep-06")
        }
        else if(indexPath.row==3)
        {
            appDelegate.playAudio("beep-06")
        }
        else if(indexPath.row==4)
        {
            appDelegate.playAudio("beep-06")
        }
        else if(indexPath.row==5)
        {
            appDelegate.playAudio("beep-06")
        }
        else if(indexPath.row==6)
        {
            appDelegate.playAudio("beep-06")
        }
        else if(indexPath.row==7)
        {
            appDelegate.playAudio("beep-06")
        }
        else if(indexPath.row==8)
        {
            appDelegate.playAudio("beep-06")
        }
        else if(indexPath.row==9)
        {
            appDelegate.playAudio("beep-06")
        }
        else if(indexPath.row==10)
        {
            appDelegate.playAudio("beep-06")
        }
        else
        {
            appDelegate.playAudio("beep-06")
        }
        /*
         let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("YourViewController") as! BookMarkDetailsViewController
         
         self.navigationController!.pushViewController(secondViewController, animated: true)
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
