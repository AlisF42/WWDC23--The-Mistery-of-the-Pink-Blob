//
//  File.swift
//  
//
//  Created by alis frentzel on 19/04/23.
//

import Foundation
import SwiftUI
//
struct DialogView: View {
    
    var dialog: String
  
    @State var nextOpacity: Double = 0
    //
    var circleWidth: CGFloat {
        (UIImage(named: "catDialogBox")?.size.width)!
    }
    
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame( height: circleWidth*0.60)
                    .foregroundColor(Color.gray)
                    .padding(.leading, circleWidth * 0.5)
                    .padding(.trailing,40) //nao sei se foi a melhor maneira
                    .padding(.top, 1.25)
                
                HStack {
                    
                    ZStack {
                        Image("catDialogBox")
                            .figmaWidth(200*UIScreen.main.bounds.width)
                            .padding(.leading,40)
                        //o que ta determinando para que ele fica onde esta?
                        //.offset(x:UIScreen.main.bounds.width*(0.01))
                    }
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(dialog)
                            .font(.system(size: 23, weight: .semibold, design: .rounded))
                            
                            .padding(.leading)
                            .padding(.trailing, circleWidth * 0.25)
                            
                            .foregroundColor(Color.white)
                        
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .minimumScaleFactor(0.6)
                        Spacer()
                        HStack {
                            Spacer()
                            HStack {
                                Text("NEXT")
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(Color.yellow)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            
                        }
                        .padding(.trailing, circleWidth * 0.30)
                      
                        .opacity(nextOpacity)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: nextOpacity)
                    }
                    
                    .frame(height: circleWidth*0.45)
                    //.padding(.trailing, hexagonWidth * 0.5)
                    
                    //Spacer()
                }
            }
        }
       // .frame(maxWidth: .infinity)
        //.frame(height: 220)
        .padding(.top,40)
        .onAppear{
            nextOpacity = 1
        }
    }
}


//catDialogBox
struct DialogView_Previews: PreviewProvider {
    static var previews: some View {
        DialogView(dialog: "jdshcjs hfkjshfjsh fbjbf fjhjsfh , jjbsdbsjb jfjsbj kdahfjf, sjdkfnfnvmb hdsuhush uvsdhvsjhv vkjsvhsv h")
            .previewInterfaceOrientation(.landscapeRight)
    }
}
