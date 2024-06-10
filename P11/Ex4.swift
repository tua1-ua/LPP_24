import Foundation

class Base {
    // Propiedades almacenadas
    var a = 100
    var b = 2
    var c = 10

    // Propiedad calculada
    var x: Int {a+b}

    // Método de instancia
    func suma() -> Int {
        return a+b
    }

    // Propiedad del tipo
    static var valor = 0

    // Método del tipo
    static func incrementa() -> Int {
        valor += 1
        return valor
    }
}

class Derivada: Base {
    // No podemos sobreescribir el valor de una propiedad almacenada
    // override var a = 200
    // Pero sí que podemos sobreescribir el getter y el setter
    override var a: Int {
        get {
            super.a + 1000
        }
        set(nuevoValor) {
            print("Actualizando valor de a con : \(nuevoValor)")
            super.a = nuevoValor
        }
    }

    // Sí que podemos añadir un observador en la clase derivada
    override var c: Int {
        willSet(nuevoValor) {
            print("Se va a cambiar el valor de c: \(nuevoValor)")
        }
    }

    // Sí que podemos sobreescribir el getter de una 
    // propiedad calculada y añadirle un setter
    override var x: Int {
        get {a*b}
        set(nuevoValor) {
            a = nuevoValor
            b = nuevoValor
        }
    }

    // Sobreescribimos el método de instancia
    // y dentrol llamamos al método de la clase padre
    override func suma() -> Int {
        let suma = super.suma()
        return suma + 1000
    }
}


var d = Derivada()
print(d.a) // Se ejecuta getter clase derivada - Imprime 1100 (super.a + 1000)
d.a = 400  // Se ejecuta setter clase derivada - Guarda 400 en super.a e imprime mensaje
print(d.a) // Imprime 1400 (super.a + 1000)
print(d.x) // Se ejecuta getter clase derivada de la propiedad calculada x - Imprime 2800 (a*b)
d.x = 0    // Se ejecuta setter clase derivada de la propiedad calculada x - Actualiza con el valor 0 a y b
print(d.a) // Imprime 1000
print(d.b) // Imprime 0
d.c = 10   // Se ejecuta el observador de la propiedad c de clase derivada -
           // Imprime "Se va a cambiar el valor de c a 10"

// Accedemos a la propiedad y método estático de la clase
// base en la clase derivada

print(Derivada.valor) // Imprime 0
print(Derivada.incrementa()) // Imprime 1
print(d.suma()) // Imprime 2000 (a + b + 1000)

/*
Resumen:
- ¿Se puede sobreescribir el valor de una propiedad almacenada? ¿Y calculada?
    Se pueden sobreescribir los getters y setters. Si la propiedad padre es de solo
    lectura, la propiedad sobreescrita puede ser de lectura y escritura. Una propiedad
    padre de lectura-escritura no se puede sobreescribir con una de sólo lectura.
    Se puede comprobar en las variables 'a' y 'x' de la clase derivada.
- ¿Se puede añadir un observador a una propiedad de la clase base en una clase derivada?
    Sí. Lo hemos hecho en la variable 'c' de la clase derivada.
- ¿Hereda la clase derivada propiedades y métodos estáticos de la clase base?
    Sí. Lo hemos comprobado accediendo a valor e incrementa() en la clase derivada
- ¿Cómo se puede llamar a la implementación de un método de la clase base en una sobreescritura 
   de ese mismo método en la clase derivada?
    Usando 'super'. Lo hemos hecho en el método 'suma()' de la clase derivada.
*/