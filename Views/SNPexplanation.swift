//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 25/04/22.
//

import SwiftUI

struct SNPexplanation: View {
    var dialogList =  ["jrnecr", "crjncjrn","hfjshfjs", " hsuhvv", "hfuhahv"]
    var cat1: Image {
        Image("cat9Final")
            
    }

    var cat2: Image {
        Image("cat6Final")
    }
   
    
    @State var currentDialogIndex = 0
    @State var showPresentation2 = false
    
    var body: some View {
        ZStack{
            Image("BgLabFinal")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .aspectRatio(contentMode: .fill)
            VStack{
                
                NavigationLink(destination: Text("blala")) {
                    Text("")
                }
            }
            VStack {
                
                DialogBalloonView(dialog: dialogList[currentDialogIndex],  boxImageName: "ballonSpeakInverted")
                    .padding()
            Spacer()
            }
            HStack {
                Spacer()

                        Image("telaDNAsnp")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 0.4 * UIScreen.main.bounds.height)
                            .padding(.leading)
                            .padding(.trailing)
                            .offset(y: UIScreen.main.bounds.height*0.1)
              
                
                
                VStack {
                    Spacer()
                    HStack {
                  //  Spacer()

                        Group {
                            if currentDialogIndex == 2 {
                                cat2
                           
                            } else {
                                cat1
                            }
                        }
                    }
                    
                }
            }
            
            

            NavigationLink(destination:  Conclusion(), isActive: $showPresentation2) {
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


struct SNPexplanation_Previews: PreviewProvider {
    static var previews: some View {
        SNPexplanation()
            .previewInterfaceOrientation(.landscapeRight)
    }
}