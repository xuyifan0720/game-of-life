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
    
    func configureView()
    {
        // Update the user interface for the detail item.
        for _ in 0 ... 100
        {
            print("lol")
        }
        if let detail = self.detailItem
        {
            print(detail.cellsAlive)
            print(drawer == nil)
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
    {
        didSet
        {
            // Update the view.
            
            //self.configureView()
        }
    }


}

