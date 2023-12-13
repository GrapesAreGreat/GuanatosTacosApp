import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                FoodGridView() // The grid displaying food items

                Spacer() // Pushes everything to the top

                // The "Order" button
                NavigationLink(destination: WebView(urlString: "https://guanatostacos.brinkposmobile.net/order").edgesIgnoringSafeArea(.all)) {
                    Text("Order Online")
                        .font(.headline)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom, 50) // Adds padding at the bottom
            }
            .navigationBarTitle("Guanatos Tacos", displayMode: .inline)
        }
    }
}
