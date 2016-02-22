//
//  GameScene.swift
//  Navilius
//
//  Created by Diodo on 22/02/16.
//  Copyright (c) 2016 Diodo. All rights reserved.
///

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene, SKPhysicsContactDelegate {

    //MARK: PLAYER
    var nave = SKSpriteNode(imageNamed: "Navilius01")
    let shoot = SKSpriteNode(imageNamed: "Disparo")
    let naveAnimation: SKAction
    var invisibleControllerSprite = SKSpriteNode()
    //MARK: ENEMYS
    var enemigo = SKSpriteNode(imageNamed: "Enemy1")
    //MARK: GRAPHICS SCENE
    var colorCielo = SKColor()
    var starfield: SKEmitterNode!
    var texturaSuelo = SKTexture()
    var texturaTree1 = SKTexture()
    var texturaTree2 = SKTexture()
    var texturaTree3 = SKTexture()
    var texturaFondo = SKTexture()
    var texturaNube1 = SKTexture()
    var texturaNube2 = SKTexture()
    var texturaNube3 = SKTexture()
    var texturaNube4 = SKTexture()
    var texturaMountain1 = SKTexture()
    var texturaMountain2 = SKTexture()
    var texturaMountain3 = SKTexture()
    //MARK: CALCULATIONS
    var lastUpdateTime: NSTimeInterval = 0
    var dt: NSTimeInterval = 0
    let playableRect: CGRect
    let naveMovePointsPerSec: CGFloat = 480.0
    var velocity = CGPointZero
    var lastTouchLocation: CGPoint?
    // MARK: TIME
    var gameTimer: NSTimer!
    var gameOver = false
    // MARK: SCORE
    var scoreLabel: SKLabelNode!
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    //MARK: SCREEN LIMIT BY ASPECT
    override init(size: CGSize) {
        let maxAspectRatio:CGFloat = 16.0/9.0
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height-playableHeight)/2.0
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
    //MARK: PLAYER ANIMATION
        var texturesPlayer:[SKTexture] = []
        for i in 1...4 { texturesPlayer.append(SKTexture(imageNamed: "Navilius0\(i)"))}
            texturesPlayer.append(texturesPlayer[2])
            texturesPlayer.append(texturesPlayer[1])
            naveAnimation = SKAction.animateWithTextures(texturesPlayer, timePerFrame: 0.1)
            super.init(size: size)
    //MARK: PHISICS OBJECTS AND COLLISION
        nave.physicsBody?.dynamic = true
        enemigo.physicsBody?.dynamic = true
        shoot.physicsBody?.dynamic = true
        invisibleControllerSprite.size = CGSizeMake(0, 0)
        self.addChild(invisibleControllerSprite)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: DIDMOVETOVIEW
    override func didMoveToView(view: SKView) {
    }
    
}




