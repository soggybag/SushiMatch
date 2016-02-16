//
//  GameBrain.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/13/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation

class GameBrain: NSObject, TileGridDelegate {
    
    var currentTile: CurrentTile!
    var tileGrid: TileGrid!
    var nextTileToPlace: TileType!
    var matchesArray = [GameSquare]()
    
    let cols = 6
    let rows = 6
    
    var tileArray = [[GameSquare]]()
    
    
    // Get the next Tile to place 
    
    func getNextTileToPlace() {
        nextTileToPlace = TileType.randomTile()
        currentTile.nextTile(nextTileToPlace)
    }
    
    
    // MARK: TileGrid Delegate 
    
    func tileTouched(row: Int, col: Int) {
        print("Game Brain says tile touched \(row) \(col)")
        let tile = tileArray[row][col]
        
        tile.tileType = nextTileToPlace
        tileGrid.setTiles(tileArray)
        
        getNextTileToPlace()
        
        checkMatchForTileAtRow(row, col: col)
    }
    
    
    func makeGameSquares() {
        for row in 0..<rows {
            var rowArray = [GameSquare]()
            for col in 0..<cols {
                let gameSquare = GameSquare(row: row, col: col, tileType: .one)
                rowArray.append(gameSquare)
            }
            tileArray.append(rowArray)
        }
    }
    
    
    func checkMatchForTileAtRow(row: Int, col: Int) {
        print("Start Check...")
        matchesArray.removeAll()
         print("-----------------------")
        checkMatchForGameSquare(tileArray[row][col])
        print("Check complete")
        print(matchesArray.count)
        if matchesArray.count > 2 {
            for square in matchesArray {
                square.tileType = .one
            }
            
            tileGrid.setTiles(tileArray)
        }
    }
    
    
    func checkMatchForGameSquare(gameSquare: GameSquare) {
        print("Checking \(gameSquare.row) \(gameSquare.col)")
        
        let l: (row: Int, col: Int) = (row: 0, col: -1)
        let t: (row: Int, col: Int) = (row: -1, col: 0)
        let r: (row: Int, col: Int) = (row: 0, col: 1)
        let b: (row: Int, col: Int) = (row: 1, col: 0)
        
        let ltrb = [l, t, r, b]
        
        // Add this square to the matches array
        matchesArray.append(gameSquare)
        
        // Look at the four adjacent squares
        for i in ltrb {
            let checkRow = gameSquare.row + i.row
            let checkCol = gameSquare.col + i.col
            if checkRow > 0 && checkCol > 0 && checkRow < rows && checkCol < cols {
                let adjacentSquare = tileArray[checkRow][checkCol]
                
                print("Adjacent squares")
                print("Row: \(adjacentSquare.row) Col: \(adjacentSquare.col)")
                
                // The adjacent square is the same type
                if gameSquare.tileType == adjacentSquare.tileType {
                    // This square has not been found
                    if !matchesArray.contains(adjacentSquare) {
                        checkMatchForGameSquare(adjacentSquare)
                    }
                    
                }
            }
        }
    }
    
    
    init(currentTile: CurrentTile, tileGrid: TileGrid) {
        super.init()
        
        self.nextTileToPlace = .two
        
        self.currentTile = currentTile
        self.tileGrid = tileGrid
        
        self.tileGrid.delegate = self
        
        makeGameSquares()
        
        currentTile.nextTile(nextTileToPlace)
    }
}
