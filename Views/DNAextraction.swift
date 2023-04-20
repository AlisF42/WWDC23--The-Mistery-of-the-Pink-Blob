//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 21/04/22.
//

import SwiftUI

struct DNAextraction: View {

    
    var backgroundImageName =  "PresentationDNABg"
    var dialogList = ["To sequence blob's DNA in the machine, first we need to extract it's DNA", "CLICK ON BOB TO EXTRACT ITS DNA"]
    var dnaImageName = "dna"
    var dnaShowingImage = "blob"
    var blobImageName = "blob"
    
    @State var currentDialogIndex = 0
    @State var showMachineExplanation = false
    @State var showingDNA = false
    
    var body: some View {
        ZStack{
            Image(backgroundImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width)
            DialogView(dialog: dialogList[currentDialogIndex])
                .offset(y: UIScreen.main.bounds.height * -0.35)
            
            VStack {
               
              
                  
               
                
                ZStack {
                    VStack{
                        Spacer()
                        Image(dnaShowingImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(y: UIScreen.main.bounds.height * 0.1)
                            .frame(maxWidth: (showingDNA ? 0.1 : 0.3) * UIScreen.main.bounds.width)
                            .animation(.easeIn, value: showingDNA)
                            .padding()
                            .offset(y: showingDNA ? -50 : 50)
                        
                        Image(dnaImageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: (showingDNA ? 0.8 : 0) * UIScreen.main.bounds.width)
                            .animation(.easeIn, value: showingDNA)
                            .offset(y: UIScreen.main.bounds.height * 0.1)
                        
                        Spacer()
                    }
                }
            Spacer()
            }
            // navigation link invisivel
            NavigationLink(destination: MachineExplanation1(), isActive: $showMachineExplanation) {
                
              
            }.navigationBarBackButtonHidden(true)
        }
        .ignoresSafeArea(.all)
        .onTapGesture {
            
            if currentDialogIndex < dialogList.count - 1 {
                currentDialogIndex += 1
            } else {
                // Trocaria de presentation
                if !showingDNA {
                    showingDNA.toggle()
                    return
                }

                showMachineExplanation = true
            }
          
        }
      
    }
}

struct DNAextraction_Previews: PreviewProvider {
    static var previews: some View {
        DNAextraction()
            .previewInterfaceOrientation(.landscapeRight)
    }
}


