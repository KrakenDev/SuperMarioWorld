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

