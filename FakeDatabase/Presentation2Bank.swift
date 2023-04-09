//
//  File.swift
//  
//
//  Created by alis frentzel on 21/04/22.
//

import Foundation


class Presentation2Bank{
    
    static var shared = Presentation2Bank()
   
    var presentationList: Presentation2
    
    private init(){
        self.presentationList =
        Presentation2(dnaShowingImage: "blob", backgroundImageName: "PresentationDNABg", dialogList: ["To sequence blob's DNA in the machine, first we need to extract it's DNA. CLICK ON BOB TO EXTRACT ITS DNA"], dnaImageName: "dna", blobImageName: "blob")
        }
    }
