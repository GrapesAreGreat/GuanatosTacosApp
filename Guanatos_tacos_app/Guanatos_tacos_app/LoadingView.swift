import SwiftUI
struct LoadingView: View {
    @State private var isReady = false
    
    var body: some View {
        Group {
            if isReady {
                SplashScreenView() // Your main content view
            } else {
                Image("logo4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 300)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isReady = true
                        }
                    }
            }
        }
    }
}

