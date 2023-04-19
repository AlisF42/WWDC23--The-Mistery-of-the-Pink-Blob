//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 21/04/22.
//

import SwiftUI

struct IntroLab: View {
    private var presentation: Presentation = Presentation(backgroundImageName: "BGIntroLab", dialogList: ["jfhjhv", "jcejh", "jvjv"])
    @State var currentDialogIndex = 0
    @State var showPresentation2 = false
    var yellowBlob = Image("yellowBlob")
    var pinkBlob = Image("pinkBlobpeq")
    var glass = Image("aquariumIntro")
    
    var body: some View {
        ZStack{
            Image(presentation.backgroundImageName)
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .aspectRatio(contentMode: .fill)
          
           
            VStack {
                
                DialogBoxView(dialog: presentation.dialogList[currentDialogIndex],  boxImageName: "ballonSpeak")
                    .padding()

                Spacer()
                    
            }
            ZStack {
                
                HStack{
                    AnimatedBlob(blobName: "yellowBlob",random: true).offset(y:UIScreen.main.bounds.height*0.006)
                    AnimatedBlob(blobName: "pinkBlobpeq",random: false).offset(y:UIScreen.main.bounds.height*0.02)
                    AnimatedBlob(blobName: "yellowBlob",random: true).offset(y:UIScreen.main.bounds.height*0.05)
                    AnimatedBlob(blobName: "yellowBlob",random: false).offset(y:UIScreen.main.bounds.height*(-0.07))
                  
                }
                Image("aquariumIntro").figmaWidth(571.0*UIScreen.main.bounds.width)
                
            }.offset(x:0.15*UIScreen.main.bounds.width, y:0.068*UIScreen.main.bounds.height)
            // navigation link invisivel
            NavigationLink(destination: PresentationView22(), isActive: $showPresentation2) {
                // Trocar para a Presentation View 2
               
            }
            VStack {
                Spacer()
                HStack {
                    Image("cat1Intro").figmaWidth(486*UIScreen.main.bounds.width)
                    Spacer()
                }
            }
        }
        
        .ignoresSafeArea(.all)
        .onTapGesture {
            if currentDialogIndex < presentation.dialogList.count - 1 {
                currentDialogIndex += 1
            } else {
                // Trocaria de presentation
                showPresentation2 = true
            }
        }
      
    }
}



struct AnimatedBlob: View{
    var blobName: String
    var random: Bool
    let timer = Timer.publish(every: 1, on: .main , in: .default).autoconnect()
    @State var animation = true
    var body: some View{
        Image(blobName).resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 112.0/1024*UIScreen.main.bounds.width).offset(y:!animation ? 0 : 0.06*(random ? -1 :1)*UIScreen.main.bounds.height).animation(.spring(), value: animation).onReceive(timer) { _ in
            animation.toggle()
        }
                
                
    }
}

struct IntroLab_Preview: PreviewProvider {
    static var previews: some View {
        IntroLab()
            .previewInterfaceOrientation(.landscapeRight)
    }
}


//imagens
//BGIntroLab
//aquariumIntro
//cat1Intro
//cat2Intro
//yellowBlob
//pinkBlob
