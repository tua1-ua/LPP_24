import Foundation


struct Timer {
    var segundos:Int
    static var pasosTotales:Int = 0

    init(segundos:Int) {
        self.segundos = segundos
    }
    mutating func paso() {
        segundos -= 1
        Timer.pasosTotales+=1
    }

    static func + (izq:Timer, der:Timer) -> Timer {
        return Timer(segundos: izq.segundos + der.segundos)
    }
}


var t1 = Timer(segundos: 10)
var t2 = Timer(segundos: 5)
for _ in 0...4 {
    t1.paso()
}
for _ in 0...2 {
    t2.paso()
}
var t3 = t1 + t2
t3.paso()
print("Segundos del temporizador 1: \(t1.segundos)")
print("Segundos del temporizador 2: \(t2.segundos)")
print("Segundos del temporizador 3: \(t3.segundos)")
print("Pasos totales: \(Timer.pasosTotales)")
// Imprime:
// Segundos del temporizador 1: 5
// Segundos del temporizador 2: 2
// Segundos del temporizador 3: 6
// Pasos totales: 9
