import Foundation

enum Rol {
    case rey, reina, torre, caballo
    case alfil, peon
}

enum Color {case blanca, negra}
struct Pieza {
    let rol: Rol
    let color: Color
}

// Esta nos la dan implementada
func pieza(en:Posicion) -> Pieza? {
    switch en {
        case .a1, .h1: return Pieza(rol: .torre, color: .blanca)
        case .b1, .g1: return Pieza(rol: .caballo, color: .blanca)
        case .c1, .f1: return Pieza(rol: .alfil, color: .blanca)
        case .d1: return Pieza(rol: .rey, color: .blanca)
        case .e1: return Pieza(rol: .reina, color: .blanca)
        case .a2, .b2, .c2, .d2, .e2, .f2, .g2, .h2: return Pieza(rol: .peon, color: .blanca)
        case .a8, .h8: return Pieza(rol: .torre, color: .negra)
        case .b8, .g8: return Pieza(rol: .caballo, color: .negra)
        case .c8, .f8: return Pieza(rol: .alfil, color: .negra)
        case .d8: return Pieza(rol: .rey, color: .negra)
        case .e8: return Pieza(rol: .reina, color: .negra)
        case .a7, .b7, .c7, .d7, .e7, .f7, .g7, .h7: return Pieza(rol: .peon, color: .negra)
    }
}


enum Posicion {
    case a8, b8, c8, d8, e8, f8, g8, h8
    case a7, b7, c7, d7, e7, f7, g7, h7
    case a6, b6, c6, d6, e6, f6, g6, h6
    case a5, b5, c5, d5, e5, f5, g5, h5
    case a4, b4, c4, d4, e4, f4, g4, h4
    case a3, b3, c3, d3, e3, f3, g3, h3
    case a2, b2, c2, d2, e2, f2, g2, h2
    case a1, b1, c1, d1, e1, f1, g1, h1
}


func esPosibleEnroqueCortoBlancas() -> Bool {
    if pieza(en: .f1) == nil  &&  pieza(en: .g1) == nil {
        if let pieza1 = pieza(en: .e1), let pieza2 = pieza(en: .h1) {
            if pieza1.rol == .rey && pieza1.color == .blanca && pieza2.rol == .torre && pieza2.color == .blanca {
                return true
            }
        }
    }
    return false
}

