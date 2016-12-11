//
//  DetailViewController.swift
//  game-of-life
//
//  Created by Hannah Cole on 11/26/16.
//  Copyright © 2016 Yifan and Hannah Production. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var timers = [Timer]()
    @IBOutlet weak var drawer: drawView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var evolveSlider: UISlider!
    
    @IBOutlet weak var CoorLabel: UILabel!
    
    @IBAction func evolveOnce(_ sender: Any) {
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

    @IBAction func evolveSpeedChanged(_ sender: UISlider) {
            for timer in timers
            {
                timer.invalidate()
            }
            timers = [Timer]()
            if (sender.value == sender.minimumValue) {
                let timer1 = Timer.scheduledTimer(timeInterval: TimeInterval(sender.maximumValue - sender.value), target: self,
                                                 selector: #selector(self.update), userInfo: nil, repeats: false)
                timers.append(timer1)
                return
            }
            let timer2 = Timer.scheduledTimer(timeInterval: 0, target: self,
                                             selector: #selector(self.update), userInfo: nil, repeats: true)
            timers.append(timer2)
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
            CoorLabel.text = "X: \(drawer.coorX) Y: \(drawer.coorY)"
        }
    }
    
    func update(){
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
