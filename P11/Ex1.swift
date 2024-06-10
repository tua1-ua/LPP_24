import Foundation

// Ejercicio 1a

struct MiEstructura {
    var x = 0
}

class MiClase {
    var x = 0
}

func foo(_ c: MiClase, _ x: Int) {
    c.x = x
}

var s1 = MiEstructura() // Lo he cambiado por var
var s2 = s1
let c1 = MiClase()
var c2 = c1

s1.x = 10 // No podemos modificarlo si s1 es let, porque las estruct no se pueden asignar después de la instanciación
c1.x = 10 
print ("s2.x: \(s2.x), c2.x: \(c2.x)")

foo(c1, 20) 
print("c1.x, después de llamar a la función: \(c1.x)")


// Ejercicio 1b

struct Coord {
    var x: Double
    var y: Double

    func movida(incX: Double, incY: Double) -> Coord {
        return Coord(x: x+incX, y: y+incY)
    }

    mutating func mueve(incX: Double, incY: Double) {
        x = x + incX
        y = y + incY
    }
}

struct Cuadrado {
    var esquina = Coord(x: 0.0, y: 0.0)
    var lado: Double

    func movido1(incX: Double, incY: Double) -> Cuadrado {
        return Cuadrado(esquina: self.esquina.movida(incX: incX, incY:incY), lado:self.lado)
    }

    func movido2(incX: Double, incY: Double) -> Cuadrado {
        var cuadrado = self
        cuadrado.esquina.mueve(incX: incX, incY: incY)
        return cuadrado
    }

    mutating func mueve(incX:Double, incY: Double) {
        esquina.mueve(incX: incX, incY: incY)
    }

    // Añade un método mutador mueve
}

print("""
La versión 1 crea un nuevo cuadrado en el que usa como esquina una esquina nueva 
que devuelve el método "movida" aplicado sobre la esquina actual.
La versión 2 crea también un nuevo cuadrado (al hacer la asignación se hace una
copia) y después llama al método mutador "mueve".
La función mueve, es una función mutadora que mueve el propio cuadrado
""")

let cuad1 = Cuadrado(esquina: Coord(x: 0, y: 0), lado: 10.0)
print("Cuadrado original: \(cuad1)")
print("Cuadrado movido (versión 1): \(cuad1.movido1(incX: 100, incY: 50))")
print("Cuadrado movido (versión 2): \(cuad1.movido2(incX: 100, incY: 50))")
var cuad2 = cuad1
cuad2.mueve(incX: 100, incY: 50)
print("Cuadrado movido (versión 3): \(cuad2)")



func foo(palabra: String, longitud: Int) -> Bool {
    if palabra.count >= longitud {
        return true
    }
    else {
        return false
    } 
}

class MisPalabras {
    var guardadas: [String] = []
    func guarda(_ palabra: String) {
        guardadas.append(palabra)
    }
    var x : [Bool] {
        get {
            return guardadas.map {foo(palabra: $0,longitud: 4)}
        }
    } 
}

let palabras = MisPalabras()
palabras.guarda("Ana")
palabras.guarda("Pascual")
palabras.guarda("María")
print(palabras.x)

// Devuelve una array de booleanos, donde mira si la longitud de la palabra es o no mayor/igual que 4


