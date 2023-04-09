import SwiftUI

struct InitialView: View {
    var bg = "InitialView"
    
    var body: some View {
    
        NavigationView{
            ZStack{
                Image(bg)
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .aspectRatio(contentMode: .fill)
                    
                VStack{
                    
                    NavigationLink(destination: PresentationView(presentation: PresentationBank.shared.presentationList[0])){
                            Text("Start")
                            .padding()
                            .background(.white)
                        }
                }
            }
        }
        .navigationViewStyle(.stack)
        .ignoresSafeArea(.all)
        .statusBar(hidden: true)
    }
}

struct InitialView_Previews: PreviewProvider{
    static var previews: some View {
        InitialView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
