import Foundation


// Ejercicio 2a
struct Cuadrado {
    var lado: Double
}

// Completa el código justo a continuación,
// no puedes modificar el código anterior
extension Cuadrado {
    var area : Double {
        return self.lado * self.lado
    }
}

var cuadrado = Cuadrado(lado: 4.0)
print(cuadrado.area) // Imprime: 16.0
cuadrado.lado = 10.0
print(cuadrado.area) // Imprime: 100.0


// Ejercicio 2b

protocol Persona {
    var nombre: String {get}
    func encantada() -> Persona 
    func refrescada() -> Persona 
}

enum Pocion {
    case magica, refrescante, venenosa

    func esBebida(por persona: Persona) -> Persona? {
        switch self {
            case .magica:
                return persona.encantada()
            case .refrescante:
                return persona.refrescada()
            default:
                return nil
        }
    }
}


// Ejercicio 2c

protocol A {
    var valor: Int {get set}
    func foo(a: Int) -> Int
}
protocol B {
    mutating func bar()
}
struct MiStruct: A, B {
    // Completa el código
    var valor:Int
    func foo(a: Int)-> Int {
        return a*a + valor
    }

    mutating func bar() {
        self.valor = 69
    }

}


// Ejercicio 2d

struct Circulo {
    var radio: Double
    // Completa el código
    static func + (izq:Circulo, der:Circulo) -> Circulo {
        return Circulo(radio: izq.radio + der.radio)
    }
}

let c1 = Circulo(radio: 5.0)
let c2 = Circulo(radio: 10.0)
let c3 = c1 + c2
print("El radio de la suma es: \(c3.radio)")
// Imprime: El radio de la suma es: 15.0
