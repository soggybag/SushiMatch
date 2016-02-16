//
//  SushiSprite.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/13/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit
import SpriteKit

class SushiSprite: SKSpriteNode {
    
    let frames: [SKTexture]!
    
    func setFrame(index: Int) {
        texture = frames[index]
    }
    
    init() {
        let atlas = SKTextureAtlas(named: "sushi")
        var frames = [SKTexture]()
        for i in 0...atlas.textureNames.count {
            let textureName = "Sushi-\(i)"
            frames.append(atlas.textureNamed(textureName))
        }
        
        let texture = frames[0]
        let size = texture.size()
        
        self.frames = frames
        
        super.init(texture: texture, color: UIColor.clearColor(), size: size)
        
        self.userInteractionEnabled = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
