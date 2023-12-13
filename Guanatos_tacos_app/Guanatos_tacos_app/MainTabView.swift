import SwiftUI
import CoreLocation

struct MainTabView: View {
    @State private var showInstagram = false
    var instagramURL = URL(string: "https://www.instagram.com/")!
    // Sample array of locations - replace with your actual data
    let locations = [
        Location(name: "Canyon Country", address: "21525 Soledad Canyon Road, Santa Clarita, CA", coordinate: CLLocationCoordinate2D(latitude: 34.41673, longitude: -118.51291)),
        Location(name: "Sylmar", address: "15963 Yarnell Street, Sylmar, CA", coordinate: CLLocationCoordinate2D(latitude: 34.32223, longitude: -118.47943)),
        Location(name: "Panorama City", address: "8401 Van Nuys Blvd., Panorama City", coordinate: CLLocationCoordinate2D(latitude: 34.22329, longitude: -118.44922)),
        Location(name: "La Verne", address: "2855 Foothill Blvd La Verne CA 91750", coordinate: CLLocationCoordinate2D(latitude: 34.10992, longitude: -117.75384))
        // ... more locations ...
    ]

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            // Now we pass the locations array to the LocationsView
            LocationsView(locations: locations)
                .tabItem {
                    Label("Locations", systemImage: "mappin.and.ellipse")
                }
            
            // Instagram button is now a TabView item
                        Button(action: {
                            showInstagram = true
                        }) {
                            Image(systemName: "camera.fill")
                            Text("Instagram")
                        }
                        .tabItem {
                            Label("Instagram", systemImage: "camera.fill")
                        }
                        .sheet(isPresented: $showInstagram) { // Sheet to present Instagram
                            // Your InstagramView goes here
                            // Make sure you replace the URL string with the actual URL of your Instagram page
                            InstagramView(url: URL(string: "https://www.instagram.com/guanatos_tacos/")!)
                        }
            
//            NavigationLink(destination: WebView(urlString: "https://guanatostacos.brinkposmobile.net/").edgesIgnoringSafeArea(.all)) {
//                            Label("Menu", systemImage: "list.bullet")
//                        }
            MenuView()
                        .tabItem {
                            Label("Menu", systemImage: "list.bullet")
                        }

            
        }
    }
}
