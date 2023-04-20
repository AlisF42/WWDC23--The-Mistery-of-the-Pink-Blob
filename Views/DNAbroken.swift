//
//  SwiftUIView 2.swift
//  
//
//  Created by alis frentzel on 24/04/22.
//

import SwiftUI

struct DNAbroken: View {
    var background =  "PresentationDNABg"
    var dialogList = ["The DNA molecule is too huge to enter the machine. Let break into pieaces to make it possible to be sequenced", "CLICK ON DNA TO BREAK ITS DNA"]
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
               
                DialogView(dialog: dialogList[currentDialogIndex]  )
                Spacer()
                    Image(showingDNA ? brokenDna : dna)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: (0.8) * UIScreen.main.bounds.width)
                        
                       // .padding()
                Spacer()
                    
                
            }
            
            // navigation link invisivel
            NavigationLink(destination: MachineExplanation2() , isActive: $showMachineExplanation) {
                // Trocar para a Presentation View 2
              
            }.navigationBarBackButtonHidden(true)
        }
        .ignoresSafeArea(.all)
        .onTapGesture {
            
            if currentDialogIndex < dialogList.count - 1 {
                currentDialogIndex += 1
            } else {
                if !showingDNA {
                    showingDNA.toggle()
                    return
                }

                showMachineExplanation = true
            }
        }
      
    }
}



struct DNAbroken_Previews: PreviewProvider {
    static var previews: some View {
        DNAbroken()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
