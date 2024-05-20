// Ejercicio 6

indirect enum Arbol {
    case nodo(Int, [Arbol])
}

func suma(arbol:Arbol, cumplen:(Int) -> Bool) -> Int {
    switch arbol {
        case .nodo(let dato, let hijos):
            if cumplen(dato) {
                return dato + suma(bosque:hijos, cumplen:cumplen)
            }
            else {
                return suma(bosque:hijos, cumplen:cumplen)
            }
    }
}

func suma(bosque:[Arbol], cumplen:(Int) -> Bool) -> Int {
    if bosque.isEmpty {
        return 0
    }
    else {
        let first = bosque[0]
        let rest = Array(bosque.dropFirst(1))
        return suma(arbol:first, cumplen:cumplen) + suma(bosque:rest, cumplen:cumplen)
    }
}

/*
Definimos el árbol

    10
   / | \
  3  5  8
  |
  1

*/

let arbol1 = Arbol.nodo(1, [])
let arbol3 = Arbol.nodo(3, [arbol1])
let arbol5 = Arbol.nodo(5, [])
let arbol8 = Arbol.nodo(8, [])
let arbol10 = Arbol.nodo(10, [arbol3, arbol5, arbol8])


func esPar(x: Int) -> Bool {
    return x % 2 == 0
}

print("La suma del árbol genérico es: \(suma(arbol: arbol10, cumplen: esPar))")
// Imprime: La suma del árbol genérico es: 18
