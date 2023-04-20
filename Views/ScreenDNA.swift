
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
    var cat: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        createBackground()
        createCat()
        createDNA()
        createNeedle()
        createTouchTheScreenInfo()
        
    }
    
    func createBackground() {
        background = SKSpriteNode(imageNamed: "BgLabFinal")
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.size = self.size
        self.addChild(background)
    }
    
    func createCat() {
        cat = SKSpriteNode(imageNamed: "cat5Final")
        cat.anchorPoint = CGPoint(x: 0, y: 0)//inferior exqurdo
        cat.position = CGPoint(x: 700, y: 0)//posicao em relacao ao anchor point
        cat.size = CGSize(width: 628, height: 675)//do figma
        self.addChild(cat) // pq n foi??? ;-;
    }
//        let animationLayers = [
//            SKTexture(imageNamed: "cat4Final"),
//            SKTexture(imageNamed: "cat5Final"),
//        ]
//
//        let animation = SKAction.repeatForever(SKAction.animate(with: animationLayers, timePerFrame: 0.3))
//
//        cat.run(animation)

        
    
    
    func createDNA() {
        dnaYellow = SKSpriteNode(imageNamed: "dnaYellow")
        dnaYellow.position = CGPoint(x: 683, y: 512+340)
        dnaYellow.size = CGSize(width: 1074, height: 99)
        self.addChild(dnaYellow)

        dnaPink = SKSpriteNode(imageNamed: "dnaPink")
        dnaPink.position = CGPoint(x: 683, y: 512+210)
        dnaPink.size = CGSize(width: 1074, height: 99)
        self.addChild(dnaPink)
    }
    
    func createNeedle() {
        needle = SKShapeNode(rectOf: CGSize(width: 80, height: 250), cornerRadius: 30)
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
        
        let moveToEndAction = SKAction.moveTo(x: dnaYellow.frame.maxX-needle.frame.width + 100, duration: 3)
        
        let moveToRightOneAction = SKAction.moveTo(x: dnaYellow.frame.maxX-needle.frame.width - 170, duration: 1)
        
        let changeNeedleColorAction = SKAction.run {
            self.needle.fillColor = .green.withAlphaComponent(0.5)
        }
        
        let changeCatAction = SKAction.run {
            self.changeCat()
        }
        
        let changeCat2Action = SKAction.run {
            self.changeCat2()
        }
        let changeCat3Action = SKAction.run {
            self.changeCat3()
        }
        
        let waitAction = SKAction.wait(forDuration: 3)
        
        let changeViewAction = SKAction.run {
            NotificationCenter.default.post(name: .nextFinal, object: nil)
        }
        
        let sequenceAction = SKAction.sequence([hideInfoAction,
                  changeCat2Action,moveToEndAction,
                             changeCat3Action,moveToRightOneAction, changeNeedleColorAction,changeCatAction, waitAction, changeViewAction])
        needle.run(sequenceAction)
    }
    
    func changeCat() {
        cat.texture = SKTexture(imageNamed: "cat5Final")
    }
    
    func changeCat2() {
        cat.texture = SKTexture(imageNamed: "cat4Final")
    }
    func changeCat3() {
        cat.texture = SKTexture(imageNamed: "cat8Final")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !animationExecuted {
            animationExecuted = true
            animateNeedle()
        }
        
    }
    
}

struct ScreenDNA: View {
    
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
            NavigationLink( destination:  SNPexplanation(), isActive: $isLinkActive,
                           label: {  EmptyView() }).navigationBarBackButtonHidden(true)
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

struct ScreenDNA_Previews: PreviewProvider {
    static var previews: some View {
        ScreenDNA()
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}

extension Notification.Name {
    static let nextFinal: Self = .init(rawValue: "nextFinal")
}


//cat4Final
//cat5Final
//cat6Final
