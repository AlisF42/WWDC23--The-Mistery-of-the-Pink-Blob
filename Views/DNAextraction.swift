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

            VStack {
               
                DialogView(dialog: dialogList[currentDialogIndex])
                   // .padding()
                Spacer()
                
                ZStack {

                    Image(dnaShowingImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: (showingDNA ? 0.1 : 0.5) * UIScreen.main.bounds.width)
                        .animation(.easeIn, value: showingDNA)
                        .padding()
                        .offset(y: showingDNA ? -150 : 0)

                    Image(dnaImageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: (showingDNA ? 0.8 : 0) * UIScreen.main.bounds.width)
                            .animation(.easeIn, value: showingDNA)
                            .padding()

                    Spacer()
                }
            Spacer()
            }
            // navigation link invisivel
            NavigationLink(destination: MachineExplanation1(), isActive: $showMachineExplanation) {
                
              
            }
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


