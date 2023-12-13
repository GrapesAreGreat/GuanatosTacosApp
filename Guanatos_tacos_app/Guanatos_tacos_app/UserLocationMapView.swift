import SwiftUI
import MapKit

struct UserLocationMapView: UIViewRepresentable {
    var locations: [Location]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateAnnotations(from: uiView)
    }

    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = locations.map { location -> MKAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = location.name
            annotation.coordinate = location.coordinate
            return annotation
        }
        mapView.addAnnotations(annotations)
    }
}
 
