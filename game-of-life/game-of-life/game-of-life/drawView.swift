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
    
    var col = Colony(index: -1){
        didSet{
            setNeedsDisplay()
        }
    }
    var coorX = 0
    var coorY = 0
    let gridNumber = CGFloat(60)
    var s = ""
    // write the coordinates on the left
    let place = "l"
    
    // 0 is setting cells dead, 1 is setting cells alive
    var setMode = 0
    

    // converts the coordinates of view to that of the cell
    func convertCordinate(rect: CGRect, x: CGFloat, y: CGFloat)->(Int, Int)
    {
        let restriction = rect.width > rect.height ? rect.height : rect.width
        let upperbound = (rect.height - restriction)/2
        let sidebound = (rect.width - restriction)/2
        let cellSize = restriction/gridNumber
        return (Int((x - sidebound)/cellSize), Int((y - upperbound)/cellSize))
    }
    
    func checkInBound(x: Int, y : Int)-> Bool
    {
        return x > 0 && y > 0 && CGFloat(x) < gridNumber && CGFloat(y) < gridNumber
    }
    
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
        
        let fieldColor: UIColor = UIColor.darkGray
        let fieldFont = UIFont(name: "Helvetica Neue", size: 18)
        
        let attributes: NSDictionary = [
            NSForegroundColorAttributeName: fieldColor,
            NSFontAttributeName: fieldFont!
        ]
        
        s.draw(in: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 48.0), withAttributes: attributes as? [String : Any])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let location = touches.first!.location(in: self)
        let (x, y) = convertCordinate(rect: frame, x: location.x, y: location.y)
        coorX = x
        coorY = y
        s = "x = \(x), y = \(y)"
        if col.cellsAlive.contains(Cell(x: x, y: y))
        {
            setMode = 0
            if checkInBound(x: x, y: y)
            {
                col.setCellDead(x, y: y)
            }
        }
        else
        {
            setMode = 1
            if checkInBound(x: x, y: y)
            {
                col.setCellAlive(x, y: y)
            }
            
        }
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let location = touches.first!.location(in: self)
        let (x, y) = convertCordinate(rect: frame, x: location.x, y: location.y)
        coorX = x
        coorY = y
        s = "x = \(x), y = \(y)"
        if setMode == 0
        {
            if checkInBound(x: x, y: y)
            {
                col.setCellDead(x, y: y)
            }
        }
        else
        {
            if checkInBound(x: x, y: y)
            {
                col.setCellAlive(x, y: y)
            }
        }
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        s = ""
    }
}
