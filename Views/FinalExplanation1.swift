//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 24/04/22.
//

import SwiftUI

struct FinalExplanation1: View {
    
    var dialogList =  ["jrnecr", "crjncjrn"]
    var background = "dnaPinkview"
    
    @State var currentDialogIndex = 0
    @State var showPresentation2 = false
    
    var body: some View {
        ZStack{
            Image(background)
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .aspectRatio(contentMode: .fill)
            VStack{
                
                NavigationLink(destination: FinalExplanation2()) {
                    Text("")
                }
            }
            VStack {
                
                DialogBoxView(dialog: dialogList[currentDialogIndex],  boxImageName: "ballonDialog")
                    .padding(.top)
            Spacer()
            }
           
            // navigation link invisivel
            NavigationLink(destination:  FinalExplanation2(), isActive: $showPresentation2) {
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

struct FinalExplanation1_Previews: PreviewProvider {
    static var previews: some View {
        FinalExplanation1()
    }
}
