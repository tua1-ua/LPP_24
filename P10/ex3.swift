import Foundation

enum Arbol<T> {
    case nodo(T, [Arbol])
}

let arbolInt: Arbol = .nodo(53, 
                            [.nodo(13, []), 
                             .nodo(32, []), 
                             .nodo(41, 
                                   [.nodo(36, []), 
                                    .nodo(39, [])
                                   ])
                            ])
let arbolString: Arbol = .nodo("Zamora", 
                               [.nodo("Buendía", 
                                      [.nodo("Albeza", []), 
                                       .nodo("Berenguer", []), 
                                       .nodo("Bolardo", [])
                                      ]), 
                                .nodo("Galván", [])
                               ])


// Ejercicio 3

func toArray<T>(arbol: Arbol<T>) -> [T] {
    switch arbol {
        case let .nodo(dato, hijos):
            return [dato] + toArray(bosque:hijos)
    }
}

func toArray<T>(bosque: [Arbol<T>]) -> [T] {
    if let primero = bosque.first {
        let resto = Array(bosque.dropFirst())
        return toArray(arbol:primero) + toArray(bosque: resto)
    }
    else {
        return []
    }
    
}

func toArrayFOS<T>(arbol: Arbol<T>) -> [T] {
    switch arbol {
        case let .nodo(dato, hijos):
            return hijos.map(toArrayFOS).reduce([dato], +)
    }
}

print("Ejercicio 3")
print("===========")
print("-- Recursión mutua:")
print(toArray(arbol: arbolInt))
print(toArray(arbol: arbolString))

print("-- FOS:")
print(toArrayFOS(arbol: arbolInt))
print(toArrayFOS(arbol: arbolString))
