import Foundation

class MainScene: CCScene {
    weak var _player: CCNodeColor!
    
    override init!() {
        super.init()
        
        isUserInteractionEnabled = true
    }
    
    // MARK: - Touch devices
    
    #if os(iOS)
    
    override func touchBegan(_ touch: UITouch!, with event: UIEvent!) {
        let location = touch.location(in: self)
        _player.position = location
    }
    
    override func touchMoved(_ touch: UITouch!, with event: UIEvent!) {
        let location = touch.location(in: self)
        _player.position = location
    }
    
    // MARK: - macOS
    
    #elseif os(OSX)
    
    override func mouseDown(_ theEvent: NSEvent!) {
        let location = theEvent.location(in: self)
        _player.position = location
    }
    
    override func mouseDragged(_ theEvent: NSEvent!) {
        let location = theEvent.location(in: self)
        _player.position = location
    }
    
    #endif
}
