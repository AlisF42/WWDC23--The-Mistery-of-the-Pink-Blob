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
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
            
            DialogView(dialog: dialogList[currentDialogIndex])
                .offset(y: UIScreen.main.bounds.height * -0.35)
            VStack{
               
                Spacer()
                
                VStack(spacing: 0){
                    Group {
                        if currentDialogIndex >= 2 {
                            MachineView(activePart: 4)
                        } else {
                            MachineView(activePart: 0)
                        }
                    }
                   
                    
                    Rectangle()
                        .frame(height:96)
                        .foregroundColor(.gray)
                    
                }
            }
            
        }.navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
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
            .previewInterfaceOrientation(.landscapeRight)
    }
}
