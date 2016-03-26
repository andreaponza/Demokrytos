import Foundation
import SceneKit

class Atoms {
    class func carbonAtom() -> SCNGeometry {
        let carbonAtom = SCNSphere(radius: 1.70)
        carbonAtom.firstMaterial!.diffuse.contents = NSColor.blackColor()
        carbonAtom.firstMaterial!.specular.contents = NSColor.whiteColor()
        return carbonAtom
    }
    
    class func hydrogenAtom() -> SCNGeometry {
        let hydrogenAtom = SCNSphere(radius: 1.20)
        hydrogenAtom.firstMaterial!.diffuse.contents = NSColor.redColor()
        hydrogenAtom.firstMaterial!.specular.contents = NSColor.whiteColor()
        return hydrogenAtom
    }
    
    class func oxygenAtom() -> SCNGeometry {
        let oxygenAtom = SCNSphere(radius: 1.52)
        oxygenAtom.firstMaterial!.diffuse.contents = NSColor.blueColor()
        oxygenAtom.firstMaterial!.specular.contents = NSColor.blueColor()
        return oxygenAtom
    }
    
    class func fluorineAtom() -> SCNGeometry {
        let fluorineAtom = SCNSphere(radius: 1.47)
        fluorineAtom.firstMaterial!.diffuse.contents = NSColor.yellowColor()
        fluorineAtom.firstMaterial!.specular.contents = NSColor.whiteColor()
        return fluorineAtom
    }
    
    class func allAtoms() -> SCNNode {
        let atomsNode = SCNNode()
        
        let hydrogenNode = SCNNode(geometry: hydrogenAtom())
        hydrogenNode.position = SCNVector3Make(-6, 0, 0)
        atomsNode.addChildNode(hydrogenNode)
        
        let fluorineNode = SCNNode(geometry: fluorineAtom())
        fluorineNode.position = SCNVector3Make(-2, 0, 0)
        atomsNode.addChildNode(fluorineNode)
        
        let oxygenNode = SCNNode(geometry: oxygenAtom())
        oxygenNode.position = SCNVector3Make(+2, 0, 0)
        atomsNode.addChildNode(oxygenNode)
        
        let carbonNode = SCNNode(geometry: carbonAtom())
        carbonNode.position = SCNVector3Make(+6, 0, 0)
        atomsNode.addChildNode(carbonNode)
        
        return atomsNode
    }
}