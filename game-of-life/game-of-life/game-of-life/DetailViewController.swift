//
//  DetailViewController.swift
//  game-of-life
//
//  Created by Hannah Cole on 11/26/16.
//  Copyright © 2016 Yifan and Hannah Production. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var slider: UIStackView!
    @IBOutlet weak var drawer: drawView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var timers = [Timer]()
    
    
    @IBAction func evolve1GenPressed(_ sender: Any)
    {
        drawer.col.evolve()
        drawer.setNeedsDisplay()
    }
    

    @IBAction func sliderChanged(_ sender: UISlider)
    {
        for timer in timers
        {
            timer.invalidate()
        }
        timers = [Timer]()
        let timer = Timer.scheduledTimer(timeInterval: TimeInterval(sender.maximumValue - sender.value), target: self,
                                         selector: #selector(self.update), userInfo: nil, repeats: true)
        timers.append(timer)

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
    
    func update()
    {
        drawer.col.evolve()
        drawer.setNeedsDisplay()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        let timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timers.append(timer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var detailItem: Colony?
    
    
}

