//
//  File.swift
//  
//
//  Created by alis frentzel on 16/04/23.
//

//import Foundation
//import SpriteKit
//
//import SwiftUI
//
//class BeeScene: SKScene, SKPhysicsContactDelegate {
//    
//    var gameViewModel: GameViewModel?
//    
//    var bee: BeeNode?
//    private var darkOverlayNode: SKSpriteNode!
//    
//    
//    // Radar
//    var radarNode: SKSpriteNode!
//    var radarLineNode: SKSpriteNode!
//    var dangerRadarNode: SKSpriteNode!
//    var timeWhenRadarWasTurnedOn: TimeInterval = 0
//    var timeRadarIsOn: TimeInterval = 0
//    var radarMaxDistance: CGFloat = UIScreen.main.bounds.height * 0.75
//    var radarWidth: CGFloat {
//        UIScreen.main.bounds.width/4
//    }
//  
//    
//    // Actions
//    private var flyingAnimation: SKAction!
//    private let radarFlowersBlinkAction = SKAction.repeatForever(SKAction.sequence([SKAction.fadeAlpha(to: 1, duration: 0.8), SKAction.fadeAlpha(to: 0, duration: 0.8)]))
//    
//    
//    // MARK: - Scene didMove
//    override func didMove(to view: SKView) {
//        physicsWorld.contactDelegate = self
//        
//        setupRadar(openFlowersPositionList: gameViewModel!.currentStage.openedFlowersPositionList, closedFlowersPositionList: gameViewModel!.currentStage.closedFlowersPositionList)
//        setupDangerRadar()
//        
//        self.bee = BeeNode(xPosition: self.frame.midX, yPosition: self.frame.midY)
//        self.bee?.pollenNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
//        self.bee?.physicsBody?.affectedByGravity = false
//        
//        addChild(bee!)
//        
//        setupFlyingAnimation()
//        self.bee?.run(flyingAnimation)
//        
//        self.camera = cam
//        self.addChild(radarNode)
//        
//        self.darkOverlayNode = SKSpriteNode(texture: nil, color: UIColor.black, size: frame.size)
//        self.darkOverlayNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
//        self.darkOverlayNode.zPosition = 999
//        self.hideDarkOverlay()
//        self.addChild(darkOverlayNode)
//        
//        self.setupAccelerometer()
//        
//        self.bee!.position = CGPoint(x: frame.midX, y: frame.midY)
//        self.oldPosition = bee!.position
//    }
//
//// MARK: - Overlays
//func showDarkOverlay() {
//    self.darkOverlayNode.alpha = 0.5
//}
//
//func hideDarkOverlay() {
//    self.darkOverlayNode.alpha = 0
//}
//
//
//// MARK: - Stage functions
//private func stageOneTasksValidation() {
//    //  Stage 1 tasks validation
//    if gameViewModel?.dialogIndex == 1 {
//        if totalDistance <= 1200 {
//            let deltaX = bee!.position.x - oldPosition.x
//            let deltaY = bee!.position.y - oldPosition.y
//            
//            print("Delta X:", deltaX)
//            print("Delta Y:", deltaY)
//            
//            let newDistance = sqrt(pow(deltaX, 2) + pow(deltaY, 2))
//            totalDistance += newDistance
//            
//            print("Total distance:", totalDistance)
//            
//            oldPosition = bee!.position
//            
//            if totalDistance >= 1200 {
//                print("Player has learned how to fly")
//                completeTask()
//                showDarkOverlay()
//                bee?.physicsBody?.affectedByGravity = false
//                self.gameViewModel?.isGamePaused = true
//            }
//        }
//    }
//    else if gameViewModel?.dialogIndex == 5 {
//        //  Player need to find a flower with pollen
//        bee?.physicsBody?.affectedByGravity = true
//        hideDarkOverlay()
//        if bee!.hasPollen {
//            showDarkOverlay()
//            completeTask()
//        }
//    }
//    else if gameViewModel?.dialogIndex == 7 {
//        //  Player need to pollinate closed flower
//        bee?.physicsBody?.affectedByGravity = true
//        if gameViewModel!.flowersPollinated > 0 {
//            completeTask()
//            self.gameViewModel?.isRadarOn = false
//        }
//    }
//}
//
//    override func update(_ currentTime: TimeInterval) {
//        if gameViewModel?.currentStageIndex == 1 {
//            stageOneTasksValidation()
//        } else if gameViewModel?.currentStageIndex == 2 {
//            stageTwoTasksValidation()
//        } else if gameViewModel?.currentStageIndex == 3 {
//            stageThreeTasksValidation()
//        }
//    }
//    
//// MARK: - Bee animation
//private func setupFlyingAnimation() {
//    var flyingTextureList: [SKTexture] = []
//    
//    for i in 1...6 {
//        flyingTextureList.append(SKTexture(imageNamed: "beeAnimation\(i)"))
//    }
//    
//    flyingAnimation = SKAction.repeatForever(SKAction.animate(with: flyingTextureList, timePerFrame: 0.03))
//}
