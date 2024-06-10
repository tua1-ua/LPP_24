import Foundation

typealias Litro = Double
typealias KwHora = Double
typealias Gramo = Double

indirect enum Consumo {
    case diesel(Litro)
    case gasolina(Litro)
    case eléctrico(KwHora)
    case hibrido(_ gasolina:Consumo, _ electrico:Consumo)
}

func co2(gasoil l : Litro) -> Gramo {2700*l}
func co2(gasolina l : Litro) -> Gramo {2350 * l}
func co2(kwh:KwHora) -> Gramo {890 * kwh}


func huellaCarbono(_ consumo:Consumo) -> Gramo {
    switch consumo {
        case .diesel(let litros): return(co2(gasoil:litros))
        case .gasolina(let litros): return(co2(gasolina:litros))
        case .eléctrico(let kwh): return(co2(kwh: kwh))
        case .hibrido(let unConsumo,let otroConsumo):
            return (huellaCarbono(unConsumo) + 
                huellaCarbono(otroConsumo)
            )
    }
}


let consumoDiesel = Consumo.diesel(10.0)
let consumoGasolina = Consumo.gasolina(8.0)
let consumoElectricidad = Consumo.eléctrico(100.0)
let consumoHíbrido = Consumo.hibrido(consumoGasolina, consumoElectricidad)

print("Huella de carbono para consumo de diesel: \(huellaCarbono(consumoDiesel)) gramos")
print("Huella de carbono para consumo de gasolina: \(huellaCarbono(consumoGasolina)) gramos")
print("Huella de carbono para consumo eléctrico: \(huellaCarbono(consumoElectricidad)) gramos")
print("Huella de carbono para consumo híbrido: \(huellaCarbono(consumoHíbrido)) gramos")
