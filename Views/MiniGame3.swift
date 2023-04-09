//
//  MiniGame2.swift
//  
//
//  Created by alis frentzel on 23/04/22.
//



import SwiftUI
import SpriteKit

class MiniGame2Scene: SKScene {

    var movableNode : SKNode?
    
    var popUpNode: SKNode = SKNode()
    var popUpButton: SKShapeNode!
    
    var firstDialogShowed = false
    
    var anchorColumn1Array:[SKSpriteNode] = []
    var anchorColumn2Array:[SKSpriteNode] = []
    var anchorColumn3Array:[SKSpriteNode] = []

    var stack1: SKSpriteNode!
    var stack2: SKSpriteNode!
    var stack3: SKSpriteNode!
    
    var stacksArray: [SKSpriteNode] = []
  
    
    var dropArea1: SKSpriteNode!
    var dropArea2: SKSpriteNode!
    var dropArea3: SKSpriteNode!

    var numberOfRows = 5
       
    override func didMove(to view: SKView) {

        createBaseAnchor()
        createDropAreas()
        createDropAreas()
        createStacks()
        createPopUp()


        showPopUp(boxImage: "boxExplanation", boxText: "inicio do jogo")
    }
    
    
    

    
    func createBaseAnchor(){
        
        for position in 0..<numberOfRows {
            let anchor1 = SKSpriteNode(color: .clear, size: CGSize(width: 640, height: 140))
            let space = (self.size.height - 5 * 140)/2
            anchor1.position = CGPoint(x: 683-320, y: 232 + position * 140)
            anchor1.name = "1"
            self.addChild(anchor1)
            anchorColumn1Array.append(anchor1)
        }

        for position in 0..<numberOfRows {
            let anchor3 = SKSpriteNode(color: .clear, size: CGSize(width: 640, height: 140))
            anchor3.position = CGPoint(x: 683+320, y: 232 + CGFloat(position * 140))
            self.addChild(anchor3)
            anchor3.name = "3"

            anchorColumn3Array.append(anchor3)
        }

        for position in 0..<numberOfRows {
            let anchor2 = SKSpriteNode(color: .clear, size: CGSize(width: 640, height: 140))
            anchor2.position = CGPoint(x: 683, y: 232 + CGFloat(position * 140))
            self.addChild(anchor2)
            anchor2.name = "2"

            anchorColumn2Array.append(anchor2)
        }
    }
    
    func createDropAreas(){
        
           dropArea1 = SKSpriteNode(color: .clear, size: CGSize(width: 480, height: 140 + 5 * 140))
            let space = (self.size.height - 5 * 140)/2
            dropArea1.position = CGPoint(x: 683-320-80, y: 512)
            dropArea1.name = "1"
            self.addChild(dropArea1)


            dropArea3 = SKSpriteNode(color: .clear, size: CGSize(width: 480, height: 140 + CGFloat(5 * 140)))
            dropArea3.position = CGPoint(x: 683+320+80, y: 512)
            self.addChild(dropArea3)
            dropArea3.name = "3"


            dropArea2 = SKSpriteNode(color: .clear, size: CGSize(width: 400, height: 140 + CGFloat(5 * 140)))
            dropArea2.position = CGPoint(x: 683, y: 512)
            self.addChild(dropArea2)
            dropArea2.name = "2"

    }
    
    func createStacks() {
        self.stack1 = SKSpriteNode(imageNamed: "stack1")
        self.stack2 = SKSpriteNode(imageNamed: "stack2")
        self.stack3 = SKSpriteNode(imageNamed: "stack3")
      
        stack1.position = anchorColumn2Array[0].position
        stack2.position = anchorColumn3Array[2].position
        stack3.position = anchorColumn1Array[4].position
      
        stack1.name = "1"
        stack2.name = "2"
        stack3.name = "3"
        
        self.addChild(stack1)
        self.addChild(stack2)
        self.addChild(stack3)

        stacksArray.append(contentsOf: [stack1, stack2, stack3])
        
    }
    
  
    
    
    func isCorrect() -> Bool {
        guard dropArea1.contains(stack1.position)
                && dropArea2.contains(stack2.position)
                && dropArea3.contains(stack3.position) else {
            return false
        }
        //
        
        var stack1Row: Int!
        var stack2Row: Int!
        var stack3Row: Int!
    
        for (position, anchor) in anchorColumn1Array.enumerated() {
            if anchor.contains(stack1.position) {
                stack1Row = position
                break
            }
        }
        for (position, anchor) in anchorColumn2Array.enumerated() {
            if anchor.contains(stack2.position) {
                stack2Row = position
                break
            }
        }
        for (position, anchor) in anchorColumn3Array.enumerated() {
            if anchor.contains(stack3.position) {
                stack3Row = position
                break
            }
        }
        
        return stack1Row == stack2Row && stack2Row == stack3Row
        
    }
    
    
    //MARK: - Gestures
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            for stack in stacksArray {
                if stack.contains(location) && firstDialogShowed {
                    movableNode = stack
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
            
            let location = touch.location(in: self)

            var anchorColumn: [SKSpriteNode] = anchorColumn1Array
            
            if dropArea1.contains(location) {
                anchorColumn = anchorColumn1Array
            } else if dropArea2.contains(location) {
                anchorColumn = anchorColumn2Array
            } else if dropArea3.contains(location) {
                anchorColumn = anchorColumn3Array
            }
            
            
            for anchor in anchorColumn {
                if anchor.contains(location) {
                    movableNode!.position = anchor.position
                }
            }
            
        }
        movableNode = nil

        
        if isCorrect() {
            print("Foi!")
            showPopUp(boxImage: "boxExplanation", boxText: "Final")
        }

        if let touch = touches.first, movableNode == nil {
            let locationOnPopUp = touch.location(in: popUpNode)

            if popUpButton.contains(locationOnPopUp)
                && popUpNode.alpha == 1
                && isCorrect() {
                NotificationCenter.default.post(name: .nextGame2, object: nil)

            } else if popUpButton.contains(locationOnPopUp)
                        && popUpNode.alpha == 1 {
                hidePopUp()
                firstDialogShowed = true
            }
        }
//
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            movableNode = nil
        }
    }

    
    //MARK: - Coisas do popup
    
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

struct MiniGame2View: View {
    
    @State
    private var isLinkActive = false
    
    var scene: SKScene {
        let scene = MiniGame2Scene()
        scene.size = CGSize(width: 1366, height: 1024)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .black
        
        return scene
    }

    var body: some View {
        VStack {
            NavigationLink( destination: FinalExplanation1(), isActive: $isLinkActive,
                           label: {  EmptyView() })
            gameView
        }
        .onReceive(NotificationCenter.default.publisher(for: .nextGame2)) { _ in
            isLinkActive = true
        }
    }
    
    private var gameView: some View {
        SpriteView(scene: scene)
            .frame(minWidth: 0, maxWidth: .infinity)
            .aspectRatio(contentMode: .fill)
    }
}

struct MiniGame2View_Previews: PreviewProvider {
    static var previews: some View {
        MiniGame2View()
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}

extension Notification.Name {
    static let nextGame2: Self = .init(rawValue: "nextGame2")
}
