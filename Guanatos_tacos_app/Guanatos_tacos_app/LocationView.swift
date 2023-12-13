import SwiftUI
import CoreLocation

struct LocationsView: View {
    var locations: [Location]
    @State private var selectedLocation: Location?
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        NavigationView {
            VStack {
                Picker("Select Location", selection: $selectedLocation) {
                    ForEach(orderLocationsByDistance()) { location in
                        Text(location.name).tag(location as Location?)
                    }
                }
                .pickerStyle(MenuPickerStyle())

                UserLocationMapView(locations: locations)

            }
            .navigationBarTitle("Locations", displayMode: .inline)
        }
    }

    func orderLocationsByDistance() -> [Location] {
        guard let currentLocation = locationManager.lastLocation else {
            return locations
        }
        return locations.sorted {
            currentLocation.distance(from: CLLocation(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)) <
            currentLocation.distance(from: CLLocation(latitude: $1.coordinate.latitude, longitude: $1.coordinate.longitude))
        }
    }
}
