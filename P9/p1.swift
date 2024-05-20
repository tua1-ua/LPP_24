import Foundation

print("Hello, World!")

func minMax(array: [Int]) -> (min:Int, max: Int) {
    if (array.isEmpty) {
        return (-1,-1)
    }
    else {
        let primero = array[0];
        let rest = Array(array.dropFirst())
        let recurs = minMax(array:rest)
        let min = min (primero, recurs.min)
        let max = max(primero, recurs.max)
        return (min, max)
    }
    
    
}

let limites = minMax(array: [8, -6, 2, 100, 3, 71])
print("El mínimo es \(limites.min) y el máximo es \(limites.max)")
