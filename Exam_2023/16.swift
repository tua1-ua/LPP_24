import Foundation

struct Intervalo<T:Comparable> {
    var minimo: T
    var maximo: T
    func contiene(_ valor:T)-> Bool {
        return valor >= minimo && valor <= maximo
    }
}

let intervaloEnteros = Intervalo(minimo: 0, maximo: 10)
let intervaloCadenas = Intervalo(minimo: "a", maximo: "z")
let contieneEntero = intervaloEnteros.contiene(4)
print(contieneEntero)
let contieneCadena = intervaloCadenas.contiene("A")
print(contieneCadena)