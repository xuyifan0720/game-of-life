//
//  ColonyList.swift
//  game-of-life
//
//  Created by Desheng Xu on 11/26/16.
//  Copyright © 2016 Yifan and Hannah Production. All rights reserved.
//

import Foundation

class ColonyList
{
    var items = [Colony]()
    
    func createColony(template: String) -> Colony
    {
        let col = Colony(index: items.count)
        switch template
        {
        case "blank":
            break
        case "basic":
            col.setCellAlive(3, y: 5)
            col.setCellAlive(4, y: 5)
            col.setCellAlive(5, y: 5)
            col.setCellAlive(4, y: 6)
            break
        case "glider gun":
            let xs = [6, 6, 7, 7, 4, 4, 5, 5, 6, 6, 7, 7, 7, 7, 8, 8, 9, 9, 10, 10, 4, 4, 5, 5, 6, 6, 3, 3, 2, 7, 7, 8, 4, 4, 5, 5]
            let ys = [2, 3, 2, 3, 14, 15, 13, 17, 12, 18, 12, 16, 18, 19, 12, 18, 13, 17, 14, 15, 22, 23, 22, 23, 22, 23, 24, 26, 26, 24, 26, 26, 36, 37, 36, 37]
            
            for counter in 1..<xs.count {
                col.setCellAlive(xs[counter], y: ys[counter])
            }
            break
        case "random":
            for _ in 0 ..< 1000
             {
             col.setCellAlive(Int(arc4random_uniform(60)) , y: Int(arc4random_uniform(60)))
             }
            break
        default:
            break
        }
        items.append(col)
        return col
    }
}
