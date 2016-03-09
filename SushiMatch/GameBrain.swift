//
//  GameBrain.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/13/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation

class GameBrain: NSObject, TileGridDelegate {
    
    // How Many tiles
    
    let cols = 6
    let rows = 6
    
    var currentTile: CurrentTile!
    var tileGrid: TileGrid!
    var nextTileToPlace: TileType!
    var matchesArray = [GameSquare]()
    
    // GameSquares map out the contents of the board
    var tileArray = [[GameSquare]]()
    
    
    
    
    // Mark Game Functions 
    
    // Get the next Tile to place 
    
    func getNextTileToPlace() {
        // TODO: Change random to weighted
        nextTileToPlace = TileType.randomTile()
        currentTile.nextTile(nextTileToPlace)
    }
    
    
    // MARK: TileGrid Delegate 
    
    func tileTouched(row: Int, col: Int) {
        let tile = tileArray[row][col]
        
        tile.tileType = nextTileToPlace
        tileGrid.setTiles(tileArray)
        
        getNextTileToPlace()
        checkMatchForTileAtRow(row, col: col)
    }
    
    
    // Mark: Setup 
    
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
        matchesArray.removeAll()
        
        // Check for matches recursively, populate matches array with matched squares
        checkMatchForGameSquare(tileArray[row][col])
        
        // TODO: Need to check the board after a match has occurred for a match with the
        
        // Look at the matches, more than 2 score!
        if matchesArray.count > 2 {
            // Clear the squares
            for i in 1..<matchesArray.count {
                matchesArray[i].tileType = .one
            }
            // Get the first square and advance it.
            let theSquare = matchesArray[0]
            let theType = theSquare.tileType
            if let nextType = theType.nextTile() {
                print("Matching tile")
                print("Current type \(theType) next type \(nextType)")
                tileArray[row][col].tileType = nextType
            }
            
            // Check again in case a new match has been created by the new tile
            checkMatchForTileAtRow(row, col: col)
            
            tileGrid.setTiles(tileArray)
                
        }
    }
    
    
    func checkMatchForGameSquare(gameSquare: GameSquare) {
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
            
            // print("> Checking \(i) \(checkRow) \(checkCol)")
            
            if checkRow >= 0 && checkCol >= 0 && checkRow < rows && checkCol < cols {
                // print("This square is on the board")
                let adjacentSquare = tileArray[checkRow][checkCol]
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
