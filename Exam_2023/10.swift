import Foundation

enum OperacionesCadenas {
    case concatenaInicio
    case concatenaFin
    case intercala
}


func construye (operador op: OperacionesCadenas) -> (String, String)->String {
    switch op {
        case .concatenaInicio:
            return {$0 + $1}

        case .concatenaFin:
            return {$1 + $0}

        case .intercala:
            return {$0 + $1 + $0}
    }
}


var f = construye(operador:OperacionesCadenas.concatenaInicio)
print(f("Hola", "Adios")) // Imprime HolaAdios

f = construye(operador: OperacionesCadenas.concatenaFin)
print(f("Hola", "Adios")) // Imprime AdiosHola

f = construye(operador: OperacionesCadenas.intercala)
print(f("Hola", "Adios")) // Imprime AdiosHolaAdios
