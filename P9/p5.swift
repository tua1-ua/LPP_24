// Ejercicio 5

indirect enum ArbolBinario {
    case vacio
    case nodo(Int, ArbolBinario, ArbolBinario)
}

func suma(arbolb: ArbolBinario) -> Int {
    switch arbolb {
        case .vacio:
            return 0
        
        case .nodo(let valor, let izq, let der):
            return valor + suma(arbolb:izq) + suma(arbolb:der)
    }
}


let arbol: ArbolBinario = .nodo(8, 
                                .nodo(2, .vacio, .vacio), 
                                .nodo(12, .vacio, .vacio))

print(suma(arbolb: arbol))
// Imprime: 22
