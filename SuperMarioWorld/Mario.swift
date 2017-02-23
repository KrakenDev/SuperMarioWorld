//
//  Player.swift
//  Super Ninja World
//
//  Created by Hector Matos on 3/17/16.
//  Copyright © 2016 Hector Matos. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpBitMasks()
    }
    
    func update(_ currentTime: CFTimeInterval) {
        // Handle mario updates.
    }
}

//MARK: GameNode Protocol
extension Player: GameNode {
    func setUpBitMasks() {
        categorySetType = .mario
        contactTestSetType = [.feather, .coinBox]
        collisionSetType = [.coinBox]
    }
    
    func collidedWith(_ node: GameNode) {
        if node.categorySetType == .feather {
            //Give me a cape!
        }
    }
}
