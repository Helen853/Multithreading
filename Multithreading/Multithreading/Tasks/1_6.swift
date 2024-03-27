//
//  1_6.swift
//  Multithreading
//

import Foundation

class Light {
    
    func turnOn() {
        
    }
    func turnOff() {
        
    }
}

//лампочка - низкий уровень
class LightBulb: Light {
    
    override func turnOn() {
        // включает свет
      //  lamp.on()
    }
    
    override func turnOff() {
        // включает свет
      //  lamp.off()
    }
}

//выключатель - верхний уровень
class Switch {
    let bulb: Light
    
    init(bulb: Light) {
        self.bulb = bulb
    }
    
    func toggle() {
        bulb.turnOn()
    }
}
