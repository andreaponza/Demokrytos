//
//  GameViewController.swift
//  Molecule
//
//  Created by Andrea De Martino on 24/03/16.
//  Copyright (c) 2016 Andrea. All rights reserved.
//

import SceneKit
import QuartzCore

class GameViewController: NSViewController {
    
    @IBOutlet weak var gameView: GameView!
    @IBOutlet weak var geometryLabel: NSTextField!
    let scene = SCNScene()
    var geometryNode: SCNNode = SCNNode()
    
    override func awakeFromNib(){
        super.awakeFromNib()
        

        
        self.hydrogen()
        
        
        // set camera let cameraNode = SCNNode()
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 25)
        scene.rootNode.addChildNode(cameraNode)
        
        // set the scene to the view
        self.gameView!.scene = scene
        
        let omniLightNode = SCNNode()
        omniLightNode.light = SCNLight()
        omniLightNode.light!.type = SCNLightTypeOmni
        omniLightNode.light!.color = NSColor(white: 0.95, alpha: 1.0)
        omniLightNode.position = SCNVector3Make(0, 50, 50)
        scene.rootNode.addChildNode(omniLightNode)
        
        // allows the user to manipulate the camera
        self.gameView!.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        self.gameView!.showsStatistics = false
        
        self.gameView!.scene!.rootNode.addChildNode(geometryNode)
    }
    
// Change view
    @IBAction func switchElementView(sender: AnyObject) {
        geometryNode.removeFromParentNode()
        
        let molecule:String! = sender.titleOfSelectedItem
        
        switch molecule{
        case "Hydrogen":
            hydrogen()
        case "Helyum":
            geometryLabel.stringValue = "Helyum\n2 Proton (Red) 2 Electron (Blue) 2 Neutron (White)"
            geometryNode = Particles.helyum()
        case "Atoms":
            geometryLabel.stringValue = "Atoms\n"
            geometryNode = Atoms.allAtoms()
        case "Methane":
                geometryLabel.stringValue = "Methane (Natural Gas)\nCH4"
                geometryNode = Molecules.methaneMolecule()
        case "Ethanol":
            geometryLabel.stringValue = "Ethanol (Alcohol)\nC2H6O"
            geometryNode = Molecules.ethanolMolecule()
        case "Water":
            geometryLabel.stringValue = "Water\nH2O"
            geometryNode = Molecules.waterMolecule()
        case "Polytetrafluoroethylene":
            geometryLabel.stringValue = "Polytetrafluoroethylene (Teflon)\nC2F4"
            geometryNode = Molecules.ptfeMolecule()
        default:
            print("No selection")
        }
        
        self.gameView!.scene!.rootNode.addChildNode(geometryNode)
    }
    
    func hydrogen(){
        geometryLabel.stringValue = "Hydrogen\n1 Proton (Red) 1 Electron (Blue)"
        geometryNode = Particles.hydrogen()
    }
}


