//
//  GameViewController.swift
//  Navilius
//
//  Created by Diodo on 22/02/16.
//  Copyright (c) 2016 Diodo. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: "sks")
        let sceneData = NSData(contentsOfFile: path!)
        let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData!)
        archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
        let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
        archiver.finishDecoding()
        return scene
    }
}
class GameViewController: UIViewController {
    // MARK: MENU AUDIO
    var BackgroundAudio = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Hombre", ofType: "mp3")!))
    //MARK: MENU VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
            BackgroundAudio!.play()
        
            let menuScene = MenuScene(size:CGSize(width: 2048, height: 1536))
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            menuScene.scaleMode = .AspectFill
            skView.presentScene(menuScene)
    }
    //MARK: AUTOROTATE SCREEN
    override func shouldAutorotate() -> Bool {
        return true
    }
    //MARK: INTERFACE ORIENTATIONS
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    //MARK: MEMORY WARNING
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK: STATUS BAR
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

