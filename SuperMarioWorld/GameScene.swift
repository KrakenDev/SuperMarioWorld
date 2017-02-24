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
        if let nodeA = contact.bodyA.node as? GameNode,
           let nodeB = contact.bodyB.node as? GameNode {
            if nodeA.contactTestSetType.contains(nodeB.categorySetType) {
                nodeA.collidedWith(nodeB)
            }
            if nodeB.contactTestSetType.contains(nodeA.categorySetType) {
                nodeB.collidedWith(nodeA)
            }
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
