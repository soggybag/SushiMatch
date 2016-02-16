//
//  RoundedRectangle.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/13/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit
import SpriteKit

class RoundedRectangle: SKShapeNode {

    init(size: CGSize, radius: CGFloat) {
        super.init()
        let rect = CGRect(x: size.width / -2, y: size.height / -2, width: size.width, height: size.height)
        path = CGPathCreateWithRoundedRect(rect, radius, radius, nil)
        fillColor = UIColor(white: 1, alpha: 0.75)
        strokeColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
