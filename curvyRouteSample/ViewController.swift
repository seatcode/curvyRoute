import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    private let pointA = CLLocationCoordinate2DMake(41.375024, 2.149118) //Plaça d'Espanya, Barcelona
    private let pointB = CLLocationCoordinate2DMake(41.380994, 2.185771) //Plaça Pau Vila, 1, Barcelona
    private let mapCenter = CLLocationCoordinate2DMake(41.379183, 2.168013)

    override func viewDidAppear(_ animated: Bool) {
        mapView.delegate = self
        centerMap(mapCenter)
        addOverlays()
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let lineOverlay = overlay as? LineOverlay {
            return MapLineOverlayRenderer(lineOverlay)
        }
        return MKOverlayRenderer(overlay: overlay)
    }

    private func centerMap(_ location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: location,
                                        span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08))
        mapView.setRegion(region, animated: false)
    }

    private func addOverlays() {
        mapView.addOverlay(LineOverlay(origin: pointA, destination: pointB))
        let arc = ArcOverlay(origin: pointA, destination: pointB,
                             style: LineOverlayStyle(strokeColor: .systemTeal, lineWidth: 4, alpha: 1))
        arc.radiusFactor = 0.5
        mapView.addOverlay(arc)
    }
}
