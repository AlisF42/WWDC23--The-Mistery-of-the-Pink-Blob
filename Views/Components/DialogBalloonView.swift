//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 21/04/22.
//

import SwiftUI

struct DialogBalloonView: View {
    var dialog: String
    var boxImageName: String //é aqui que coloca mesmo?
    var balloonWidth: CGFloat {
        (UIImage(named: "ballonSpeak")?.size.width)!
    }
    var balloonHeight: CGFloat {
        (UIImage(named: "ballonSpeak")?.size.height)!
    }
    var body: some View {
        ZStack{
            Image(boxImageName)
                .figmaWidth(1004*UIScreen.main.bounds.width)
            VStack(alignment: .leading) {
               
                Text(dialog)
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
               
                
                    .foregroundColor(Color.white)
                
                    .multilineTextAlignment(.leading)
                    .lineLimit(5)
                    .minimumScaleFactor(0.6)
                    
                Spacer()
            }
            .frame(width: balloonWidth*0.8, height: balloonHeight*0.7)
            //.padding(.trailing, 40)
          //  .padding(.leading, 40)
           // .padding(.top,30)
            
        }
       
//        .padding(.trailing, 50)
//        .padding(.leading, 50)
        
    }
}

struct DialogBoxView_Previews: PreviewProvider {
    static var previews: some View {
        DialogBalloonView(dialog: "Ahhhhhhhhhh,hsjhgjshg jdsnvjsnvnbjfdnbj hdehhdj, jbejbjb, njencjn ", boxImageName: "ballonSpeak")
            .previewInterfaceOrientation(.landscapeRight)
    }
}
