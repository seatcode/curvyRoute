import Foundation
import MapKit

public class MapLineOverlayRenderer: MKOverlayPathRenderer {
    private let lineOverlay: LineOverlay

    public init(_ lineOverlay: LineOverlay) {
        self.lineOverlay = lineOverlay
        super.init(overlay: lineOverlay)
        self.lineWidth = lineOverlay.style.lineWidth
        self.strokeColor = lineOverlay.style.strokeColor
        self.alpha = lineOverlay.style.alpha
        invalidatePath()
    }

    public override func createPath() {
        guard let originCoordinate = lineOverlay.coordinates.first,
            let destinationCoordinate = lineOverlay.coordinates.last else { return }
        let origin = point(for: MKMapPoint(originCoordinate))
        let destination = point(for: MKMapPoint(destinationCoordinate))
        self.path = lineOverlay.path(origin, destination)
        lineOverlay.boundsMapRect = mapRect(for: self.path.boundingBox)
    }
}
