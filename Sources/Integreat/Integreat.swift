public class Integrator {
    static func integrate(_ values: [Point], times: Int = 1) -> Double {
        
        var values: [Point] = values
        
        for _ in 0..<times {
            var nextValues: [Point] = []
            
            for (index, thisPoint) in values[0..<values.count - 1].enumerated() {
                let nextPoint = values[index + 1]
                
                let xDelta = nextPoint.x - thisPoint.x
                
                let rectangle: Rectangle
                let triangle: Triangle
                
                /*
                 Next point is higher than the current point.
                 We'll need a rectangle that's as high as the current point,
                 and then a triangle that slopes upward from the current point
                 to the next point.
                 */
                if thisPoint.y < nextPoint.y {
                    rectangle = Rectangle(width: xDelta, height: thisPoint.y)
                    triangle = Triangle(width: xDelta, height: nextPoint.y - thisPoint.y)
                }
                
                
                /*
                 Next point is lower than the current point.
                 We'll need a rectangle that's as high as the next point,
                 and then a triangle that slopes downward from the current point
                 to the next point.
                 */
                else if thisPoint.y > nextPoint.y {
                    rectangle = Rectangle(width: xDelta, height: nextPoint.y)
                    triangle = Triangle(width: xDelta, height: thisPoint.y - nextPoint.y)
                }
                
                /*
                 The current and next points are at the same height.
                 Thus, we don't need a triangle, only the rectangle that stretches
                 between the two points.
                 */
                else {
                    rectangle = Rectangle(width: xDelta, height: thisPoint.y)
                    triangle = Triangle()
                }
                
                // Area underneath this part of the curve is the rectangle area plus
                // the triangle area.
                let totalArea = rectangle.area + triangle.area
                
                // Let's decide what X value this chunk corresponds to in the integral data.
                let newX = (thisPoint.x + nextPoint.x) / 2
                
                nextValues.append(Point(newX, totalArea))
            }
            
            values = nextValues
            print("Integration done: \(values)")
        }
        
        // Sum up all of the values to get our final answer
        return values.reduce(0.0) { soFar, point in
            soFar + point.y
        }
    }
}
