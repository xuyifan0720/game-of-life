//
//  MasterViewController.swift
//  game-of-life
//
//  Created by Hannah Cole on 11/26/16.
//  Copyright © 2016 Yifan and Hannah Production. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController{

    var detailViewController: DetailViewController? = nil
    var data = ColonyList()
    let templates = ["basic", "glider gun", "smile", "troll"]
    
  
    @IBOutlet weak var templatePicked: UITextField!
    
    @IBAction func back(_ sender: Any)
    {
        let index = templates.index(of: templatePicked.text!)
        if index == 0
        {
            templatePicked.text = templates[templates.count - 1]
        }
        else
        {
            templatePicked.text = templates[index! - 1]
        }
    }
    
    @IBAction func forward(_ sender: Any)
    {
        let index = templates.index(of: templatePicked.text!)
        if index == templates.count - 1
        {
            templatePicked.text = templates[0]
        }
        else
        {
            templatePicked.text = templates[index! + 1]
        }

    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        templatePicked.text = templates[0]
    }

    
    override func viewWillAppear(_ animated: Bool)
    {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addNewItem(sender: AnyObject)
    {
        let newItem = data.createColony(template: templatePicked.text!)
        if let index = data.items.index(of: newItem)
        {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at:[indexPath],
                                 with: .automatic)
        }
    }


    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showDetail"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let object = data.items[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

<<<<<<< HEAD
        let object = objects[indexPath.row]
=======
        let object = data.items[indexPath.row]
<<<<<<< HEAD
>>>>>>> b0cc8ae234de9b06b24561e1ddc4c464937ef421
        cell.textLabel!.text = object.description
=======
        cell.textLabel!.text = "Colony \(indexPath.row)"
>>>>>>> 8d3ac4adcef58c85e07fbc0d7f682ecb34556782
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            data.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert
        {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

