//
//  SwiftUIView 2.swift
//  
//
//  Created by alis frentzel on 24/04/22.
//

import SwiftUI

struct MachineExplanation3: View {
    @State var currentDialogIndex = 0
    @State var showGameExplanation = false
    
    var dialogList =  ["oi", "bla", "njenc"]
    
    var body: some View {
        VStack(spacing: 0){
            DialogBalloonView(dialog: dialogList[currentDialogIndex], boxImageName: "boxDialog")
            Spacer()
            MachineView(activePart: 4)
                
            Rectangle()
                .frame(height:96)
                .foregroundColor(.gray)
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .onTapGesture { //pq so ta dando no balao???
            
            if currentDialogIndex < dialogList.count - 1 {
                currentDialogIndex += 1
            } else {
                // Trocaria de presentation
                showGameExplanation = true
            }
        }
    }
}

struct MachineExplanation3_Previews: PreviewProvider {
    static var previews: some View {
        MachineExplanation3()
    }
}
