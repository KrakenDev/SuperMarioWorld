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
