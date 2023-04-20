import SwiftUI
import AVFoundation

struct InitialView: View {
    var bg = "BGIntro"
    var cat = "catIntro" //colocar o gato separado do bg
    
    var body: some View {
        NavigationView(){
            ZStack{
                Rectangle()
                    .foregroundColor(Color.red).frame(maxHeight: UIScreen.main.bounds.height)
                Image(bg)
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .aspectRatio(contentMode: .fill) //é fit ou fill?? Fill deixa um espacinho em baixo
                
                VStack{
                    //titulo
                    Spacer()
                    Text("The misterious pink blob")
                        .font(.system(size: 80, weight: .bold))
                        .padding(.top, 30)
                    
                    Text("or how to sequence DNA")
                        .font(.system(size: 40))
                        .padding(.bottom, 30)
                    
                    //botão
                    NavigationLink(destination: IntroLab()){
                        Text("Start")
                            .font(.headline)
                            .frame(height: 20)
                            .frame(width: 100)
                            .padding()
                            .foregroundColor(.pink)
                            .background(.white)
                            .cornerRadius(20)
                        
                    }
                    
                    //gato - deixar bem rente as bordas
                    Image(cat)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: (UIScreen.main.bounds.height * 3) / 5)
                       
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            .ignoresSafeArea(.all)
        }
        .navigationBarBackButtonHidden(true)
        
        .navigationViewStyle(.stack)
        .statusBar(hidden: true)
        
    }
}

//fazer que nem o andre com as nuvem com os blbs se mechendo?

struct InitialView_Previews: PreviewProvider{
    static var previews: some View {
        InitialView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
