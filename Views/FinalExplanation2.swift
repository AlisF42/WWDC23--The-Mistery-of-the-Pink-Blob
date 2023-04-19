//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 24/04/22.
//

import SwiftUI

struct FinalExplanation2: View {
    
    var dialogList =  ["jrnecr", "crjncjrn"]
    var background = "dnPinkandYellowView"
    
    @State var currentDialogIndex = 0
    @State var showPresentation2 = false
    
    var body: some View {
        ZStack{
            Image(background)
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .aspectRatio(contentMode: .fill)
            VStack{
                
                NavigationLink(destination: Text("cabo")) {
                    Text("")
                }
            }
            VStack {
                
                DialogBalloonView(dialog: dialogList[currentDialogIndex],  boxImageName: "ballonDialog")
                Spacer()
            }
            
            // navigation link invisivel
            NavigationLink(destination: ScreenDNA(), isActive: $showPresentation2) {
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

struct FinalExplanation2_Previews: PreviewProvider {
    static var previews: some View {
        FinalExplanation2()
    }
}
