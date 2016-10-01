import Foundation

class MainScene: CCScene {
    weak var _player: CCNodeColor!
    
    override init!() {
        super.init()
        
        isUserInteractionEnabled = true
    }
    
    override func touchBegan(_ touch: UITouch!, with event: UIEvent!) {
        let location = touch.location(in: self)
        _player.position = location
    }
    
    override func touchMoved(_ touch: UITouch!, with event: UIEvent!) {
        let location = touch.location(in: self)
        _player.position = location
    }

}
