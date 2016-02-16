//
//  CurrentTile.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/13/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//


// TODO: Set easing on next tile 
// TODO: Add particle effect on next tile


import SpriteKit


class CurrentTile: SKSpriteNode {
    
    let background: RoundedRectangle!
    let tile: Tile!
    let tileDropAction: SKAction!
    
    func nextTile(tileType: TileType) {
        tile.tileType = tileType
        tile.runAction(tileDropAction)
    }
    
    
    init(size: CGSize) {
        let backgroundSize = CGSize(width: size.width + 20, height: 200)
        background = RoundedRectangle(size: backgroundSize, radius: 20)
        tile = Tile(size: size)
        let tileEndY = -size.height - 3
        let tileStartY = -tileEndY
        tile.position.y = tileStartY
        
        let startPosition = SKAction.moveToY(tileStartY, duration: 0.0)
        let dropAction = SKAction.moveToY(-size.height - 3, duration: 0.53)
        tileDropAction = SKAction.sequence([startPosition, dropAction])
        
        super.init(texture: nil, color: UIColor.clearColor(), size: size)
        
        addChild(background)
        addChild(tile)
        
        tile.setTileIndex(3)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
