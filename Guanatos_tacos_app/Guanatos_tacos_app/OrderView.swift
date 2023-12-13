

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationLink(destination: WebView(urlString: "https://guanatostacos.brinkposmobile.net/menu").edgesIgnoringSafeArea(.all)) {
            Text("Order")
                .font(.headline)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

#Preview {
    OrderView()
}
