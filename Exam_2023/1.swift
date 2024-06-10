import Foundation

enum NivelCargaBateria {
    case vacio, medio, lleno
    mutating func aumentar() {
        switch self {
            case .vacio:
                self = .medio

            case .medio:
                self = .lleno

            case .lleno:
                break
        }
    }
}

var cargaTelefono = NivelCargaBateria.vacio
cargaTelefono.aumentar()
print(cargaTelefono)
cargaTelefono.aumentar()
print(cargaTelefono)
cargaTelefono.aumentar()
print(cargaTelefono)