import SwiftUI

struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct FoodGridView: View {
    // Adjust the number of columns as per your design requirement
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1) // Change the count to 2 for 2 columns
    
    let foodItems: [FoodItem] = [
        // Initialize your food items here
        // Make sure image names match with the assets
        FoodItem(name: "Tacos", imageName: "tacos"),
        FoodItem(name: "Burritos", imageName: "Burrito"),
        FoodItem(name: "Guanatos Fries", imageName: "fries"),
        FoodItem(name: "Birria Ramen", imageName: "birriaRamen"),
        FoodItem(name: "Quesadillas", imageName: "quesadilla"),
        FoodItem(name: "Quesabirrias", imageName: "quesabirria"),
        FoodItem(name: "Guanatos Tacos", imageName: "guanatostaco"),
        FoodItem(name: "Fresh Tortillas", imageName: "tortilla"),
        FoodItem(name: "Shrimp options", imageName: "shrimp"),
        FoodItem(name: "$1 Dollar Taco Tuesday", imageName: "dollar"),
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(foodItems) { item in
                        VStack {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 500, height: 500) // Adjust the frame
                                .clipped()
                                .cornerRadius(8)

                            Text(item.name)
                                .font(.caption)
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Menu", displayMode: .inline)
        }
    }
}
