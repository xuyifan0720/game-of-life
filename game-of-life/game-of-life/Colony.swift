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

class Colony: CustomStringConvertible, Equatable{
    var cellsAlive : Set<Cell>
    var genNum : Int
    var index: Int
    static var nextColonyID = 0
    var colonyID: Int
    var wrappingOn: Bool
    var colonySize: Int
    
    init (index: Int){
        colonySize = 60
        cellsAlive = Set<Cell>()
        genNum = 0
        self.index = index
        colonyID = Colony.nextColonyID
        Colony.nextColonyID += 1
        wrappingOn = true
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
    
    func toggleWrapping() {
        wrappingOn = !wrappingOn
    }
    
    func wrapInt(x:Int) -> Int {
        if wrappingOn {
            if (x >= colonySize) {
                return x - colonySize
                
            }
            else if (x < 0) {
                return colonySize + x
            }
            else {
                return x
            }
        } else {
            return x
        }
    }
    
    fileprivate func isCellAliveNextGen(_ x:Int, y:Int)->Bool {
        if (x < colonySize && y < colonySize && x >= 0 && y >= 0) {
            var aliveNeighbors = 0
            for xNeighbor in (x-1...x+1) {
                for yNeighbor in (y-1...y+1) {
                    if (isCellAlive(wrapInt(x: xNeighbor), y: wrapInt(x: yNeighbor)) && Cell(x:x, y:y) != Cell(x: xNeighbor, y: yNeighbor)) {
                        
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
        else {
            return false
        }
    }
    
    
    func evolve()
    {
        var nextGen = Set<Cell>()
        for cell in cellsAlive{
            for xToCheck in (cell.xCoor-1...cell.xCoor+1)  {
                for yToCheck in (cell.yCoor-1...cell.yCoor+1) {
                    if isCellAliveNextGen(wrapInt(x: xToCheck), y: wrapInt(x: yToCheck)) {
                        nextGen.insert(Cell(x:wrapInt(x: xToCheck), y: wrapInt(x: yToCheck)))
                    }
                }
            }
        }
        cellsAlive = nextGen
        genNum = genNum + 1
    }
    
    fileprivate func colonyRowString(_ row:Int)->String {
        var rowString = ""
        for column in (0...colonySize - 1) {
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
        for row in (0...colonySize - 1) {
            description1 += colonyRowString(row) + "\n"
        }
        return description1
    }
}

func == (left: Colony, right: Colony) -> Bool
{
    return left.cellsAlive == right.cellsAlive && left.genNum == right.genNum && left.colonyID == right.colonyID
}
