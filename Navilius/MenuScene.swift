//
//  MenuScene.swift
//  Navilius09.1
//  Created by Diodo on 15/1/16.
//  Copyright © 2016 Diodo. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class MenuScene: SKScene {
        //MARK: DIDMOVETOVIEW
    override func didMoveToView(view: SKView) {
        
        //MARK: BACKGROUND MENU
        let background = SKSpriteNode(imageNamed:"Galaxy")
        background.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        self.addChild(background)
        background.zPosition = -1

        //MARK: PLANETA
        let texturaPlaneta = SKTexture(imageNamed: "PlanetaRed")
        texturaPlaneta.filteringMode = SKTextureFilteringMode.Nearest
        let planeta = SKSpriteNode(texture: texturaPlaneta)
        planeta.position = CGPoint(x: frame.size.width/6 , y: size.height/5.3)
        planeta.xScale = 1.5
        planeta.yScale = 1.5
        planeta.zPosition = 0
        addChild(planeta)
        
        //MARK: START BUTTON
        let startGameButton = SKSpriteNode(imageNamed: "Tittle")
        startGameButton.position = CGPointMake(size.width/2,size.height/2)
        startGameButton.name = "startgame"
        startGameButton.xScale = 5
        startGameButton.yScale = 5
        startGameButton.zPosition = 10
        addChild(startGameButton)
        
        //MARK: VOLUME BUTTON
        let volumeButton = SKSpriteNode(imageNamed: "VolumeBtn")
        volumeButton.position = CGPointMake(size.width/1.11,size.height/8)
        volumeButton.name = "volume"
        volumeButton.xScale = 0.5
        volumeButton.yScale = 0.5
        volumeButton.zPosition = 5
        addChild(volumeButton)
        
        //MARK: FACEBOOK BUTTON
        let facebookButton = SKSpriteNode(imageNamed: "FacebookBtn")
        facebookButton.position = CGPointMake(size.width/1.11,size.height/3.8)
        facebookButton.name = "facebook"
        facebookButton.xScale = 0.5
        facebookButton.yScale = 0.5
        facebookButton.zPosition = 5
        addChild(facebookButton)
        
        //MARK: TWITTER BUTTON
        let twitterButton = SKSpriteNode(imageNamed: "TwitterBtn")
        twitterButton.position = CGPointMake(size.width/1.11,size.height/2.5)
        twitterButton.name = "twitter"
        twitterButton.xScale = 0.5
        twitterButton.yScale = 0.5
        twitterButton.zPosition = 5
        addChild(twitterButton)
    }
        //MARK: FUNC START
    func startTapped() {
        let myScene = GameScene(size:self.size)
        myScene.scaleMode = scaleMode
        let reveal = SKTransition.crossFadeWithDuration(1.5)
        self.view?.presentScene(myScene, transition: reveal)
    }
        //MARK: FUNC VOLUME
    func volumeTapped() {

    }
        //MARK: FUNC FACEBOOK
    func facebookTapped() {
        
    }
        //MARK: FUNC TWITTER
    func twitterTapped() {
        
    }
        //MARK: FUNC ACTION START
    func actionStart() {
        
        let startGameButton = SKSpriteNode(imageNamed: "Tittle")
        startGameButton.position = CGPointMake(size.width/2,size.height/2)
        startGameButton.xScale = 10
        startGameButton.yScale = 10
        startGameButton.zPosition = 10
        addChild(startGameButton)
    }
        //MARK: FUNC TOUCH BEGAN
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let touchLocation = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(touchLocation)
            if(touchedNode.name == "startgame"){
                actionStart()
                startTapped()
            }
            if(touchedNode.name == "volume"){
                volumeTapped()
            }
            if(touchedNode.name == "facebook"){
                facebookTapped()
            }
            if(touchedNode.name == "twitter"){
                twitterTapped()
            }
        }
    }
}
