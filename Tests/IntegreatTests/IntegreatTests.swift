    import XCTest
    @testable import Integreat

    final class IntegreatTests: XCTestCase {        
        func testSingleIntegrator() {
            let integrator = SingleIntegrator()
            
            var output: Double
            
            output = integrator.append(Point(1, 1)) // +0.5 = 0.5
            XCTAssertEqual(output, 0.5)
            
            output = integrator.append(Point(2, 1)) // +1 = 1.5
            XCTAssertEqual(output, 1.5)
            
            output = integrator.append(Point(3, 4)) // +2.5 = 4.0
            XCTAssertEqual(output, 4.0)
            
            output = integrator.append(Point(5, 10)) // +14 = 18
            XCTAssertEqual(output, 18)
            
            output = integrator.append(Point(10, 2)) // +30 = 48
            XCTAssertEqual(output, 48)
            
            output = integrator.append(Point(12, 0)) // +2 = 50
            XCTAssertEqual(output, 50)
            
            output = integrator.append(Point(14, -2)) // -2 = 48
            XCTAssertEqual(output, 48)
            
            output = integrator.append(Point(18, -2)) // -8 = 40
            XCTAssertEqual(output, 40)
            
            output = integrator.append(Point(22, 2)) // -2 + 2 = 40
            XCTAssertEqual(output, 40)
            
            output = integrator.append(Point(30, -6)) // +2 - 18 = 24
            XCTAssertEqual(output, 24)
            
            output = integrator.append(Point(34, 8)) // -5.1428 + 9.1428 = 28
            XCTAssertEqual(output, 28)
        }
    }
