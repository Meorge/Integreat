/*
 Integreat
 June 2021
 by Malcolm Anderson
 */

/**
 Integrates discrete `Double` values as they are generated, and provides the total sum so far.
 */
public class SingleIntegrator {
    /// The last `Point` sent to this integrator.
    public private(set) var last: Point = Point(0,0)
    
    /// The current sum of this integrator.
    public private(set) var sum: Double = 0.0
    
    /// The number of points that have been added to this integrator.
    public private(set) var count: Int = 0
    
    /// The average value entered into this integrator.
    public var mean: Double {
        self.sum / Double(self.count)
    }

    public init() {}
    
    /**
     Appends a `Point` with the given `x` and `y` values to this integrator,
     and returns the new sum.
     
     This is a convenience function for `append(point:)`; it simply creates a `Point`
     structure and runs the function on it.
     
     - Parameter x: The X coordinate of the new point to append.
     - Parameter y: The Y coordinate of the new point to append.
     - Returns: The integrator's sum after this point has been appended.
     */
    public func append(_ x: Double, _ y: Double) -> Double {
        return append(Point(x,y))
    }
    
    /**
     Appends the given `Point` to this integrator, and returns the new sum.
     
     - Parameter point: The point to append.
     - Returns: The integrator's sum after this point has been appended.
     */
    public func append(_ point: Point) -> Double {
        let xDelta = point.x - self.last.x
        
        let minY = min(self.last.y, point.y)
        let maxY = max(self.last.y, point.y)
        
        // Height of rectangle should be the smaller of the two y values
        let rectangle = Rectangle(width: xDelta, height: minY)
        
        // Height of triangle is height of higher point minus rectangle height
        let triangle = Triangle(width: xDelta, height: maxY - minY)
        
        self.sum += rectangle.area + triangle.area
        self.last = point
        self.count += 1
        
        return sum
    }
}
