//
//  SwiftUIView 2.swift
//  
//
//  Created by alis frentzel on 24/04/22.
//

import SwiftUI

struct MiniGame1: View {
    var background =  "PresentationDNABg"
    var dialogList = ["jhf", "jfrj"]
    var dna = "dna"
    var brokenDna = "dnaBroken"
    
    @State var currentDialogIndex = 0
    @State var showMachineExplanation = false
    @State var showingDNA = false
    
    var body: some View {
        ZStack{
            Image(background)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width)
            VStack{
                
                NavigationLink(destination: Text("blala")) {
                    Text("")
                }
            }
            
            VStack {
               
                DialogBoxView(dialog: dialogList[currentDialogIndex],  boxImageName: "boxDialog")
                Spacer()
                    Image(showingDNA ? brokenDna : dna)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            showingDNA.toggle()
                        }
                        .padding()
                Spacer()
                    
                
            }
            
            // navigation link invisivel
            NavigationLink(destination: MachineExplanation2() , isActive: $showMachineExplanation) {
                // Trocar para a Presentation View 2
              
            }
        }
        .ignoresSafeArea(.all)
        .onTapGesture {
            
            if currentDialogIndex < dialogList.count - 1 {
                currentDialogIndex += 1
            } else {
                // Trocaria de presentation
                showMachineExplanation = true
            }
        }
      
    }
}

struct MiniGame1_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView(presentation: Presentation(backgroundImageName: "PresentationDNABg", dialogList: ["hdehd", "hhcjdh"]))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
