import Foundation


struct Equipo : Comparable {
    let puntos: Int
    let nombre: String

    static func == (equipo1:Equipo, equipo2:Equipo) -> Bool{
        return equipo1.puntos == equipo2.puntos && equipo1.nombre == equipo2.nombre
    }

    static func < (izq:Equipo, der:Equipo) -> Bool {
        return izq.puntos < der.puntos
    }
}

let equipo1 = Equipo(puntos: 10, nombre: "Hércules")
let equipo2 = Equipo(puntos: 8, nombre: "Villareal")
print(equipo1 == equipo2) // imprime false
print(equipo1 > equipo2) // imprime true

let ejemplo = [
    Equipo(puntos: 5, nombre: "Hercules"),
    Equipo(puntos: 10, nombre: "Valencia"),
    Equipo(puntos: 8, nombre: "Betis"),
    Equipo(puntos: 1, nombre: "Elche"),
    Equipo(puntos: 5, nombre: "Leganés"),
    Equipo(puntos: 10, nombre: "Barça")
    ]

for e in ejemplo.sorted() {
    print(e)
}