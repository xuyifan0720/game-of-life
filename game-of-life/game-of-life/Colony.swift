//
//  Colony.swift
//  game-of-life
//
//  Created by Hannah Cole on 11/26/16.
//  Copyright © 2016 Yifan and Hannah Production. All rights reserved.
//
//
//  Colony.swift
//  GameOfLife
//
//  Created by Hannah Cole on 9/19/16.
//  Copyright © 2016 Hannah Cole. All rights reserved.
//


import Foundation

class Colony:CustomStringConvertible{
    var cellsAlive : Set<Cell>
    var genNum : Int
    
    init (){
        cellsAlive = Set<Cell>()
        genNum = 0
    }
    
    func setCellAlive(_ x:Int, y:Int) {
        cellsAlive.insert(Cell(x:x, y:y))
    }
    
    func setCellDead(_ x:Int, y:Int) {
        cellsAlive.remove(Cell(x:x, y:y))
    }
    
    func isCellAlive(_ x:Int, y:Int) -> Bool {
        return cellsAlive.contains(Cell(x:x, y:y))
    }
    
    func resetColony() {
        cellsAlive = Set<Cell>()
    }
    
    fileprivate func isCellAliveNextGen(_ x:Int, y:Int)->Bool {
        var aliveNeighbors = 0
        for xNeighbor in (x-1...x+1) {
            for yNeighbor in (y-1...y+1) {
                if isCellAlive(xNeighbor, y: yNeighbor) && Cell(x:x, y:y) != Cell(x: xNeighbor, y: yNeighbor) {
                    
                    aliveNeighbors = aliveNeighbors + 1
                }
            }
        }
        switch aliveNeighbors {
        case 3: return true
        case 2: return isCellAlive(x, y: y)
        default: return false
        }
        
    }
    
    
    func evolve(){
        var nextGen = Set<Cell>()
        for cell in cellsAlive{
            for xToCheck in (cell.xCoor-1...cell.xCoor+1)  {
                for yToCheck in (cell.yCoor-1...cell.yCoor+1) {
                    if isCellAliveNextGen(xToCheck, y: yToCheck) {
                        nextGen.insert(Cell(x:xToCheck, y:yToCheck))
                    }
                }
            }
        }
        cellsAlive = nextGen
        genNum = genNum + 1
    }
    
    fileprivate func colonyRowString(_ row:Int)->String {
        var rowString = ""
        for column in (0...19) {
            if (isCellAlive(row, y:column)) {
                rowString += "*"
            } else {
                rowString += " "
            }
        }
        return rowString
    }
    
    var description: String {
        var description1 = "Generation #\(genNum) \n"
        for row in (0...19) {
            description1 += colonyRowString(row) + "\n"
        }
        return description1
    }
}
