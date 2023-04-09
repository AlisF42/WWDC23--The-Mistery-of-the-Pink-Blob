//
//  MachineView.swift
//  
//
//  Created by alis frentzel on 21/04/22.
//

import SwiftUI

struct MachineView: View {
    
    
    @State var activePart: Int
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 0){
            VStack(spacing:0){
                NavigationLink(destination:MiniGame1()) {
                    Image(activePart == 1 ? "machine1color" : "machine1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(x: -20)
                }
                .disabled(activePart != 1)
                
                NavigationLink(destination:{}) {
                    Image(activePart == 2 ? "machine2color" : "machine2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .disabled(activePart != 2)
            }
            .aspectRatio(0.63, contentMode: .fit)
            .layoutPriority(1)
            
            NavigationLink(destination:SwiftUIView()) {
                Image(activePart == 3 ? "machine3color" :"machine3")
                    . resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .disabled(activePart != 3)
            
            NavigationLink(destination: MiniGame2View()) {
                Image(activePart == 4 ? "machine4color" : "machine4")
                    . resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .disabled(activePart != 4)
            
        }
        .aspectRatio(2.31, contentMode: .fit)
        
        
    }
}

struct MachineView_Previews: PreviewProvider {
    static var previews: some View {
        MachineView(activePart: 1)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
