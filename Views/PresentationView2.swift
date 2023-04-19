//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 21/04/22.
//

import SwiftUI

struct PresentationView2: View {
    var presentation: Presentation2
    @State var currentDialogIndex = 0
    @State var showMachineExplanation = false
    @State var showingDNA = false
    
    var body: some View {
        ZStack{
            Image(presentation.backgroundImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width)
            VStack{
                
                NavigationLink(destination: Text("blala")) {
                    Text("")
                }
            }
            
            VStack {
               
                DialogBoxView(dialog: presentation.dialogList[currentDialogIndex],  boxImageName: "boxDialog")
                    .padding()
                Spacer()
                
                HStack{
                 
                    Image(showingDNA ? presentation.dnaImageName : presentation.dnaShowingImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .onTapGesture {
                            showingDNA.toggle()
                        }
                        .padding()
                }
            Spacer()
            }
            // navigation link invisivel
            NavigationLink(destination: MachineExplanationView( explanation: MachineExplanationBank.shared.explanationList), isActive: $showMachineExplanation) {
                // Trocar para a Presentation View 2
              
            }
        }
        .ignoresSafeArea(.all)
        .onTapGesture {
            
            if currentDialogIndex < presentation.dialogList.count - 1 {
                currentDialogIndex += 1
            } else {
                // Trocaria de presentation
                showMachineExplanation = true
            }
        }
      
    }
}

//struct PresentationView2_Previews: PreviewProvider {
//    static var previews: some View {
//        Teste(presentation: Presentation(backgroundImageName: "PresentationDNABg", dialogList: ["hdehd", "hhcjdh"]))
//            .previewInterfaceOrientation(.landscapeRight)
//    }
//}

