// Ejercicio 4

enum Movimiento {
    case deposito(Double)
    case cargoRecibo(String, Double)
    case cajero(Double)
}


func aplica(movimientos:[Movimiento]) -> (Double, [String]) {
    /* var saldo : Double = 0
    var recibos : [String] = []
    for mov in movimientos {
        switch mov {
            case .deposito(let ingreso):
                saldo += ingreso
            case .cajero(let retirada):
                saldo-=retirada
            case .cargoRecibo(let nombreRecibo, let costo):
                saldo-=costo
                recibos.append(nombreRecibo)
        }
    }
    return (saldo, recibos) */
    if movimientos.isEmpty{
        return (0, [])
    }
    else {
        let primero = movimientos[0]
        let resto = Array(movimientos.dropFirst())
        switch primero {
            case .deposito(let ingreso):
                return (aplica(movimientos: resto).0 + ingreso, aplica(movimientos: resto).1)
            case .cajero(let retirada):
                return (aplica(movimientos: resto).0 - retirada, aplica(movimientos: resto).1)
            case .cargoRecibo(let nombre, let coste):
                return (aplica(movimientos: resto).0 - coste, [nombre] + aplica(movimientos: resto).1)
        }
    }
}

let movimientos: [Movimiento] = [.deposito(830.0), .cargoRecibo("Gimnasio", 45.0), .deposito(400.0), .cajero(100.0), .cargoRecibo("Fnac", 38.70)]
print(aplica(movimientos: movimientos))
//Imprime (1046.3, ["Gimnasio", "Fnac"])
