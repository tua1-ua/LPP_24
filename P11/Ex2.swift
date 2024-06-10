import Foundation

var x = 10  {
   didSet {
      if (x > 100) {
          x = oldValue
      }
   }
}

var y: Int {
    get {
        return x / 3
    }
    set {
        x = 3 * newValue
    }
}

var z : Int {
   get {
      return x + y
   }
   set {
      x = newValue / 2
      y = newValue / 2
   }
}
z = 60
print("y: \(y)") // 30
print("x: \(x)") // 90
z = 600
print("y: \(y)") // 30
print("x: \(x)") // 90


// Ejercicio 2b

struct Valor {
    var valor: Int = 0 {
        willSet {
            Valor.z += newValue
        }        
        didSet {
            if valor > 10 {
                valor = 10
            }
        }
    }
    static var z = 0
}

var c1 = Valor()
var c2 = Valor()
c1.valor = 20 // Valor.z += 20 y c1.valor = 10
c2.valor = 8 // Valoz.z += 8 y c2.valor= 8
print(c1.valor + c2.valor + Valor.z) // Imprime 46
