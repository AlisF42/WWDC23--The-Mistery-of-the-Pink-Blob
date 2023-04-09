//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 21/04/22.
//

import SwiftUI

struct PresentationView: View {
    var presentation: Presentation
    @State var currentDialogIndex = 0
    @State var showPresentation2 = false
    
    var body: some View {
        ZStack{
            Image(presentation.backgroundImageName)
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .aspectRatio(contentMode: .fill)
            VStack{
                
                NavigationLink(destination: Text("blala")) {
                    Text("")
                }
            }
           
            VStack {
                
                DialogBoxView(dialog: presentation.dialogList[currentDialogIndex],  boxImageName: "ballonDialogInv")
                    .padding()

                Spacer()
                    
            }
            
            // navigation link invisivel
            NavigationLink(destination: PresentationView22(), isActive: $showPresentation2) {
                // Trocar para a Presentation View 2
               
            }
        }
        .ignoresSafeArea(.all)
        .onTapGesture {
            if currentDialogIndex < presentation.dialogList.count - 1 {
                currentDialogIndex += 1
            } else {
                // Trocaria de presentation
                showPresentation2 = true
            }
        }
      
    }
}

struct PresentationView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView(presentation: Presentation(backgroundImageName: "PresentationBlobBg", dialogList: ["hdehd", "hhcjdh"]))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
