import Foundation
import MapKit

public struct LineOverlayStyle {
    var strokeColor: UIColor
    var lineWidth: CGFloat
    var alpha: CGFloat

    public init(strokeColor: UIColor, lineWidth: CGFloat, alpha: CGFloat) {
        self.strokeColor = strokeColor
        self.lineWidth = lineWidth
        self.alpha = alpha
    }
}

public protocol LineOverlaying {
    var coordinates: [CLLocationCoordinate2D] { get }
    var style: LineOverlayStyle { get }
    func path(_ origin: CGPoint, _ destination: CGPoint) -> CGMutablePath
    var boundsMapRect: MKMapRect { get set }
}

public class LineOverlay: MKPolyline, LineOverlaying {
    public private(set) var coordinates: [CLLocationCoordinate2D] = []
    public private(set) var style = LineOverlayStyle(strokeColor: .black,
                                                     lineWidth: 3,
                                                     alpha: 0.15)
    public var boundsMapRect: MKMapRect = .world
    public override var boundingMapRect: MKMapRect {
        return boundsMapRect
    }

    public convenience init(origin: CLLocationCoordinate2D, destination: CLLocationCoordinate2D, style: LineOverlayStyle? = nil) {
        self.init(coordinates: [origin, destination], count: 2)
        coordinates = [origin, destination]
        if let style = style {
            self.style = style
        }
    }

    public func path(_ origin: CGPoint, _ destination: CGPoint) -> CGMutablePath {
        let path = CGMutablePath()
        path.move(to: origin)
        path.addLine(to: destination)
        return path
    }
}

public class ArcOverlay: LineOverlay {
    public var radiusFactor: CGFloat = 1.0

    public override func path(_ origin: CGPoint, _ destination: CGPoint) -> CGMutablePath {
        let path = CGMutablePath()
        path.move(to: origin)
        let utils = ControlPointUtilities()
        let controlPoint = utils.controlPoint(origin, destination, radiusFactor: radiusFactor)
        path.addQuadCurve(to: destination, control: controlPoint)
        return path
    }
}
