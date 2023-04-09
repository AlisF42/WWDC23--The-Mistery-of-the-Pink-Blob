//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 21/04/22.
//

import SwiftUI

struct MachineExplanationView: View {
    @State var currentDialogIndex = 0
    @State var showGameExplanation = false
    
    var explanation: MachineExplanation
    
    var body: some View {
        VStack(spacing: 0){
            DialogBoxView(dialog: explanation.dialogList[currentDialogIndex], boxImageName: "boxDialog")
            Spacer()
            MachineView(activePart: 1)
                
            Rectangle()
                .frame(height:96)
                .foregroundColor(.gray)
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .onTapGesture { //pq so ta dando no balao???
            
            if currentDialogIndex < explanation.dialogList.count - 1 {
                currentDialogIndex += 1
            } else {
                // Trocaria de presentation
                showGameExplanation = true
            }
        }
        
    }
}

struct MachineExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        MachineExplanationView(explanation: MachineExplanation(backgroundImageName: "PresentationDNABg", dialogList: ["cwhcuhec","bwhcbhcb", "cbwcb"]))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
