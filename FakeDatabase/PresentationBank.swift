//
//  File.swift
//  
//
//  Created by alis frentzel on 21/04/22.
//

import Foundation

class PresentationBank{
    static var shared = PresentationBank()
   
    var presentationList: [Presentation] = []
    
    private init(){
        self.presentationList = [
            Presentation(
                backgroundImageName: "wellcomeView",
                dialogList: [
                    "Hello! Good you came, assistent!",
                    "Yesterday, one of my Blobs turned PINK!",
                    "Today I want to know what could've happened! Come with me!"
                ]
            ),
            Presentation(
                backgroundImageName: "PresentationBlobBg",
                dialogList: [
                    "Ooilas",
                    "",
                    ","
                ]
            ),
            Presentation(
                backgroundImageName: "PresentationBlobBg",
                dialogList: [
                    "Olá meu nome é gatinho jones",
                    "",
                    ","
                ]
            ),
            Presentation(
                backgroundImageName: "PresentationBlobBg",
                dialogList: [
                    "Ohjhones",
                    "",
                    ","
                ]
            ),
        ]
    }
}


