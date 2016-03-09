//
//  AlertPopup.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/27/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit
import SpriteKit

class AlertPopup: SKSpriteNode {
    let background: SKSpriteNode!
    let box: RoundedRectangle!
    let titleLabel: SKLabelNode!
    let messageLabel: SKLabelNode!
    let closeButton: SKLabelNode!
    
    let boxSize = CGSize(width: 200, height: 200)
    
    
    func closePopup() {
        print("Close popup")
        
        // runAction move box
        // runAction Block removeFromParent
        
        removeFromParent()
    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("Touches ended")
        guard let touch = touches.first else {
            return
        }
        
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        print(node.name)
        if node.name == "closebutton" {
            closePopup()
        }
    }
    
    
    func createSubNodes() {
        
    }
    
    
    init(title: String?, message: String?, size: CGSize) {
        background = SKSpriteNode(texture: nil, color: UIColor(white: 0, alpha: 0.75), size: size)
        background.name = "background"
        box = RoundedRectangle(size: boxSize, radius: 20)
        titleLabel = SKLabelNode(text: title)
        messageLabel = SKLabelNode(text: message)
        closeButton = SKLabelNode(text: "Close")
        
        background.position.x = size.width / 2
        background.position.y = size.height / 2
        
        box.position.x = size.width / 2
        box.position.y = size.height / 2 // -box.frame.height / 2
        box.name = "box"
        
        titleLabel.position.y = 50
        titleLabel.name = "titlelabel"
        titleLabel.fontColor = UIColor.blackColor()
        
        messageLabel.fontColor = UIColor.blackColor()
        messageLabel.fontSize = 18
        messageLabel.name = "messagelabel"
        
        closeButton.position.y = -80
        closeButton.name = "closebutton"
        closeButton.fontColor = UIColor.blueColor()
        closeButton.fontSize = 18
        
        super.init(texture: nil, color: UIColor.clearColor(), size: size)
        userInteractionEnabled = true
        
        addChild(background)
        addChild(box)
        box.addChild(titleLabel)
        box.addChild(messageLabel)
        box.addChild(closeButton)
        
        let showBox = SKAction.moveToY(size.height / 2, duration: 0.4)
        showBox.timingMode = .EaseOut
        
        box.runAction(showBox)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
