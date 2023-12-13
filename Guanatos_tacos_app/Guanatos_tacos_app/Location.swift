import CoreLocation

// Define the Location struct
struct Location: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D

    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// Define an array of locations
let locations = [
    Location(name: "Canyon Country", address: "21525 Soledad Canyon Road, Santa Clarita, CA", coordinate: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)),
    Location(name: "Sylmar", address: "15963 Yarnell Street, Sylmar, CA", coordinate: CLLocationCoordinate2D(latitude: 34.32223, longitude: 118.47943)),
    Location(name: "Panorama City", address: "8401 Van Nuys Blvd., Panorama City", coordinate: CLLocationCoordinate2D(latitude: 34.22329, longitude: 118.44922)),
    Location(name: "La Verne", address: "2855 Foothill Blvd La Verne CA 91750", coordinate: CLLocationCoordinate2D(latitude: 34.10992, longitude: 117.75384))
]
