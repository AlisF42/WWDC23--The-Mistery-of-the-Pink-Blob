//
//  File.swift
//  
//
//  Created by alis frentzel on 16/04/23.
//

//import Foundation
//
//final class DialogBank {
//    static var shared = DialogBank()
//    
//    var introDialogList: [Dialog] = []
//    var dnaExtractionDialogList: [Dialog] = []
//    var machine1DialogList: [Dialog] = []
//    var machine2DialogList: [Dialog] = []
//    var machine3DialogList: [Dialog] = []
//    var analysisDialogList: [Dialog] = []
//    var conclusionDialogList: [Dialog] = []
//    
//    private init() {
//        // INTRO
//        self.introDialogList = [
//            Dialog(type: .text,  text: "Your time has come, my daughter. You must work for me collecting the nectar from the flowers to feed me."),
//            Dialog(type: .text,  text: "But first I need to teach you the basics, to save you from a tragic death."),
//        ]
//        
//        // DNA EXTRACTION: FIRST STEP FOR DNA SEQUENCING
//        self.dnaExtractionDialogList = [
//            Dialog(type: .text,  text: "Ok! First you need to learn how to fly around."),
//            Dialog(type: .task,  text: "In order to fly, keep the device stable and tilt to the  desired direction using the accelerometer."),
//            Dialog(type: .text,  text: "Okay okay! Great job little bee, you learn fast."),
//            Dialog(type: .text, text: "I'm also giving you this radar, which will show where are the flowers full of pollen. Your other sisters are always updating it."),
//            Dialog(type: .text,  text: "The pink flowers with yellow dots inside have pollen and the flowers without it can be pollinated when you have pollen."),
//            Dialog(type: .task,  text: "Find a tasty flower using the radar and collect the pollen."),
//            Dialog(type: .text,  text: "Hmmmm... This is wonderful and delicious at the same time... This is wonderlicious!"),
//            Dialog(type: .task,  text: "Now that you took the pollen, find closed flowers to pollinate and grow more flowers."),
//            Dialog(type: .text,  text: "Great job, darling! Did you know that 80% of all floweringplants are pollinated by ous? We have a huge responsability in the world."),
//        ]
//        
//        // MACHINE 1 - DNA DIGESTION: SECOND STEP FOR DNA SEQUENCING
//        self.machine1DialogList = [
//            Dialog(type: .text,  text: "You are doing well so far..."),
//            Dialog(type: .text,  text: "Now you must take care, there are some deadly clouds caused by pesticides."),
//            Dialog(type: .text,  text: "If you get close to the cloud, you lose all the radar senses and you might get lost forever... So be careful and stay away from them."),
//            Dialog(type: .text,  text: "Now you have a goal to collect pollen and pollinate 3 other flowers. Are you ready?"),
//            Dialog(type: .task, text: "Pollinate 3 pink flowers."),
//            Dialog(type: .text,  text: "I'm glad that you completed your goal and you are still alive! A lot of your sisters have died because of the pesticides lately."),
//        ]
//        
//        // MACHINE 2 - DNA SEQUENCING: THIRD STEP FOR DNA SEQUENCING
//        self.machine2DialogList = [
//            Dialog(type: .text,  text: "Now you graduated. Congratulations, my darling!"),
//            Dialog(type: .text,  text: "In this place there are multiple flowers. I'm assigning you a pro mission: you need to collect 6 flowers."),
//            Dialog(type: .task, text: "Pollinate 6 pink flowers colors."),
//            Dialog(type: .text,  text: "Great job, my daughter! You have completed your mission for today."),
//        ]
//        // MACHINE 3 - DNA ALIGMENT: FOURTH STEP FOR DNA SEQUENCING
//        self.machine3DialogList = [
//            Dialog(type: .text,  text: "Now you graduated. Congratulations, my darling!"),
//            Dialog(type: .text,  text: "In this place there are multiple flowers. I'm assigning you a pro mission: you need to collect 6 flowers."),
//            Dialog(type: .task, text: "Pollinate 6 pink flowers colors."),
//            Dialog(type: .text,  text: "Great job, my daughter! You have completed your mission for today."),
//        ]
//        // ANALYSIS - COMPARATION
//        self.analysisDialogList = [
//            Dialog(type: .text,  text: "Now you graduated. Congratulations, my darling!"),
//            Dialog(type: .text,  text: "In this place there are multiple flowers. I'm assigning you a pro mission: you need to collect 6 flowers."),
//            Dialog(type: .task, text: "Pollinate 6 pink flowers colors."),
//            Dialog(type: .text,  text: "Great job, my daughter! You have completed your mission for today."),
//        ]
//        // CONCLUSION
//        self.conclusionDialogList = [
//            Dialog(type: .text,  text: "Now you graduated. Congratulations, my darling!"),
//            Dialog(type: .text,  text: "In this place there are multiple flowers. I'm assigning you a pro mission: you need to collect 6 flowers."),
//            Dialog(type: .task, text: "Pollinate 6 pink flowers colors."),
//            Dialog(type: .text,  text: "Great job, my daughter! You have completed your mission for today."),
//        ]
//    }
//}
