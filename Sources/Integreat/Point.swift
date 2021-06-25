//
//  Point.swift
//  
//
//  Created by Malcolm Anderson on 6/25/21.
//

public struct Point: CustomStringConvertible {
    var x: Double = 0.0
    var y: Double = 0.0
    
    public var description: String {
        "(\(x), \(y))"
    }
    
    public init(_ x: Double = 0.0, _ y: Double = 0.0) { self.x = x; self.y = y }
}
