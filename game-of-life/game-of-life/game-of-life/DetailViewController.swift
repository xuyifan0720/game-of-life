//
//  DetailViewController.swift
//  game-of-life
//
//  Created by Hannah Cole on 11/26/16.
//  Copyright © 2016 Yifan and Hannah Production. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var drawer: drawView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBAction func evolve1GenPressed(_ sender: Any) {
        drawer.col.evolve()
        drawer.setNeedsDisplay()
    }
    
    @IBAction func toggleWrapping(_ sender: UISwitch) {
        if sender.isOn {
            drawer.col.wrappingOn = true
            drawer.setNeedsDisplay()
        } else {
            drawer.col.wrappingOn = false
            drawer.setNeedsDisplay()
        }
    }


    func configureView()
        
    {
        // Update the user interface for the detail item.
        if let detail = self.detailItem
        {
            self.navigationItem.title =  "Colony \(detail.index)"
            drawer.col = detail
            drawer.setNeedsDisplay()
            if let label = self.descriptionLabel
            {
                label.text = detail.description
            }
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var detailItem: Colony?
    
    
}

