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
    
    var closeAction: Void -> Void
    
    let boxSize = CGSize(width: 200, height: 200)
    
    
    func closePopup() {
        // runAction move box
        let hideBox = SKAction.moveToY(-100, duration: 1.0)
        let hidebackground = SKAction.fadeAlphaTo(0, duration: 1.0)
        let wait = SKAction.waitForDuration(1.0)
        let completionBlock = SKAction.runBlock { () -> Void in
            print("remove from parent")
            self.closeAction()
            self.removeFromParent()
        }
        let seq = SKAction.sequence([wait, completionBlock])
        // runAction Block removeFromParent
        box.runAction(hideBox)
        background.runAction(hidebackground)
        self.runAction(seq)
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
    
    
    init(title: String?, message: String?, size: CGSize, closeAction: Void -> Void) {
        self.closeAction = closeAction
        
        background = SKSpriteNode(texture: nil, color: UIColor(white: 0, alpha: 0.75), size: size)
        background.name = "background"
        background.alpha = 0
        
        box = RoundedRectangle(size: boxSize, radius: 20)
        titleLabel = SKLabelNode(text: title)
        messageLabel = SKLabelNode(text: message)
        closeButton = SKLabelNode(text: "Close")
        
        background.position.x = size.width / 2
        background.position.y = size.height / 2
        
        box.position.x = size.width / 2
        box.position.y = 0 - box.frame.height // size.height //  / 2 // -box.frame.height / 2
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
        
        let showBox = SKAction.moveToY(size.height / 2, duration: 1.0)
        showBox.timingMode = .EaseOut
        let showBackground = SKAction.fadeAlphaTo(1.0, duration: 1.0)
        
        box.runAction(showBox)
        background.runAction(showBackground)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
