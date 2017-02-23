//
//  Feather.swift
//
//  Created by Hector Matos on 3/17/16.
//  Copyright © 2016 Hector Matos. All rights reserved.
//

import SpriteKit

class Feather: SKSpriteNode {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpBitMasks()
    }
}

//MARK: GameNode Protocol
extension Feather: GameNode {
    func setUpBitMasks() {
        categorySetType = .feather
    }
}
