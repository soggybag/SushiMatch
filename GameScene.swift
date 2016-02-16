//
//  GameScene.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/11/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    
    var brain: GameBrain!
    
    let background = SKSpriteNode(imageNamed: "background") 
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        background.size = view.bounds.size
        background.position.x = size.width / 2
        background.position.y = size.height / 2
        background.zPosition = -1
        addChild(background)
        
        let tileGrid = TileGrid(size: size)
        addChild(tileGrid)
        
        let currentTileSize = CGSize(width: tileGrid.tileSize, height: tileGrid.tileSize)
        let currentTile = CurrentTile(size: currentTileSize)
        addChild(currentTile)
        
        currentTile.position.x = size.width / 2
        currentTile.position.y = size.height
        
        brain = GameBrain(currentTile: currentTile, tileGrid: tileGrid)
    }
    
}
