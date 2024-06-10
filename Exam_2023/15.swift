import Foundation

class Vehiculo {
    var velocidad = 0.0
    func hazSonido() {
        print("Sonido genérico")
    }
    init(velocidad:Double) {
        self.velocidad = velocidad
    }

    static func xd() {
        print("I hate you")
    }
}

class CocheElectrico:Vehiculo {
    var nivelBateria = 0.0
    init(velocidad:Double, nivelBateria:Double) {
        self.nivelBateria = nivelBateria
        super.init(velocidad: velocidad)
    }

    override func hazSonido() {
        print("Zoooom")
    }
}

let vehiculos = [Vehiculo(velocidad: 50.0), CocheElectrico(velocidad: 50.0, nivelBateria: 100.0)]
for vehiculo in vehiculos { vehiculo.hazSonido() }

CocheElectrico.xd()

