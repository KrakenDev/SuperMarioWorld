//
//  GameNode.swift
//  SuperNinjaWorld
//
//  Created by Hector Matos on 4/2/16.
//  Copyright © 2016 Hector Matos. All rights reserved.
//

import SpriteKit

protocol GameNode: class {
    var node: SKNode { get }
    var categorySetType: SpriteType { get set }
    var contactTestSetType: SpriteType { get set }
    var collisionSetType: SpriteType { get set }
    
    func setUpBitMasks()
    func update(_ currentTime: TimeInterval)
    func collidedWith(_ node: GameNode)
}

extension GameNode where Self: SKNode {
    var node: SKNode { return self }
    
    var categorySetType: SpriteType {
        get { return SpriteType(rawValue: physicsBody?.categoryBitMask ?? SpriteType.none.rawValue) }
        set { physicsBody?.categoryBitMask = newValue.rawValue }
    }
    
    var contactTestSetType: SpriteType {
        get { return SpriteType(rawValue: physicsBody?.contactTestBitMask ?? SpriteType.none.rawValue) }
        set { physicsBody?.contactTestBitMask = newValue.rawValue }
    }
    
    var collisionSetType: SpriteType {
        get { return SpriteType(rawValue: physicsBody?.collisionBitMask ?? SpriteType.none.rawValue) }
        set { physicsBody?.collisionBitMask = newValue.rawValue }
    }

    func setUpBitMasks() {}
    func update(_ currentTime: TimeInterval) {}
    func collidedWith(_ node: GameNode) {
        print("\(categorySetType) collided with \(node.categorySetType).")
    }
}
