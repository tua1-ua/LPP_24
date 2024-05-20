// Ejercicio 3a
func compruebaParejas(_ array:[Int], funcion: (Int) -> Int) -> [(Int, Int)] {
    if array.count <= 1 {
        return []
    }

    let primero = array[0]
    let segundo = array[1]
    let rest = Array(array.dropFirst())
    if funcion(primero) == segundo {
        return [(primero, segundo)] + compruebaParejas( rest, funcion: funcion)
    }
    else {
        return compruebaParejas(rest, funcion: funcion)
    }

}


func cuadrado(x: Int) -> Int {
   return x * x
}
print(compruebaParejas([2, 4, 16, 5, 10, 100, 105], funcion: cuadrado))
// Imprime [(2,4), (4,16), (10,100)]


// Ejercicio 3b

func coinciden(parejas: [(Int,Int)], funcion: (Int)->Int) -> [Bool] {
    /* var res : [Bool] = []
    for par in parejas {
        let primero = par.0
        let segundo = par.1
        if funcion(primero) == segundo {
            res.append(true)
        }
        else {
            res.append(false)
        }
    }
    return res */

    if parejas.isEmpty {
        return []
    }
    else {
        let primer_pareja = parejas[0]
        let rest = Array(parejas.dropFirst())
        if funcion(primer_pareja.0) == primer_pareja.1 {
            return [true] + coinciden(parejas:rest, funcion:funcion)
        }
        else {
            return [false] + coinciden(parejas:rest, funcion:funcion)
        }
    }
}

let array = [(2,4), (4,14), (4,16), (5,25), (10,100)]
print(coinciden(parejas: array, funcion: cuadrado))
// Imprime: [true, false, true, true, true]

