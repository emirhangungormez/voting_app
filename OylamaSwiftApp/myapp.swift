import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color(red: 0.23, green: 0.23, blue: 0.23) // Arkaplan rengini burada ayarlayabilirsiniz
                    .ignoresSafeArea()
                
                ContentView() // Ana içerik burada olacak
            }
        }
    }
}
