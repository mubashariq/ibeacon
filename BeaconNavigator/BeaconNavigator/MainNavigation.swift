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
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        populateFloorData()
        // Do any additional setup after loading the view.
    }
    func populateFloorData()
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if(appDelegate.CurrentBeacon=="1")
        {
        items = ["First Floor", "Nearest Room is 101", "You are standing near entrance", "Your nearest location in helping desk","Elevator is 100 meter away straight","On your left is head office","Library on third floor"]
        }
        else if (appDelegate.CurrentBeacon=="2")
        {
            items = ["Second Floor", "Nearest Room is 201", "You are standing near entrance", "Your nearest location in helping desk","Elevator is 200 meter away straight","On your left is cafe area","Library on third floor"]
        }
        else if(appDelegate.CurrentBeacon=="3")
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
    
    @IBAction func exitButtonAction(sender: AnyObject) {
        
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
        
        return cell
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
