//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 22/04/22.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    var rect: SKSpriteNode!
    var baseNamesArray: [String] = ["a","t","g","c","g","c"]
    var baseGrayNameArray: [String] = ["aGray","tGray","gGray","cGray","gGray","cGray"]
    
    let pairDict: [String: String] = ["a" : "t",
                                      "t" : "a",
                                      "c" : "g",
                                      "g" : "c"]
    
    var showLetters: [Bool] = []
    var lettersArray: [SKLabelNode] = []
    var letterBoxArray: [SKSpriteNode] = []
    
    var baseArray:[SKSpriteNode] = []
    var baseGrayArray:[SKSpriteNode] = []
    var baseDestinationAnchorArray:[SKSpriteNode] = []
    var baseOriginAnchorArray:[SKSpriteNode] = []
    var movableNode : SKNode?
    
    var popUpNode: SKNode = SKNode()
    var popUpButton: SKShapeNode!
    
    var firstDialogShowed = false
    
    override func didMove(to view: SKView) {
        populateLetters()
        createRectangle()
        createBaseAnchor()
        createBasesGray()
        createDraggableBases()
        createLetters()
        createPopUp()
        showPopUp(boxImage: "boxExplanation", boxText: "inicio do jogo")
    }
    
    func populateLetters () {
        showLetters = [Bool](repeating: false, count: baseNamesArray.count)
    }
    
    func createRectangle(){
        self.rect = SKSpriteNode(color: .gray, size: CGSize(width: 824, height: 45))
        rect.position = CGPoint(x: 683, y: 800)
        self.addChild(rect)
    }
    
    //    func createBasesGray(name: String, position: Int){
    //        let base = SKSpriteNode(imageNamed: name)
    //        base.position = CGPoint(x: -355 + position * 142, y: -79)
    //        rect.addChild(base)
    //    }
    
    func createLetters(){
        
        for (position , name) in baseGrayNameArray.enumerated() {
            let letterBox = SKSpriteNode(color: .white, size: CGSize(width: 85, height: 120))
            letterBox.position = CGPoint(x: -355 + position * 142, y: 150)
            letterBox.name = pairDict[String(name.first!)]
            rect.addChild(letterBox)
            
            letterBoxArray.append(letterBox)
            
            let letter = SKLabelNode(text: letterBox.name!.uppercased())
            letter.fontColor = .black
            letter.fontName = "SFProText-Black"
            letter.fontSize = 50
            letter.position = CGPoint(x: 0, y: -letter.frame.height/2)
            letter.alpha = 0
            lettersArray.append(letter)
            
            letterBox.addChild(letter)
        }
    }
    
    func revealLetters(){
        for (position, letter) in lettersArray.enumerated(){
            if showLetters[position]{
                let revealAction = SKAction.fadeAlpha(to: 1, duration: 3)
                letter.run(revealAction)
            }
        }
    }
    
    func isFinished() -> Bool{
        return !showLetters.contains(false)
    }
    
    func createBasesGray(){
        
        for (position , name) in baseGrayNameArray.enumerated() {
            let base = SKSpriteNode(imageNamed: name)
            base.position = CGPoint(x: -355 + position * 142, y: -79)
            base.name = String(name.first!)
            rect.addChild(base)
            baseGrayArray.append(base)
        }
    }
    
    
    func createDraggableBases(){
        
        for (position , name) in baseNamesArray.enumerated() {
            let anchor = SKSpriteNode(color: .clear, size: CGSize(width: 114, height: 114))
            anchor.position = CGPoint(x: 303 + position * 152, y: 200)
            self.addChild(anchor)
            anchor.name = name
            baseOriginAnchorArray.append(anchor)
            
            
            
            let base = SKSpriteNode(imageNamed: name)
            base.position = CGPoint(x: 303 + position * 152, y: 200)
            self.addChild(base)
            base.name = name
            baseArray.append(base)
            
            
        }
    }
    
    func createBaseAnchor(){
        
        for (position, name) in baseGrayNameArray.enumerated() {
            let anchor = SKSpriteNode(color: .clear, size: CGSize(width: 114, height: 114))
            anchor.position = CGPoint(x: -355 + position * 142, y: -144)
            rect.addChild(anchor)
            anchor.name = String(name.first!)
            baseDestinationAnchorArray.append(anchor)
        }
    }
    
    //    func createBaseAnchor(name: String, position: Int){
    //        let anchor = SKSpriteNode(color: .green, size: CGSize(width: 114, height: 114))
    //        anchor.position = CGPoint(x: -355 + position * 142, y: -144)
    //        rect.addChild(anchor)
    //    }
    //
    //    func createDraggableBases(name: String, position: Int){
    //        let base = SKSpriteNode(imageNamed: name)
    //        base.position = CGPoint(x: 303 + position * 152, y: 200)
    //        self.addChild(base)
    //    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            for base in baseArray{
                if base.contains(location) && !rect.contains(location) && firstDialogShowed {
                    movableNode = base
                    movableNode!.position = location
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, movableNode != nil {
            movableNode!.position = touch.location(in: self)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, movableNode != nil {
            
            let location = touch.location(in: self.rect)
            var isCorrect = false
            
            for anchor in baseDestinationAnchorArray{
                if anchor.contains(location) && anchor.name == pairDict[movableNode!.name!] {
                    movableNode!.position = rect.convert(anchor.position, to: self)
                    isCorrect = true
                    
                    let idx = baseDestinationAnchorArray.firstIndex(of: anchor as! SKSpriteNode)!
                    
                    showLetters[idx] = true
                    
                }
            }
            revealLetters()
            
            if !isCorrect {
                let idx = baseArray.firstIndex(of: movableNode! as! SKSpriteNode)!
                movableNode!.position = baseOriginAnchorArray[idx].position
                
            }
            
            
            if isFinished(){
                print("Terminou")
                let changeColorTime: TimeInterval = 3
                let changeAction = SKAction.run {
                    self.changeBoxColor(duration: changeColorTime)
                }
                
                let waitAction = SKAction.wait(forDuration: changeColorTime)
                
                let showAction = SKAction.run {
                    self.showPopUp(boxImage: "boxExplanation", boxText: "voce completou")
                }
                
                let sequenceAction = SKAction.sequence([changeAction, waitAction, showAction])
                
                self.run(sequenceAction)
            }
            
            
            movableNode = nil
        }
        
        if let touch = touches.first, movableNode == nil {
            let locationOnPopUp = touch.location(in: popUpNode)
            
            if popUpButton.contains(locationOnPopUp)
                && popUpNode.alpha == 1
                && isFinished() {
                NotificationCenter.default.post(name: .nextGame, object: nil)
                
            } else if popUpButton.contains(locationOnPopUp)
                        && popUpNode.alpha == 1 {
                hidePopUp()
                firstDialogShowed = true
            }
        }
        
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            movableNode = nil
        }
    }
    
    func changeBoxColor(duration: TimeInterval){
        for box in letterBoxArray {
            let revealAction = SKAction.colorize(with: .systemPink, colorBlendFactor: 1, duration: duration)
            box.run(revealAction)
        }
    }
    
    func showPopUp(boxImage: String, boxText: String){
        if let popUpBox = popUpNode.childNode(withName: "popUpBox") as? SKSpriteNode,
           let popUpText = popUpBox.childNode(withName: "popUpText") as? SKLabelNode {
            popUpBox.texture = SKTexture(image: UIImage(named: boxImage)!)
            popUpText.text = boxText
        }
        
        let revealAction = SKAction.fadeAlpha(to: 1, duration: 1)
        popUpNode.run(revealAction)
    }
    
    func hidePopUp(){
        let revealAction = SKAction.fadeAlpha(to: 0, duration: 1)
        popUpNode.run(revealAction)
    }
    
    func createPopUp() {
        self.addChild(popUpNode)
        popUpNode.alpha = 0
        
        let bgBlur = SKSpriteNode(color: .black, size: self.size)
        popUpNode.addChild(bgBlur)
        bgBlur.position = CGPoint(x: 683, y: 512)
        bgBlur.alpha = 0.5
        
        let popUpBox = SKSpriteNode(imageNamed: "boxExplanation")
        popUpBox.name = "popUpBox"
        popUpBox.position = CGPoint(x: 683, y: 512)
        popUpNode.addChild(popUpBox)
        
        let text = SKLabelNode(text: "hffgh")
        text.fontColor = .black
        text.name = "popUpText"
        text.fontName = "SFProText-Black"
        text.fontSize = 30
        popUpBox.addChild(text)
        
        popUpButton = SKShapeNode(rect: CGRect(origin: CGPoint(x: -150, y: -50), size: CGSize(width: 300, height: 100)), cornerRadius: 50)
        popUpButton.position = CGPoint(x: 683, y: 200)
        popUpNode.addChild(popUpButton)
        
        let buttonText = SKLabelNode(text: "OK")
        buttonText.fontColor = .black
        buttonText.fontName = "SFProText-Black"
        buttonText.fontSize = 30
        buttonText.position = CGPoint(x: 0, y: -buttonText.frame.height/2)
        popUpButton.addChild(buttonText)
    }
}

struct SwiftUIView: View {
    
    @State
    private var isLinkActive = false
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 1366, height: 1024)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .black
        
        return scene
    }
//    NavigationLink(destination:SwiftUIView()) {
//        Image(activePart == 1 ? "machine1color" : "machine1")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .offset(x: -20)
//    }
    
//    NavigationLink(destination: PresentationView2(presentation: Presentation2Bank.shared.presentationList), isActive: $showPresentation2) {
//        // Trocar para a Presentation View 2
//
//    }
    var body: some View {
        VStack {
            NavigationLink( destination: MachineExplanation3(), isActive: $isLinkActive,
                           label: {  EmptyView() })
            gameView
        }
        .onReceive(NotificationCenter.default.publisher(for: .nextGame)) { _ in
            isLinkActive = true
        }
    }
    
    private var gameView: some View {
        SpriteView(scene: scene)
            .frame(minWidth: 0, maxWidth: .infinity)
            .aspectRatio(contentMode: .fill)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}

extension Notification.Name {
    static let nextGame: Self = .init(rawValue: "nextGame")
}
