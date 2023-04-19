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
        ZStack {
            Image("BGIntro")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width)
            
            VStack{
                DialogView(dialog: dialogList[currentDialogIndex])
                Spacer()
                
                VStack(spacing: 0){
                    Group {
                        if currentDialogIndex >= 2 {
                            MachineView(activePart: 1)
                        } else {
                            MachineView(activePart: 0)
                        }
                    }
                   
                    
                    Rectangle()
                        .frame(height:96)
                        .foregroundColor(.gray)
                    
                }
            }
            
        }.edgesIgnoringSafeArea(.all)
            .onTapGesture {
                
                if currentDialogIndex < dialogList.count - 1 {
                    currentDialogIndex += 1
                } else {
                    
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
