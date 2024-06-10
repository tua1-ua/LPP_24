import Foundation
/*
==============================
Ejercicio 5: carrera de coches
==============================
*/

enum MarcaCoche: Int {
   case Mercedes=0, Ferrari, RedBull, McLaren

    static func random() -> MarcaCoche {
        let maxValue = McLaren.rawValue

        let r = Int.random(in: 0...maxValue)
        return MarcaCoche(rawValue: r)!
    }
}

enum TipoCambio: Int {
    case automatico=0, manual

    static func random() -> TipoCambio {
        let maxValue = manual.rawValue

        let r = Int.random(in: 0...maxValue)
        return TipoCambio(rawValue: r)!
    }
}

class Coche {
    var velocidadActual = 0.0
    var distanciaRecorrida = 0.0
    var marcha = 1
    static let velocidadMaxima = 150.0
    static let marchasMaxima = 6
    var marca : MarcaCoche

    init(marca: MarcaCoche) {
        self.marca = marca
    }
    var descripcion: String {
        return "\(marca)"
    }
    func seguimientoCarrera() {
        print("\(descripcion) viajando a \(velocidadActual) kilómetros por hora con la marcha \(marcha)")
        distanciaRecorrida += velocidadActual
    }
    func actualizaVelocidad() {}
}

class CocheAutomatico: Coche {
    override var velocidadActual: Double {
        didSet {
            marcha = min(Int(velocidadActual / 25.0) + 1, Coche.marchasMaxima)
            seguimientoCarrera()
        }
    }
    override var descripcion: String {
        return super.descripcion + " automatico"
    }
    override func actualizaVelocidad() {
      velocidadActual = Double(Int.random(in: 1...Int(Coche.velocidadMaxima)))
    }
}

class CocheManual: Coche {
    override var marcha: Int {
        didSet {
            velocidadActual = 25.0 * Double(marcha)
            seguimientoCarrera()
        }
    }
    override var descripcion: String {
        return super.descripcion + " manual"
    }
    override func actualizaVelocidad() {
       marcha = Int.random(in: 1...Coche.marchasMaxima)
    }
}

class Carrera {
    var coches: [Coche] = []
    let numCoches: Int
    let tiempoFinal : Int
    var tiempoActual: Int = 0 {
        didSet {
            print("\nHoras transcurridas \(tiempoActual)")
        }
    }

    init(numCoches: Int, horas:Int) {
        self.numCoches = numCoches
        tiempoFinal = horas
        for _ in 0..<numCoches {
            switch TipoCambio.random() {
            case .automatico :
                coches.append(CocheAutomatico(marca: MarcaCoche.random()))
            case .manual :
                coches.append(CocheManual(marca: MarcaCoche.random()))
            }
        }
    }

    func empezar() {
        for t in 1...tiempoFinal {
            tiempoActual = t
            for coche in coches {
               coche.actualizaVelocidad()
            }
        }
    }

    func clasificacion() {
        let clasif = coches.sorted(by: {$0.distanciaRecorrida > $1.distanciaRecorrida})
        var i = 1
        for coche in clasif {
            print("\(i). \(coche.descripcion) (\(coche.distanciaRecorrida) kilómetros recorridos)")
            i+=1
        }
    }

    func descripcion() {
        print("\(numCoches) coches con una duración de \(tiempoFinal) horas")
        for coche in coches {
            print("    \(coche.descripcion)")
        }
    }

}


// DEMOSTRACIÓN

print("""
---
Ejercicio 5
---\n
""")

let carrera = Carrera(numCoches: 2, horas: 3)
print("\nDescripción de la carrera:")
carrera.descripcion()
print("\n!!! Comienza la carrera !!!")
carrera.empezar()
print("\n!!! Clasificación !!!")
carrera.clasificacion()
