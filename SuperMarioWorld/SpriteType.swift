import SpriteKit

struct SpriteType: OptionSet {
    let rawValue: UInt32
    
    static let none     = SpriteType(rawValue: 0)
    static let mario    = SpriteType(rawValue: 1<<1)
    static let coinBox  = SpriteType(rawValue: 1<<2)
    static let feather  = SpriteType(rawValue: 1<<3)
}
