import CoreGraphics
import Foundation

final class ControlPointUtilities {
    /// Calculates the controlPoint
    /// - Parameter radiusMultiplier: Defines the curve shape. Default value: 1.0.
    /// - Returns: CGPoint: The control point
    func controlPoint(_ origin: CGPoint,
                      _ destination: CGPoint,
                      radiusMultiplier: CGFloat = 1) -> CGPoint {
        let centerPoint = center(origin, destination)
        let radius = (distance(origin, destination) / 2) * radiusMultiplier
        let inclination = lineInclination(origin: origin, destination: destination)
        return pointOnCircle(center: centerPoint, radius: radius, angle: rad(inclination - 90))
    }

    /// Calculates the center between points
    /// - Returns: CGPoint: The center between the 2 points
    private func center(_ origin: CGPoint, _ destination: CGPoint) -> CGPoint {
        return CGPoint(x: (origin.x + destination.x) / 2,
                       y: (origin.y + destination.y) / 2)
    }

    /// Calculates the line inclination compared to X axis
    /// - Returns: CGFloat: Line inclination in degrees
    private func lineInclination(origin: CGPoint, destination: CGPoint) -> CGFloat {
        let slope = (destination.y - origin.y) / (destination.x - origin.x)
        let tetha = atan(slope)
        return tetha * CGFloat(180 / Double.pi)
    }

    private func distance(_ origin: CGPoint, _ destination: CGPoint) -> CGFloat {
        let xDist = origin.x - destination.x
        let yDist = origin.y - destination.y
        return CGFloat(sqrt(xDist * xDist + yDist * yDist))
    }

    /// Calculates the point on circle at a specific angle
    /// - Parameter center: the circle's center
    /// - Parameter radius: the circle radius
    /// - Parameter angle: the angle, in radians
    /// - Returns: CGPoint: The point on circle at a specific angle
    private func pointOnCircle(center: CGPoint,
                               radius: CGFloat,
                               angle: CGFloat) -> CGPoint {
        // swiftlint:disable identifier_name
        let x = center.x + radius * cos(angle)
        let y = center.y + radius * sin(angle)
        // swiftlint:enable identifier_name
        return CGPoint(x: x, y: y)
    }

    /// Converts degrees to radians
    private func rad(_ degrees: CGFloat) -> CGFloat {
        return degrees * .pi / 180
    }
}
