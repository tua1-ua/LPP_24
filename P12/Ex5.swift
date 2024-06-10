import Foundation

/*
===========
Ejercicio 5
===========
*/


print("""
\n---
Ejercicio 5
---\n
""")

struct Punto {
    var x = 0.0, y = 0.0
}

struct Tamaño {
    var ancho = 0.0, alto = 0.0
}

protocol Figura {
    var centro: Punto {get set}
    var area: Double {get}
    var tamaño: Tamaño {get}
    func descripcion() -> String
}

struct Circulo: Figura {
    var centro = Punto()
    var radio = 0.0
    
    var area: Double {
        get {
            return Double.pi * radio * radio
        }
        set {
            radio = sqrt(newValue / Double.pi)
        }
    }
    var tamaño: Tamaño {
        let diametro = radio * 2
        return Tamaño(ancho: diametro, alto: diametro)
    }

    func descripcion() -> String {
        return "Centro: \(centro) y área: \(area)"
    }
}

struct Rectangulo: Figura {
    var origen = Punto()
    var tamaño = Tamaño()

    var centro: Punto {
        get {
            let centroX = origen.x + (tamaño.ancho / 2)
            let centroY = origen.y + (tamaño.alto / 2)
            return Punto(x: centroX, y: centroY)
        }
        set {
            origen.x = newValue.x - (tamaño.ancho / 2)
            origen.y = newValue.y - (tamaño.alto / 2)
        }
    }

    var area: Double {
        return tamaño.ancho * tamaño.alto
    }

    func descripcion() -> String {
        return "Centro: \(centro) y área: \(area)"
    }

}

struct AlmacenFiguras {
    var figuras: [Figura] = []

    mutating func añade(figura: Figura) {
        figuras.append(figura)
    }

    var numFiguras: Int {
        return figuras.count
    }

    var areaTotal: Double {
        func areas() -> [Double] {
            return
                figuras.map() {$0.area}
        }
        return areas().reduce(0.0, +)
    }

    func cuentaTipos() -> (Int, Int) {
        var nRect = 0, nCirc = 0
        for fig in figuras {
            switch fig {
                case let rect as Rectangulo:
                    nRect += 1
                    print("** Un rectángulo con tamaño \(rect.tamaño) y descripción:")
                case is Circulo:
                    nCirc += 1
                    print("** Un círculo con descripción:")
                default:
                    print("Tipo de figura desconocida")
            }
            print(fig.descripcion())
        }
        return (nRect, nCirc)
    }
}


let r = Rectangulo(origen:Punto(x:3, y:4), tamaño:Tamaño(ancho:10, alto:5))
let c = Circulo(centro:Punto(x:5, y:0), radio:10.0)
var almacen = AlmacenFiguras()
almacen.añade(figura: r)
almacen.añade(figura: c)
print("Total figuras: \(almacen.cuentaTipos())")