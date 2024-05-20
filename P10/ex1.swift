import Foundation


// Ejercicio 1a
func maxOpt(_ x:Int?, _ y:Int?) -> Int? {
    if let x = x, let y = y {
        return max(x,y)
    }
    else if let x = x {
        return x
    }
    else if let y = y {
        return y
    }
    else {
        return nil
    }
}


let res1 = maxOpt(nil, nil) 
let res2 = maxOpt(10, nil)
let res3 = maxOpt(-10, 30)
print("res1 = \(String(describing: res1))")
print("res2 = \(String(describing: res2))")
print("res3 = \(String(describing: res3))")
// Imprime:
// res1 = nil
// res2 = Optional(10)
// res3 = Optional(30)


// Ejercicio 1b1

func parejaMayorParImpar2(numeros: [Int]) -> (Int?, Int?) {
    /* if numeros.isEmpty {
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
    } */
    if numeros.isEmpty {
        return (nil, nil)
    } 
    else {
        let primero = numeros[0]
        let resto = Array(numeros.dropFirst())
        let recurs = parejaMayorParImpar2(numeros: resto)
        if primero % 2 == 0 {
            return (recurs.0, maxOpt(primero,recurs.1))
        }
        else {
            return ( maxOpt( primero, recurs.0), recurs.1)
        }
    }
}

let numeros = [-10, 202, 12, 100, 204, 2]
print("\n******\n1b1) Función parejaMayorParImpar2(numeros:)\n******")
print(parejaMayorParImpar2(numeros: numeros))
// Imprime:
// parejaMayorParImpar2(numeros: [-10, 202, 12, 100, 204, 2])
// (nil, Optional(204))


// Ejercicio 1b2

func sumaMaxParesImpares(numeros: [Int]) -> Int  {
    let pareja = parejaMayorParImpar2(numeros: numeros)
    return (pareja.0 ?? 0) + (pareja.1 ?? 0)
}

print("sumaMaxParesImpares(numeros: \(numeros))")
print(sumaMaxParesImpares(numeros: numeros))
// Imprime:
// sumaMaxParesImpares(numeros: [-10, 202, 12, 100, 204, 2])
// 204


//Ejercicio 1b3

func mayorParImparOpt(numero: Int, parejaOpt: (Int?, Int?)?) -> (Int?, Int?)? {
  if let pareja = parejaOpt {
    if (numero.isMultiple(of: 2)) {
        return (pareja.0, maxOpt(pareja.1, numero))
    } else {
        return (maxOpt(pareja.0, numero), pareja.1)
    }
  } else { // parejaOpt es nil 
      if (numero.isMultiple(of: 2)) {
        return (nil, numero)
      } else {
        return (numero, nil)
      }
  }
}

func parejaMayorParImparOpt(numeros:[Int]) -> (Int?, Int?)? {
    if (numeros.isEmpty) {
        return nil
    } else {
        let primero = numeros[0]
        let resto = Array(numeros.dropFirst())
        let parejaResto = parejaMayorParImparOpt(numeros: resto)
        return mayorParImparOpt(numero: primero, parejaOpt: parejaResto)
    }
}

func sumaMaxParesImpares2(numeros: [Int]) -> Int {
    if let pareja = parejaMayorParImparOpt(numeros: numeros) {  
      return (pareja.0 ?? 0) + (pareja.1 ?? 0)
    } else {
      return 0
    }
}
print("\n******\n1b3) Función sumaMaxParesImpares2(numeros: \(numeros))\n******")
print(sumaMaxParesImpares2(numeros: numeros))
print("Ejemplo sin ningún número par: [11, -7, 23, 101]")
print(sumaMaxParesImpares2(numeros: [11, -7, 23, 101]))
print("Ejemplo sin ningún número impar: [12, -8, 22, 100]")
print(sumaMaxParesImpares2(numeros: [12, -8, 22, 100]))
print("Ejemplo con array vacío")
print(sumaMaxParesImpares2(numeros: []))