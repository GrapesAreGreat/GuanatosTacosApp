import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var locations: [Location] = []
    
    var body: some View {
       // LocationsView(locations: locations)
        VStack {
            if isActive {
                MainTabView() // The view that contains tab bar
            } else {
                Image("logo4") 
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Text("Loading...")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
