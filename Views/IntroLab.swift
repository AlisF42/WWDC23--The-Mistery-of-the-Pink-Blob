//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 21/04/22.
//

import SwiftUI
import SpriteKit

class IntroLabScene: SKScene {
    var background: SKSpriteNode!
    var blobs: [SKSpriteNode] = []
    var glass: SKSpriteNode!
    var cat: SKSpriteNode!

    override func didMove(to view: SKView) {
        createBackground()
        createBlobs()
        createGlass()
        createCat()
    }

    func createBackground() {
        background = SKSpriteNode(imageNamed: "BGIntroLab")
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.size = self.size
        self.addChild(background)
    }

    func createBlobs() {
        let blobSize = CGSize(width: 112, height: 112)
        let names = ["yellowBlob", "yellowBlob", "pinkBlob", "yellowBlob", "yellowBlob"]
        let positions = [
            CGPoint(x: 723, y: self.size.height - 657),
            CGPoint(x: 809, y: self.size.height - 524),
            CGPoint(x: 933, y: self.size.height - 626),
            CGPoint(x: 1030, y: self.size.height - 517),
            CGPoint(x: 1076, y: self.size.height - 648),
        ]

        let moveDuration = TimeInterval(0.25)
        let animation: (CGFloat) -> SKAction = { dist in
            SKAction.repeatForever(SKAction.sequence([
                SKAction.move(by: CGVector(dx: 0, dy: dist), duration: moveDuration),
                SKAction.move(by: CGVector(dx: 0, dy: -dist), duration: moveDuration),
                SKAction.move(by: CGVector(dx: 0, dy: -dist), duration: moveDuration),
                SKAction.move(by: CGVector(dx: 0, dy: dist), duration: moveDuration),
            ]))
        }

        for (name, position) in zip(names, positions) {
            let blob = SKSpriteNode(imageNamed: name)
            blob.size = blobSize
            blob.position = position
            let distance = CGFloat.random(in: 10...20)
            let delay = SKAction.wait(forDuration: CGFloat.random(in: 0.1...0.4))
            blob.run(
                SKAction.sequence([
                    delay,
                    animation(distance)
                ])
            )
            blobs.append(blob)
        }

        for blob in blobs {
            self.addChild(blob)
        }
    }

    func createGlass() {
        glass = SKSpriteNode(imageNamed: "aquariumIntro")
        glass.size = CGSize(width: 311, height: 571)
        glass.anchorPoint = CGPoint(x: 1, y: 0) //inferior direito
        glass.zRotation = .pi / 2 // rotacionou 90 graus pq tava na vertical
        glass.position = CGPoint(x: 1212, y: self.size.height - 444) //subtrai a altura do figma
        self.addChild(glass)
    }

    func createCat() {
        cat = SKSpriteNode()
        cat.anchorPoint = CGPoint(x: 0, y: 0)//inferior exqurdo
        cat.position = CGPoint(x: 0, y: 0)//posicao em relacao ao anchor point
        cat.size = CGSize(width: 628, height: 675)//do figma

        let animationLayers = [
            SKTexture(imageNamed: "catAnimationIntro1"),
            SKTexture(imageNamed: "catAnimationIntro2"),
        ]

        let animation = SKAction.repeatForever(SKAction.animate(with: animationLayers, timePerFrame: 0.3))
        
        cat.run(animation)

        self.addChild(cat)
    }
}

struct IntroLab: View {
    private var presentation: Presentation = Presentation(backgroundImageName: "BGIntroLab", dialogList: ["jfhjhv hfhsbfh hfbwehbfhwbf fjebfjebjeb ejvbjebvjebv", "jcejh jevnejwnvwjnv jnejvnejvn", "jvjv jnvejnvje ejnvjenvje nvjenvjenv"])
    @State var currentDialogIndex = 0
    @State var showPresentation2 = false

    var body: some View {
        ZStack {
            sceneView

            DialogBalloonView(dialog: presentation.dialogList[currentDialogIndex],  boxImageName: "ballonSpeak")
               
                .offset(y: -270)


            NavigationLink(destination: IntroMachine(), isActive: $showPresentation2) {
                // Trocar para a Presentation View 2

            }
        }
        .onTapGesture {
            if currentDialogIndex < presentation.dialogList.count - 1 {
                currentDialogIndex += 1
            } else {
                // Trocaria de presentation
                showPresentation2 = true
            }
        }
    }

    var scene: SKScene {
        let scene = IntroLabScene()
        scene.size = CGSize(width: 1366, height: 1024)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .black

        return scene
    }

    var sceneView: some View {
        SpriteView(scene: scene)
            .aspectRatio(contentMode: .fill)
    }
}

struct IntroLab_Preview: PreviewProvider {
    static var previews: some View {
        IntroLab()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

//imagens
//BGIntroLab
//aquariumIntro
//cat1Intro
//cat2Intro
//yellowBlob
//pinkBlob
