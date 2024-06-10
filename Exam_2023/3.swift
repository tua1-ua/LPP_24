import Foundation

struct Arbol<T> {
    var dato:T
    var hijos: [Arbol] = []

    // No hace falta hacer esto
    func imprimirArbol(_ prefijo: String = "", _ esUltimo: Bool = true) {
        // Imprime el nodo actual
        print("\(prefijo)\(esUltimo ? "└── " : "├── ")\(dato)")
        
        // Calcula el nuevo prefijo
        let nuevoPrefijo = prefijo + (esUltimo ? "    " : "│   ")
        
        // Imprime cada hijo
        for (index, hijo) in hijos.enumerated() {
            let esUltimoHijo = index == hijos.count - 1
            hijo.imprimirArbol(nuevoPrefijo, esUltimoHijo)
        }
    }
}

let ejemploFoto = Arbol(dato:"Padre", hijos: [Arbol(dato:"Hija", hijos: [
    Arbol(dato: "Nieta"), Arbol(dato: "Nieto")
])])

ejemploFoto.imprimirArbol()
