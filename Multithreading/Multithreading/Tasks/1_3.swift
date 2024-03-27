//
//  1_3.swift
//  Multithreading
//Принцип подстановки Барбары Лисков


import Foundation

protocol AreaCalculatable {
  func areaOf() -> Double
  func returnSize() -> (width: CGFloat, height: CGFloat)
}

struct Circle: AreaCalculatable {
    
    let radius: CGFloat
    
    func areaOf() -> Double {
        3.14 * radius * radius
    }
    
    func returnSize() -> (width: CGFloat, height: CGFloat) {
        (radius, radius)
    }
}

struct Rectangle: AreaCalculatable {
    
    let width: CGFloat
    let height: CGFloat
    
    func areaOf() -> Double {
        width * height
    }
    
    func returnSize() -> (width: CGFloat, height: CGFloat) {
        (width, height)
    }
}

class SizePrinter {
    
    func printSize(of figure: AreaCalculatable) {
        let size = figure.returnSize()
        print(size)
    }
}
