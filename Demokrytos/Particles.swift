import Foundation
import SceneKit

class Particles{
    class func protonParticle() -> SCNGeometry {
        let proton = SCNSphere(radius: 1.52)
        proton.firstMaterial!.diffuse.contents = NSColor.redColor()
        proton.firstMaterial!.specular.contents = NSColor.whiteColor()
        return proton
    }
    
    class func electronParticle() -> SCNGeometry {
        let electron = SCNSphere(radius: 1.20)
        electron.firstMaterial!.diffuse.contents = NSColor.blueColor()
        electron.firstMaterial!.specular.contents = NSColor.blueColor()
        return electron
    }
    
    class func neutronParticle() -> SCNGeometry {
        let neutron = SCNSphere(radius: 1.52)
        neutron.firstMaterial!.diffuse.contents = NSColor.whiteColor()
        neutron.firstMaterial!.specular.contents = NSColor.whiteColor()
        return neutron
    }
    
    class func hydrogen() -> SCNNode {
        let hydrogenNode = SCNNode()
        
        let proton = SCNNode(geometry: protonParticle())
        proton.position = SCNVector3Make(0, 0, 0)
        hydrogenNode.addChildNode(proton)
        
        let electron = SCNNode(geometry: electronParticle())
        electron.position = SCNVector3Make(-10, 0, 0)
        hydrogenNode.addChildNode(electron)
        
        let randomX = CGFloat(arc4random()) % 2
        let randomY = CGFloat(arc4random()) % 2
        
        let spin = CABasicAnimation(keyPath: "rotation")
        // Use from-to to explicitly make a full rotation around z
        spin.fromValue = NSValue(SCNVector4: SCNVector4(x: randomX, y: randomY, z: 1, w: 0))
        spin.toValue = NSValue(SCNVector4: SCNVector4(x: randomY, y: randomX, z: 1, w: CGFloat(2 * M_PI)))
        spin.duration = 1
        spin.repeatDuration = 1
        spin.repeatCount = .infinity
        hydrogenNode.addAnimation(spin, forKey: "spin around")
        
        
        return hydrogenNode
    }
    
    class func helyum() -> SCNNode {
        let helyumNode = SCNNode()
        let orbitNode1 = SCNNode()
        let orbitNode2 = SCNNode()
        
        
        let proton1 = SCNNode(geometry: protonParticle())
        proton1.position = SCNVector3Make(0, +1, 0)
        helyumNode.addChildNode(proton1)
        let proton2 = SCNNode(geometry: protonParticle())
        proton2.position = SCNVector3Make(0, -1, 0)
        helyumNode.addChildNode(proton2)
        
        let neutron1 = SCNNode(geometry: neutronParticle())
        neutron1.position = SCNVector3Make(+1, 0, 0)
        helyumNode.addChildNode(neutron1)
        let neutron2 = SCNNode(geometry: neutronParticle())
        neutron2.position = SCNVector3Make(-1, 0, 0)
        helyumNode.addChildNode(neutron2)
        
        
        let electron1 = SCNNode(geometry: electronParticle())
        electron1.position = SCNVector3Make(-10, 0, 0)
        orbitNode1.addChildNode(electron1)
        let electron2 = SCNNode(geometry: electronParticle())
        electron2.position = SCNVector3Make(+10, 0, 0)
        orbitNode2.addChildNode(electron2)
        
        
        let spin1 = self.spin()
        let spin2 = self.spin()
        orbitNode1.addAnimation(spin1, forKey: "spin around")
        orbitNode2.addAnimation(spin2, forKey: "spin around")
        
        helyumNode.addChildNode(orbitNode1)
        helyumNode.addChildNode(orbitNode2)
        
        return helyumNode
    }
    
    class func litium() -> SCNNode {
        let litiumNode = SCNNode()
        let orbitNode1 = SCNNode()
        let orbitNode2 = SCNNode()
        let orbitNode3 = SCNNode()
        
        
        let proton1 = SCNNode(geometry: protonParticle())
        proton1.position = SCNVector3Make(0, +1, 0)
        litiumNode.addChildNode(proton1)
        let proton2 = SCNNode(geometry: protonParticle())
        proton2.position = SCNVector3Make(0, -1, 0)
        litiumNode.addChildNode(proton2)
        let proton3 = SCNNode(geometry: protonParticle())
        proton3.position = SCNVector3Make(0, 0, +1)
        litiumNode.addChildNode(proton3)
        
        let neutron1 = SCNNode(geometry: neutronParticle())
        neutron1.position = SCNVector3Make(+1, 0, 0)
        litiumNode.addChildNode(neutron1)
        let neutron2 = SCNNode(geometry: neutronParticle())
        neutron2.position = SCNVector3Make(-1, 0, 0)
        litiumNode.addChildNode(neutron2)
        let neutron3 = SCNNode(geometry: neutronParticle())
        neutron3.position = SCNVector3Make(0, 0, -1)
        litiumNode.addChildNode(neutron3)
        
        
        let electron1 = SCNNode(geometry: electronParticle())
        electron1.position = SCNVector3Make(-10, 0, 0)
        orbitNode1.addChildNode(electron1)
        let electron2 = SCNNode(geometry: electronParticle())
        electron2.position = SCNVector3Make(+10, 0, 0)
        orbitNode2.addChildNode(electron2)
        let electron3 = SCNNode(geometry: electronParticle())
        electron3.position = SCNVector3Make(+12, 0, -12)
        orbitNode3.addChildNode(electron3)
        
        
        let spin1 = self.spin()
        let spin2 = self.spin()
        let spin3 = self.spin()
        spin3.duration = 0.7
        orbitNode1.addAnimation(spin1, forKey: "spin around")
        orbitNode2.addAnimation(spin2, forKey: "spin around")
        orbitNode3.addAnimation(spin3, forKey: "spin around")
        
        litiumNode.addChildNode(orbitNode1)
        litiumNode.addChildNode(orbitNode2)
        litiumNode.addChildNode(orbitNode3)
        
        return litiumNode
    }
    
    class func spin() -> CABasicAnimation {
        let randomX = CGFloat(arc4random()) % 2
        let randomY = CGFloat(arc4random()) % 2
        
        let spin = CABasicAnimation(keyPath: "rotation")
        // Use from-to to explicitly make a full rotation around z
        spin.fromValue = NSValue(SCNVector4: SCNVector4(x: randomX, y: randomY, z: 1, w: 0))
        spin.toValue = NSValue(SCNVector4: SCNVector4(x: randomY, y: randomX, z: 1, w: CGFloat(2 * M_PI)))
        spin.duration = 1
        spin.repeatDuration = 1
        spin.repeatCount = .infinity
        return spin
    }
}