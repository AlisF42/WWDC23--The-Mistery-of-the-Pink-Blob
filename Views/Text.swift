//
//  File 2.swift
//  
//
//  Created by alis frentzel on 19/04/23.
//

import SwiftUI
struct TypeWriterView: View {
    @State var text: String = ""
    let finalText: String
    init(_ myText: String) {
      self.finalText = myText
    }
    var body: some View {
        Text(text)
        //mudar fontes etc
       .onAppear{typeWriter()}
        
    }
    
    
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            text = ""
        }
        //velocidade (0.2)
        if position < finalText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                text.append(finalText[position])
                typeWriter(at: position + 1)
            }
        }
    }
}


struct TypeWriterView_Previews: PreviewProvider {
    static var previews: some View {
        TypeWriterView("has")
    }
}

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
