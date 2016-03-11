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
    var popButton: SKLabelNode!
    
    
    func showPopup() {
        let popup = AlertPopup(title: "Alert!", message: "Hello World", size: frame.size) { () -> Void in
            print("Close box action run")
        }
        
        popup.zPosition = 999
        addChild(popup)
    }
    
    
    func setupPopButton() {
        popButton = SKLabelNode(text: "Pop!")
        popButton.fontName = "8-BIT WONDER" // TODO: Fix font
        popButton.position.x = popButton.frame.width / 2 + 20
        popButton.position.y = view!.frame.height - (popButton.frame.height / 2) - 40
        addChild(popButton)
    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else {
            // no touches
            return
        }
        
        let location = touch.locationInNode(self)
        if popButton.containsPoint(location) {
            showPopup()
        }
    }
    
    
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
        
        setupPopButton()
        
    }
    
}
