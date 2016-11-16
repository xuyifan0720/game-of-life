//
//  Cell.swift
//  game-of-life
//
//  Created by Hannah Cole on 11/14/16.
//  Copyright © 2016 Yifan&Hannah_production. All rights reserved.
//



import Foundation

struct Cell:Hashable {
    var xCoor: Int = 0
    var yCoor: Int = 0
    
    var hashValue: Int {
        return xCoor.hashValue ^ yCoor.hashValue
    }
    
    init (x:Int, y:Int){
        xCoor = x
        yCoor = y
    }
    
}

func == (cell1: Cell, cell2: Cell)-> Bool {
    return (cell1.xCoor == cell2.xCoor && cell1.yCoor == cell2.yCoor)
}
