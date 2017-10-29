//
//  ViewController.swift
//  AlpakAR
//
//  Created by Cem-Marvin von Hagen on 29.10.17.
//  Copyright © 2017 Jugend Hackt. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController, ARSKViewDelegate {
    
    @IBOutlet var sceneView: ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and node count
      /*  sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        sceneView.showsDrawCount = true
        sceneView.showsPhysics = true */
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        // Create and configure a node for the anchor added to the view's session.
        let rand = arc4random_uniform(_: 4)
        if UIDevice.current.orientation.isLandscape {
            switch rand {
            case 0:
                return SKSpriteNode(imageNamed: "icon_pixel_orange.png")
            case 1:
                return SKSpriteNode(imageNamed: "icon_pixel_gelb.png")
            case 2:
                return SKSpriteNode(imageNamed: "icon_pixel_grün.png")
            default:
                return SKSpriteNode(imageNamed: "icon_pixel.png")
            }
        } else {
            switch rand {
            case 0:
                return SKSpriteNode(imageNamed: "full_suit_orange.png")
            case 1:
                return SKSpriteNode(imageNamed: "full_suit_gelb.png")
            case 2:
                return SKSpriteNode(imageNamed: "full_suit_grün.png")
            default:
                return SKSpriteNode(imageNamed: "full_suit.png")
            }
        }
    }
    
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
