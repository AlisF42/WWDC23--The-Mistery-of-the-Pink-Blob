//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 21/04/22.
//

import SwiftUI

struct MachineExplanation1: View {
    var dialogList = ["I think the cause of the blob's color change is some mutation in its DNA", "DNA is the molecule, present in all living beings, that encodes all of our characteristics", "We can use an special machine, the sequencer, to reveal and read what blob's dna is saying"]
    
    @State var currentDialogIndex = 0
    @State var showGameExplanation = false
    

    
    var body: some View {
        ZStack {
            Image("BGIntro")
                .resizable()
                .aspectRatio(contentMode: .fill)
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

struct MachineExplanation1_Previews: PreviewProvider {
    static var previews: some View {
        MachineExplanation1()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
