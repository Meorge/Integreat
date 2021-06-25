//
//  Shapes.swift
//  
//
//  Created by Malcolm Anderson on 6/25/21.
//

protocol Shape {
    var width: Double { get set }
    var height: Double { get set }
    var area: Double { get }
}

struct Rectangle: Shape {
    var width: Double = 0.0
    var height: Double = 0.0
    
    var area: Double {
        width * height
    }
}

struct Triangle: Shape {
    var width: Double = 0.0
    var height: Double = 0.0
    
    var area: Double {
        0.5 * width * height
    }
}
