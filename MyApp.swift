import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                InitialView()
                    .previewInterfaceOrientation(.landscapeRight)
            }
            .navigationViewStyle(.stack)
            
        }
    }
}
