//
//  File.swift
//  
//
//  Created by alis frentzel on 18/04/23.
//

import SwiftUI

extension Image {
  func figmaWidth(_ width: CGFloat) ->  some View {
    self
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(maxWidth: width / 1024)
  }
}
