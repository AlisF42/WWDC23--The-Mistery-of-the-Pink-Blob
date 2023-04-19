//
//  File.swift
//  
//
//  Created by alis frentzel on 16/04/23.
//

//import Foundation
//import SwiftUI
//import SpriteKit
//import AVFoundation
//
//class GameViewModel: ObservableObject {
//    var audioPlayer: AVAudioPlayer?
//    var beeScene: BeeScene
//    var currentStage: Stage
//    
//    @Published var isRadarOn: Bool = false
//    @Published var showNextStage: Bool = false
//    @Published var isDialogOn: Bool = true
//    @Published var showFlowersInRadar: Bool = false
//    @Published var isDangerous: Bool = false
//    @Published var isGoalDisplayed: Bool = false
//    @Published var isGameOn = true
//    @Published var isGamePaused = false
//    @Published var dialogIndex = 0
//    @Published var flowersPollinated = 0
//
//    var currentStageIndex: Int {
//        didSet {
//            let newStage = StageBank.shared.stageList.first { stage in
//                stage.index == currentStageIndex
//            }
//            if let stage = newStage {
//                self.currentStage = stage
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    self.beeScene.removeAllChildren()
//                    self.beeScene = stage.beeScene
//                }
//            }
//        }
//    }
//    
//    init(currentStage: Stage, beeScene: BeeScene) {
//        self.currentStageIndex = currentStage.index
//        self.currentStage = currentStage
//        self.beeScene = beeScene
//        self.beeScene.gameViewModel = self
//        beeScene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        beeScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        beeScene.scaleMode = .aspectFit
//    }
//
//// MARK: - Handler when dialog view is tapped
//func dialogTapHandle() {
//    if dialogIndex < currentStage.dialogList.count - 1 {
//        // STAGE 1
//        if currentStageIndex == 1 {
//            if dialogIndex == 0 {
//                self.beeScene.bee!.physicsBody?.affectedByGravity = true
//                isGamePaused = false
//            } else if dialogIndex == 2 {
//                withAnimation {
//                    isRadarOn = true
//                    self.showFlowersInRadar = true
//                    self.beeScene.spawnFirstFlowers(openedFlowersPositionList: currentStage.openedFlowersPositionList, closedFlowersPositionList: currentStage.closedFlowersPositionList)
//                    self.beeScene.showDarkOverlay()
//                }
//            } else if dialogIndex == 4 {
//                withAnimation {
//                    self.beeScene.hideDarkOverlay()
//                    isGamePaused = false
//                }
//            } else if dialogIndex == 6 {
//                withAnimation {
//                    self.beeScene.hideDarkOverlay()
//                    isGamePaused = false
//                }
//            }
//        }
