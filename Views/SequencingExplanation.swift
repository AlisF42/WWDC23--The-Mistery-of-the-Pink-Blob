//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 24/04/22.
//

import SwiftUI

struct SequencingExplanation: View {
    
    var dialogList =  ["jrnecr", "crjncjrn","hfjshfjs", " hsuhvv", "hfuhahv"]

    
    @State var currentDialogIndex = 0
    @State var showPresentation2 = false
    
    var body: some View {
        ZStack{
            Image("BgLabFinal")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .aspectRatio(contentMode: .fill)
            
                
                DialogBalloonView(dialog: dialogList[currentDialogIndex],  boxImageName: "ballonSpeakInverted")
                .offset(y: UIScreen.main.bounds.height * -0.3)
            
            
            VStack{
                
                NavigationLink(destination: Text("blala")) {
                    Text("")
                }
            }
            
            HStack {
                Spacer()
                
                Group {
                    if currentDialogIndex >= 2  {
                        Image("telaDNABoth")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 0.4 * UIScreen.main.bounds.height)
                            .padding(.leading)
                            .padding(.trailing)
                            .offset(y: UIScreen.main.bounds.height*0.1)
                    } else {
                        Image("telaDNAPink")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 0.4 * UIScreen.main.bounds.height)
                            .padding(.leading)
                            .padding(.trailing)
                            .offset(y: UIScreen.main.bounds.height*0.1)
                            
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                  //  Spacer()

                        Group {
                            if currentDialogIndex == 2 {
                                Image("cat2Final")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: UIScreen.main.bounds.width * 0.5)
                            } else if currentDialogIndex >= 3 {
                                Image("cat7Final")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: UIScreen.main.bounds.width * 0.5)
                            } else {
                                Image("cat1Final")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: UIScreen.main.bounds.width * 0.5)
                            }
                        }
                    }
                    
                }
            }
            
            

            NavigationLink(destination:  ScreenDNA(), isActive: $showPresentation2) {
                // Trocar para a Presentation View 2
               
            }.navigationBarBackButtonHidden(true)
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

struct SequencingExplanation_Previews: PreviewProvider {
    static var previews: some View {
        SequencingExplanation()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
//telaDNAPink
//telaDNABoth

