import Foundation

func construye(operador: Character) -> (Int, Int) -> Int {
    switch operador {
        case "*":
            return {$0 * $1}
        case "+":
            return {$0 + $1}
        case "-":
            return {$0 - $1}
        default:
            return {$0 / $1}
    }
}


var f = construye(operador: "+")
print(f(2,3))
// Imprime 5
f = construye(operador: "-")
print(f(2,3))
// Imprime -1
