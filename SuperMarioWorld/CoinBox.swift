//
//  Plant.swift
//  SuperNinjaWorld
//
//  Created by Hector Matos on 4/2/16.
//  Copyright © 2016 Hector Matos. All rights reserved.
//

import SpriteKit

class CoinBox: SKSpriteNode {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpBitMasks()
    }
}

//MARK: GameNode Protocol
extension CoinBox: GameNode {
    func setUpBitMasks() {
        categorySetType = .coinBox
        contactTestSetType = .mario
    }

    func collidedWith(_ node: GameNode) {
        // Spawn a feather!
    }
}

