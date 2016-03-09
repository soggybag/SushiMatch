//
//  GameViewController.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/11/16.
//  Copyright (c) 2016 mitchell hudson. All rights reserved.
//

import UIKit
// import QuartzCore
import SceneKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = view as! SKView
        skView.showsNodeCount = true
        skView.showsFPS = true
        skView.ignoresSiblingOrder = true
        
        let scene = GameScene(size: view.bounds.size)
        skView.presentScene(scene)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
