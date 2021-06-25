    import XCTest
    @testable import Integreat

    final class IntegreatTests: XCTestCase {
        func testIntegrationLinear() {
            func function(_ x: Double) -> Double {
                return 0.4 * x + 2
            }
            
            var data: [Point] = []
            for x in 0...10 {
                let x = Double(x)
                let y = function(Double(x))
                data.append(Point(x, y))
            }
            
            print(Integrator.integrate(data))
        }
        
        func testIntegrationParabola() {
            // This is approximately -0.05x^2 + 5 from 0 to 7,
            // approximately 29.28
            func function(_ x: Double) -> Double {
                return -0.05 * x * x + 5
            }
            
            var data: [Point] = []
            for x in 0...8 {
                let x = Double(x)
                let y = function(Double(x))
                data.append(Point(x, y))
            }
            
            print(Integrator.integrate(data))
        }
    }
