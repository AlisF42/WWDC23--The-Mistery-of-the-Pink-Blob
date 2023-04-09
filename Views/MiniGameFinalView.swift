
//  MiniGameFinal.swift
//  
//
//  Created by alis frentzel on 22/04/22.
//

import Foundation

import SwiftUI
import SpriteKit

class FinalGameScene: SKScene {
    
    var background: SKSpriteNode!
    var dnaYellow: SKSpriteNode!
    var dnaPink: SKSpriteNode!
    var needle: SKShapeNode!
    var infoText:SKLabelNode!
    var animationExecuted = false
    
    override func didMove(to view: SKView) {
        createBackground()
        createDNA()
        createNeedle()
        createTouchTheScreenInfo()
    }
    
    func createBackground() {
        background = SKSpriteNode(imageNamed: "finalMiniGameBg")
        background.position = CGPoint(x: 683, y: 512)
        background.size = self.size
        self.addChild(background)
    }
    
    func createDNA() {
        dnaYellow = SKSpriteNode(imageNamed: "dnaYellow")
        dnaYellow.position = CGPoint(x: 683, y: 512+400)
        self.addChild(dnaYellow)

        dnaPink = SKSpriteNode(imageNamed: "dnaPink")
        dnaPink.position = CGPoint(x: 683, y: 512+270)
        self.addChild(dnaPink)
    }
    
    func createNeedle() {
        needle = SKShapeNode(rectOf: CGSize(width: 100, height: 350), cornerRadius: 30)
        needle.position = CGPoint(x: 130, y: (dnaYellow.frame.maxY - dnaPink.frame.minY)/2 + dnaPink.frame.minY)
        needle.strokeColor = .black
        needle.lineWidth = 10
        needle.fillColor = UIColor.cyan.withAlphaComponent(0.1)
        self.addChild(needle)
    }
    
    func createTouchTheScreenInfo() {
        infoText = SKLabelNode(text: "[ Tap to screen the DNA ]")
        infoText.position = CGPoint(x: 150 + infoText.frame.width/2, y: 90 + infoText.frame.height/2)
        self.addChild(infoText)
        
        let fadeAlphaAction = SKAction.fadeAlpha(to: 0.5, duration: 0.5)
        let showAlphaAction = SKAction.fadeAlpha(to: 1, duration: 0.5)
        let sequenceAction = SKAction.sequence([fadeAlphaAction, showAlphaAction])
        let blinkAction = SKAction.repeatForever(sequenceAction)
        
        infoText.run(blinkAction)

    }
    
    func animateNeedle() {
        
        let hideInfoAction = SKAction.run {
            self.infoText.removeAllActions()
            self.infoText.alpha = 0
        }
        
        let moveToEndAction = SKAction.moveTo(x: dnaYellow.frame.maxX-needle.frame.width + 15, duration: 3)
        
        let moveToRightOneAction = SKAction.moveTo(x: dnaYellow.frame.maxX-needle.frame.width - 200, duration: 1)
        
        let changeNeedleColorAction = SKAction.run {
            self.needle.fillColor = .green.withAlphaComponent(0.5)
        }
        
        let changeBGAction = SKAction.run {
            self.changeBackground()
        }
        
        let waitAction = SKAction.wait(forDuration: 3)
        
        let changeViewAction = SKAction.run {
            NotificationCenter.default.post(name: .nextFinal, object: nil)
        }
        
        let sequenceAction = SKAction.sequence([hideInfoAction, moveToEndAction, moveToRightOneAction, changeNeedleColorAction,changeBGAction, waitAction, changeViewAction])
        needle.run(sequenceAction)
    }
    
    func changeBackground() {
        background.texture = SKTexture(imageNamed: "finalMinigameBg2")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !animationExecuted {
            animationExecuted = true
            animateNeedle()
        }
        
    }
    
}

struct FinalMiniGameView: View {
    
    @State
    private var isLinkActive = false
    
    var scene: SKScene {
        let scene = FinalGameScene()
        scene.size = CGSize(width: 1366, height: 1024)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .black
        
        return scene
    }
    
    var body: some View {
        VStack {
            NavigationLink( destination:  FinalExplanation4(), isActive: $isLinkActive,
                           label: {  EmptyView() })
            gameView
        }
        .onReceive(NotificationCenter.default.publisher(for: .nextFinal)) { _ in
            isLinkActive = true
        }
    }
    
    private var gameView: some View {
        SpriteView(scene: scene)
            .frame(minWidth: 0, maxWidth: .infinity)
            .aspectRatio(contentMode: .fill)
    }
}

struct FinalMiniGameView_Previews: PreviewProvider {
    static var previews: some View {
        FinalMiniGameView()
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}

extension Notification.Name {
    static let nextFinal: Self = .init(rawValue: "nextFinal")
}
