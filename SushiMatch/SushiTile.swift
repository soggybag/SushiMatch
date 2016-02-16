//
//  SushiTile.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/15/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation
import UIKit

protocol SushiTileDelegate {
    func tileTouched(tile: SushiTile)
}

class SushiTile: Tile {
    
    var delegate: SushiTileDelegate?
    
    var row: Int!
    var col: Int!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let delegate = delegate {
            delegate.tileTouched(self)
        }
    }
    
    init(size: CGSize, row: Int, col: Int) {
        super.init(size: size)
        
        self.row = row
        self.col = col
        
        userInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}