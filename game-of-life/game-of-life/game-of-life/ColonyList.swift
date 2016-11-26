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
        var col = Colony()
        switch template
        {
        case "basic":
            break
        case "glider gun":
            col.setCellAlive(5, y: 4)
            break
        case "smile":
            col.setCellAlive(3, y: 5)
            break
        case "troll":
            col.setCellAlive(2, y: 1)
            break
        default:
            break
        }
        items.append(col)
        return col
    }
}
