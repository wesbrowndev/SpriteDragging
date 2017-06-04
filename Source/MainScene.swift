import Foundation

class MainScene: CCScene {
    var spriteNode: CCNodeColor!
    var spriteMovement = false
    
    override init!() {
        super.init()
        
        isUserInteractionEnabled = true
        
        let sceneView = CCDirector.shared().viewSize()
        
        // Background properties
        let background = CCNodeColor(color: CCColor.blue())
        background?.contentSize = CGSize(width: sceneView.width, height: sceneView.height)
        self.addChild(background)
        
        // spriteNode properties
        spriteNode = CCNodeColor.init(color: CCColor.white(), width: 100, height: 100)
        spriteNode?.anchorPoint = ccp(0.5, 0.5)
        spriteNode.position = CGPoint(x: sceneView.width / 2, y: sceneView.height / 2)
        self.addChild(spriteNode)
        
    }
    
    // MARK: - Touch devices
    
    #if os(iOS)
    
    override func touchBegan(_ touch: UITouch!, with event: UIEvent!) {
        let touchLocation = touch.location(in: self)
        
        if spriteNode.boundingBox().contains(touchLocation) {
            spriteMovement = true
            spriteNode.position = touchLocation
        }
    }
    
    override func touchMoved(_ touch: UITouch!, with event: UIEvent!) {
        let touchLocation = touch.location(in: self)

        if spriteNode.boundingBox().contains(touchLocation) && spriteMovement == true {
            spriteNode.position = touchLocation
        }
    }
    
    override func touchCancelled(_ touch: UITouch!, with event: UIEvent!) {
        spriteMovement = false
    }
    
    override func touchEnded(_ touch: UITouch!, with event: UIEvent!) {
        spriteMovement = false
    }
    
    // MARK: - macOS
    
    #elseif os(OSX)
    
    override func mouseDown(_ theEvent: NSEvent!) {
        let location = theEvent.location(in: self)
        if spriteNode.boundingBox().contains(location) {
            spriteMovement = true
            spriteNode.position = location
        }
    }
    
    override func mouseDragged(_ theEvent: NSEvent!) {
        let location = theEvent.location(in: self)
        if spriteNode.boundingBox().contains(location) && spriteMovement == true {
            spriteNode.position = location
        }
    }
    
    override func mouseUp(_ theEvent: NSEvent) {
        spriteMovement = false
    }
    
    #endif

}
