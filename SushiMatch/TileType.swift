//
//  TileType.swift
//  SushiMatch
//
//  Created by mitchell hudson on 2/13/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit
import GameplayKit

enum TileType: Int {
    case one, two, three, four, five, six, seven, eight
    
    private static let tileAlpha: CGFloat = 0.75
    
    func color() -> UIColor {
        switch self {
        case one:   return UIColor(white: 1, alpha: TileType.tileAlpha)
        case two:   return UIColor(hue: 1, saturation: 1, brightness: 1, alpha: TileType.tileAlpha)
        case three: return UIColor(hue: 0.9, saturation: 1, brightness: 1, alpha: TileType.tileAlpha)
        case four:  return UIColor(hue: 0.8, saturation: 1, brightness: 1, alpha: TileType.tileAlpha)
        case five:  return UIColor(hue: 0.7, saturation: 1, brightness: 1, alpha: TileType.tileAlpha)
        case six:   return UIColor(hue: 0.6, saturation: 1, brightness: 1, alpha: TileType.tileAlpha)
        case seven: return UIColor(hue: 0.5, saturation: 1, brightness: 1, alpha: TileType.tileAlpha)
        case eight: return UIColor(hue: 0.4, saturation: 1, brightness: 1, alpha: TileType.tileAlpha)
        }
    }
    
    static let count: TileType.RawValue = {
        var maxValue: Int = 0
        while let _ = TileType(rawValue: ++maxValue) {}
        return maxValue
    }()
    
    static func randomTile() -> TileType {
        let source = GKRandomDistribution(forDieWithSideCount: self.count - 1)
        let r = source.nextInt()
        return TileType(rawValue: r)!
    }
    
    func nextTile() -> TileType? {
        print("-- nextTile")
        print("\(self.rawValue) \(TileType.count)")
        let nextType = TileType(rawValue: self.rawValue + 1)
        print("Next type \(nextType)")
        return nextType
    
    }
}
