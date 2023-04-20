//
//  File 2.swift
//  
//
//  Created by alis frentzel on 19/04/23.
//

import Foundation
import SwiftUI

import SwiftUI

struct Conclusion: View {
    var dialogList = ["I think the cause of the blob's color change is some mutation in its DNA", "DNA is the molecule, present in all living beings, that encodes all of our characteristics", "We can use an special machine, the sequencer, to reveal and read what blob's dna is saying"]
    
    @State var currentDialogIndex = 0
    @State var showPresentation2 = false
    
    var body: some View {
        ZStack{
            Image("BgFinalLab")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .aspectRatio(contentMode: .fill)
            VStack{
                
                NavigationLink(destination: Text("blala")) {
                    Text("")
                }
            }
           
            VStack {
                
                DialogBalloonView(dialog: dialogList[currentDialogIndex],  boxImageName: "ballonSpeakInverted")
                    .padding()

              Spacer()
                    
            }

            VStack {
                Spacer()
                HStack {
                  
                    Spacer()
                    Group {
                        if currentDialogIndex == 0 {
                            cat1
                        } else {
                            cat2
                        }
                    }
                    
                }
                
            }

            // navigation link invisivel
            NavigationLink(destination: TheEnd(), isActive: $showPresentation2) {
                // Trocar para a Presentation View 2
               
            }
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

    var cat1: Image {
        Image("catConclusion1")
    }

    var cat2: Image {
        Image("catConclusion2")
    }
}

struct Conclusion_Previews: PreviewProvider {
    static var previews: some View {
        Conclusion()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
