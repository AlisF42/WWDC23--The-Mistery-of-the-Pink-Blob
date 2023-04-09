//
//  File.swift
//  
//
//  Created by alis frentzel on 22/04/22.
//

import Foundation

class MachineExplanationBank{
    
    static var shared = MachineExplanationBank()
   
    var explanationList: MachineExplanation
    
    private init(){
        self.explanationList = MachineExplanation(backgroundImageName: "", dialogList: ["The DNA molecule is too big for the machine. So its need to break the DNA in smaller pieces to work. CLICK ON THE MACHINE TO BREAK THE DNA", "beba agua", "awa"])
        }
    }

