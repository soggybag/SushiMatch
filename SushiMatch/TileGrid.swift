//
//  TileGrid.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/13/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//


// TODO: Arrange tiles in 2d array 


import UIKit
import SpriteKit
import GameplayKit

protocol TileGridDelegate {
    func tileTouched(row: Int, col: Int)
}

class TileGrid: SKSpriteNode, SushiTileDelegate {
    
    var delegate: TileGridDelegate?
    
    let margin: CGFloat = 10
    let space: CGFloat = 2
    let cols: Int = 6
    
    var tileArray = [[SushiTile]]()
    var tileSize: CGFloat = 0
    
    func setTiles(squaresArray: [[GameSquare]]) {
        for rowArray in squaresArray {
            for square in rowArray {
                tileArray[square.row][square.col].tileType = square.tileType
            }
        }
    }
    
    
    // MARK: SushiTile Delegate
    
    func tileTouched(tile: SushiTile) {
        // tile.tileType = TileType.randomTile()
        delegate?.tileTouched(tile.row, col: tile.col)
    }
    
    func makeTiles() {
        // Calculate Tile Size
        tileSize = (size.width - (margin * 2) - (space * (CGFloat(cols) - 1 ))) / CGFloat(cols)
        
        // Figure the x and y position for the grid
        let startX = margin + (tileSize / 2)
        let startY = (size.height - (tileSize * CGFloat(cols))) / 2
        
        let totalTiles = cols * cols
        
        // Make array rows 
        for _ in 0..<cols {
            tileArray.append([SushiTile]())
        }
        
        // Make Tiles
        for i in 0..<totalTiles {
            let row = i % cols
            let col = i / cols
            
            let tile = SushiTile(size: CGSize(width: tileSize, height: tileSize), row: row, col: col)
            
            // Add the tile to the array 
            tileArray[row].append(tile)
            
            let tileX = startX + CGFloat((i % cols) * Int(tileSize + space))
            let tileY = startY + CGFloat((i / cols) * Int(tileSize + space))
            
            tile.name = "tile"
            tile.tileType = .one
            tile.position.x = CGFloat(tileX)
            tile.position.y = CGFloat(tileY)
            tile.delegate = self
            
            addChild(tile)
        }
    }
    
    init(size: CGSize) {
        
        super.init(texture: nil, color: UIColor.clearColor(), size: size)
        
        self.userInteractionEnabled = true
        makeTiles()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
