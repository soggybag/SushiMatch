//
//  GameSquare.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/14/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import Foundation


class GameSquare: Equatable {
    var row: Int!
    var col: Int!
    var tileType: TileType!
    
    init(row: Int, col: Int, tileType: TileType) {
        self.row = row
        self.col = col
        self.tileType = tileType
    }
}


func == (lhs: GameSquare, rhs: GameSquare) -> Bool {
    return lhs.row == rhs.row && lhs.col == rhs.col
}