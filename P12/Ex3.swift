import Foundation

// Ejercicio 3a

protocol P {
   var p: Int { get }
}
class A1: P {
   var p = 0
   var a1 = 0
}
class A2: P {
   var p = 1
   var a2 = 0
}

var array: [P] = [A1(), A2()]
for i in array {

    // Código a completar
    //
    if let tonto =  i as? A1 {
        print("p: \(tonto.p), a1: \(tonto.a1)")
    }
    if let tapu =  i as? A2 {
        print("p: \(tapu.p), a2: \(tapu.a2)")
    }
}

// debe imprimir:
// debe imprimir:
// p: 0, a1: 0
// p: 1, a2: 0


// Ejercicio 3b

protocol TieneVelocidad {
    func velocidadActual () -> Double
}

class Vehiculo {
    var velocidad = 0.0
    func velocidadActual() -> Double {
        return velocidad
    }
}

class Tren {
    static let velocidadEnMarcha = 300.0
    var pasajeros = 0
    var enMarcha = false
}

//
// Código a completar
//
extension Vehiculo:TieneVelocidad {
    
}

extension Tren:TieneVelocidad {
    func velocidadActual() -> Double {
        return Tren.velocidadEnMarcha
    }
}

var vehiculo1 = Vehiculo()
var tren1 = Tren()
tren1.enMarcha = true

let transportes: [TieneVelocidad] = [vehiculo1, tren1]

for i in transportes {
    print(i.velocidadActual())
}
// 0.0
// 300.0
