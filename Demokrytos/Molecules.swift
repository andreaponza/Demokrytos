import Foundation
import SceneKit

class Molecules {
    class func waterMolecule() -> SCNNode{
        let waterMolecule = SCNNode()
        
        // 1 Oxygen
        _ = nodeWithAtom(Atoms.oxygenAtom(), molecule: waterMolecule, position: SCNVector3Make(0, 0, 0))
        
        // 2 Hydrogen
        _ = nodeWithAtom(Atoms.hydrogenAtom(), molecule: waterMolecule, position: SCNVector3Make(-2, +1, 0)) //Hydrogen node 1
        _ = nodeWithAtom(Atoms.hydrogenAtom(), molecule: waterMolecule, position: SCNVector3Make(+2, +1, 0)) //Hydrogen node 2
        
        
        return waterMolecule
    }
    
    class func methaneMolecule() -> SCNNode {
        let methaneMolecule = SCNNode()
        
        // 1 Carbon
        _ = nodeWithAtom(Atoms.carbonAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, 0, 0)) //Carbon node 1
        
        // 4 Hydrogen
        _ = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(-2, 0.5, -1)) //Hydrogen node 1
        _ = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(+2, 0.5, -1)) //Hydrogen node 2
        _ = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, -2, 0)) //Hydrogen node 3
        _ = nodeWithAtom(Atoms.hydrogenAtom(), molecule: methaneMolecule, position: SCNVector3Make(0, +2, +1)) //Hydrogen node 4
        
        return methaneMolecule
    }
    
    class func ethanolMolecule() -> SCNNode {
        let ethanolMolecule = SCNNode()
        
        // 2 Carbon
        _ = nodeWithAtom(Atoms.carbonAtom(), molecule: ethanolMolecule, position: SCNVector3Make(-1, 0, 0)) //Carbon node 1
        _ = nodeWithAtom(Atoms.carbonAtom(), molecule: ethanolMolecule, position: SCNVector3Make(+1, 0, 0)) //Carbon node 2
        
        // 6 Hydrogen
        _ = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(-2, +0.7, +1.5)) //Hydrogen node 1
        _ = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(-2, +0.7, -1.5)) //Hydrogen node 2
        _ = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(-2.5, -1.5, +0)) //Hydrogen node 3
        
        _ = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(+1.5, -1.5, +1.5)) //Hydrogen node 4
        _ = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(+1.5, -1.5, -1.5)) //Hydrogen node 5
        
        _ = nodeWithAtom(Atoms.hydrogenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(+3.5, +3.5, 0)) //Hydrogen node 6
        
        // 1 Oxigen
        _ = nodeWithAtom(Atoms.oxygenAtom(), molecule: ethanolMolecule, position: SCNVector3Make(+2, +2, 0)) //Oxygen node 1
        
        return ethanolMolecule
    }
    
    class func ptfeMolecule() -> SCNNode {
        let ptfeMolecule = SCNNode()
        return ptfeMolecule
    }
    
    class func nodeWithAtom(atom: SCNGeometry, molecule: SCNNode, position: SCNVector3) -> SCNNode {
        let node = SCNNode(geometry: atom)
        node.position = position
        molecule.addChildNode(node)
        return node
    }
}