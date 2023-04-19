//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 22/04/22.
//

import SwiftUI

struct GameExplanationView: View {
    var boxExplanation: String
    var explanation: String
    var imageName: String
    var explanation2: String
    var body: some View {
        ZStack{
            Image(boxExplanation)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack{
                Text(explanation)
                Image(imageName)
                Text(explanation)
                //Spacer()
                NavigationLink(destination: Text("minigame")) {
                    Text("Ok")
                }
            }
           
        }
    }
}

struct GameExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        GameExplanationView(boxExplanation: "boxExplanation", explanation: "Ese minigame é legal", imageName: "yellowBlob", explanation2: "lalal lala")
            .previewInterfaceOrientation(.landscapeRight)

    }
}

