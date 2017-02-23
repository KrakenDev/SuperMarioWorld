//
//  GameScene.swift
//  Super Ninja World
//
//  Created by Hector Matos on 2/27/16.
//  Copyright (c) 2016 Hector Matos. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func sceneDidLoad() {
        super.sceneDidLoad()
        physicsWorld.contactDelegate = self
    }

    override func update(_ currentTime: TimeInterval) {
        updateChildren(children.flatMap { $0 as? GameNode })
    }
}

// MARK: SKPhysicsContactDelegate Functions
extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        //the contact bodies passed into this function aren't always ordered in the same way. Sometimes you may get bodyA as the Player and bodyB as the Enemy and vice versa. Let's sort them so we can have consistency. Trust me, consistency is a good thing.
        let (firstBody, secondBody) = contact.bodyA.categoryBitMask <= contact.bodyB.categoryBitMask ? (contact.bodyA, contact.bodyB) : (contact.bodyB, contact.bodyA)

        if let firstNode = firstBody.node as? GameNode, let secondNode = secondBody.node as? GameNode {
            firstNode.collidedWith(secondNode)
        }
    }
}

extension GameScene {
    func updateChildren(_ children: [GameNode]) {
        children.forEach {
            updateChildren($0.node.children.flatMap { $0 as? GameNode })
        }
    }
}
