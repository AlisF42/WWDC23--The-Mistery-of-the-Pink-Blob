//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 25/04/22.
//

import SwiftUI

struct PresentationView22: View {
    var bg =  "PresentationBlobBg"
    var dialogList = ["I think the cause of the blob's color change is some mutation in its DNA", "DNA is the molecule, presents in all living beings, that encodes all of our characteristics", "We can use an special machine, the sequencer, to reveal and read what blob's dna is saying"]
    
    @State var currentDialogIndex = 0
    @State var showPresentation2 = false
    
    var body: some View {
        ZStack{
            Image(bg)
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .aspectRatio(contentMode: .fill)
            VStack{
                
                NavigationLink(destination: Text("blala")) {
                    Text("")
                }
            }
           
            VStack {
                
                DialogBoxView(dialog: dialogList[currentDialogIndex],  boxImageName: "ballonDialog")
                    .padding()

                Spacer()
                    
            }
            
            // navigation link invisivel
            NavigationLink(destination: PresentationView2(presentation: Presentation2Bank.shared.presentationList), isActive: $showPresentation2) {
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
}

struct PresentationView22_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView22()
    }
}
