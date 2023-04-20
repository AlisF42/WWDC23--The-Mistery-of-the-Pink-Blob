//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 25/04/22.
//

import SwiftUI

import SwiftUI

struct IntroMachine: View {
    var dialogList = ["I think the cause of the blob's color change is some mutation in its DNA", "DNA is the molecule, present in all living beings, that encodes all of our characteristics", "We can use an special machine, the sequencer, to reveal and read what blob's dna is saying"]
    
    @State var currentDialogIndex = 0
    @State var showPresentation2 = false
    
    var body: some View {
        ZStack{
            Image("BgLab")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .aspectRatio(contentMode: .fill)
           
                DialogBalloonView(dialog: dialogList[currentDialogIndex],  boxImageName: "ballonSpeakInverted")
                    .offset(y: UIScreen.main.bounds.height * -0.3)

          
            VStack{
                
                NavigationLink(destination: Text("blala")) {
                    Text("")
                }
            }.navigationBarBackButtonHidden(true)
           
           

            VStack {
                Spacer()
                HStack {
                    Spacer()

                    Group {
                        if currentDialogIndex == 0 {
                            Image("cat1IntroLab")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.5)
                        } else {
                            Image("cat2IntroLab")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.5)
                        }
                    }
                }
            }

            // navigation link invisivel
            NavigationLink(destination: DNAextraction(), isActive: $showPresentation2) {
                // Trocar para a Presentation View 2
               
            }.navigationBarBackButtonHidden(true)
        }
        .ignoresSafeArea(.all)
        .onTapGesture {
            if currentDialogIndex < dialogList.count - 1 {
                currentDialogIndex += 1
            } else {
                // Trocaria de presentation
                showPresentation2 = true
            }
        
        }
    }

  

  
}

struct PresentationView22_Previews: PreviewProvider {
    static var previews: some View {
        IntroMachine()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}




//BgLab
//cat1IntroLab
//cat2IntroLab
//ballonSpeakInverted
