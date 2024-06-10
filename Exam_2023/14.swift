import Foundation

struct Estricto {
    static func normaliza(valor entero:Int) -> Int {
        let valor = entero % 100
        return (valor < 0) ? 100 + valor:valor
    }

    var valor: Int {
        didSet {
            valor = Estricto.normaliza(valor:valor)
        }
    }

    init(valor valorInicial:Int = 0) {
        valor = Estricto.normaliza(valor: valorInicial)
    }
}

var e = Estricto(valor:25)
print(e.valor) // Imprime 25
e = Estricto(valor: 150)
print(e.valor) // Imprime 50
e.valor = -25
print(e.valor) // Imprime 75