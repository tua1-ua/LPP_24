// Ejercicio 2a
func prefijos(prefijo:String, palabras:[String]) -> [Bool] {
    if palabras.isEmpty {
        return []
    }
    else {
        let primero = [palabras[0].hasPrefix(prefijo)]
        let rest = Array(palabras.dropFirst())
        let recurs: [Bool] = prefijos(prefijo:prefijo, palabras:rest)
        return primero + recurs
    }
}



let array = ["anterior", "antígona", "antena"]
let prefijo = "ante"
print("\n******\n2a) Función prefijos(prefijo:palabras:)\n******")
print(prefijos(prefijo: prefijo, palabras: array))
// Imprime: [true, false, true]


// Ejercicio 2b
func parejaMayorParImpar(numeros:[Int]) ->(Int, Int) {
    /* var mayor_impar = 0
    var mayor_par = 0
    for num in numeros {
        if num % 2 == 0 {
            if num > mayor_par {
                mayor_par = num
            }
        }
        else {
            if num > mayor_impar {
                mayor_impar = num
            }
        }
    }
    return (mayor_impar, mayor_par) */
    if numeros.isEmpty {
        return (0, 0)
    }
    let primero = numeros[0]
    let rest = Array(numeros.dropFirst())
    let recurs = parejaMayorParImpar(numeros: rest)
    if primero % 2 == 0 {
        let mayorPar = max(primero, recurs.1)
        return ( recurs.0, mayorPar)
    }
    else {
        let mayorImpar = max(primero, recurs.0)
        return ( mayorImpar, recurs.1)
    }
    
}

let numeros = [10, 201, 12, 103, 204, 2]
print("\n******\n2b) Función parejaMayorParImpar(numeros:)\n******")
print(parejaMayorParImpar(numeros: numeros))
// Imprime: (201, 204)