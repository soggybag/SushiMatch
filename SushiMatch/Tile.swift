//
//  Tile.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/13/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit
import SpriteKit

class Tile: SKShapeNode {
    let sushiSprite: SushiSprite!
    let background: RoundedRectangle!
    
    var tileType: TileType = .one {
        didSet {
            setTileIndex(tileType.rawValue)
            setTileColor(tileType.color())
        }
    }
    
    func setTileIndex(index: Int) {
        sushiSprite.setFrame(index)
    }
    
    func setTileColor(color: UIColor) {
        background.fillColor = color
    }
    
    
    init(size: CGSize) {
        background = RoundedRectangle(size: size, radius: 12)
        sushiSprite = SushiSprite()
        
        super.init()
        
        addChild(background)
        addChild(sushiSprite)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
