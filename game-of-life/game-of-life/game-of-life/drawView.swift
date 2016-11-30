//
//  drawView.swift
//  game-of-life
//
//  Created by Desheng Xu on 11/26/16.
//  Copyright © 2016 Yifan and Hannah Production. All rights reserved.
//

import Foundation
import UIKit

class drawView: UIView
{
    
    var col = Colony()
    let gridNumber = CGFloat(60)
    
    
    
    override func draw(_ rect: CGRect)
    {
        let restriction = rect.width > rect.height ? rect.height : rect.width
        let upperbound = (rect.height - restriction)/2
        let sidebound = (rect.width - restriction)/2
        let cellSize = restriction/gridNumber
        for cell in col.cellsAlive
        {
            let xStart = CGFloat(cell.xCoor) * cellSize
            let yStart = CGFloat(cell.yCoor) * cellSize
            let rectangle = CGRect(x: sidebound + xStart, y: upperbound + yStart,
                                   width: cellSize, height: cellSize)
            let context = UIGraphicsGetCurrentContext()
            context?.setFillColor(red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(255.0), alpha: CGFloat(100.0))
            context?.setStrokeColor(red: CGFloat(0.0), green: CGFloat(255.0), blue: CGFloat(0.0), alpha: CGFloat(100.0))
            context?.strokePath()
            context?.fill(rectangle)
        }
    }
    
}
