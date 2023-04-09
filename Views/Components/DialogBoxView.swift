//
//  SwiftUIView.swift
//  
//
//  Created by alis frentzel on 21/04/22.
//

import SwiftUI

struct DialogBoxView: View {
    var dialog: String
    var boxImageName: String //é aqui que coloca mesmo?
    
    var body: some View {
        ZStack{
            Image(boxImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
               
            Text(dialog)
                .padding(.trailing)
                //.padding(.bottom,70)
                .padding()
                
        }
        .padding(.trailing,100)
        
        .padding(.leading,100)
        
        
    }
}

struct DialogBoxView_Previews: PreviewProvider {
    static var previews: some View {
        DialogBoxView(dialog: "Ahhhhhhhhhh, hdehhdj, jbejbjb, njencjn hbxhebxheb bhdbchdbc bcebcb bcbnxcb jecjc bcebcbc vjfnvjfnvjnjvnvnjnvjrnvjrnv jnvjrnvjrnvjnr nvjrnvjrnvrnv", boxImageName: "boxDialog")
    }
}
