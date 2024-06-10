import Foundation

struct Equipo {
    let nombre:String
    var puntos:Int = 0 
    mutating func incrementa(puntos:Int) {
        self.puntos += puntos
    }
}


struct Partido {
    let local : String
    let golesLocal : Int
    let visitante : String
    let golesVisitante : Int
}

struct Liga{
    var equipos:[Equipo]
    var partidos:[Partido]
    func mostrarPuntuaciones() {
        for equipo in equipos {
            print("\(equipo.nombre): \(equipo.puntos) puntos")
        }
    }

    func mostrarPartidos() {
        for partido in partidos {
            print ("\(partido.local) \(partido.golesLocal) - \(partido.visitante) \(partido.golesVisitante)")
        }
    }

    func buscarEquipo(nombre:String) -> Int? {
        var i = 0
        var encontrado = false
        while !encontrado && i < equipos.count {
            encontrado = equipos[i].nombre == nombre
            if !encontrado {
                i+=1
            }
        }
        if !encontrado {
            return nil
        }
        else {
            return i
        }
    }
    
    func puntosPartido(favor:Int, contra:Int) -> Int {
        if favor > contra {
            return 3
        }
        else if favor == contra {
            return 1
        }
        else {
            return 0
        }
    }
    
    mutating func añadirPartidos(jornada:[Partido]) {
        self.partidos+=jornada
        actualizarPuntuaciones(jornada:jornada)
    }
    
    mutating func actualizarPuntuaciones(jornada:[Partido]) {
        for p in jornada {
            if let i = buscarEquipo(nombre:p.local) {
                equipos[i].incrementa(puntos:puntosPartido(favor:p.golesLocal,
                                                                contra:p.golesVisitante))
            }
            if let i = buscarEquipo(nombre:p.visitante) {
                equipos[i].incrementa(puntos:puntosPartido(favor:p.golesVisitante,
                                                                contra:p.golesLocal))
            }
        }
    }
}

print("""
---
Ejercicio 3
---\n
""")

var liga: Liga

liga = Liga(equipos:[Equipo(nombre:"Real Madrid", puntos:0),
                     Equipo(nombre:"Barcelona", puntos:0),
                     Equipo(nombre:"Atlético Madrid", puntos:0),
                     Equipo(nombre:"Valencia", puntos:0),
                     Equipo(nombre:"Athlétic Bilbao", puntos:0),
                     Equipo(nombre:"Sevilla", puntos:0)],
            partidos:[])

print("\nPuntuación antes de los partidos:")
liga.mostrarPuntuaciones()

var partidos = [Partido(local:"Real Madrid", golesLocal:0,
                        visitante:"Barcelona", golesVisitante:3),
                Partido(local:"Sevilla", golesLocal:1,
                        visitante:"Athlétic Bilbao", golesVisitante:1),
                Partido(local:"Valencia", golesLocal:2,
                        visitante:"Atlético Madrid", golesVisitante:1),
                Partido(local:"Liverpool", golesLocal:4, visitante:"Barcelona", golesVisitante:0)]

liga.añadirPartidos(jornada:partidos)
print("\nResultados:")
liga.mostrarPartidos()

print("\nPuntuación después de los partidos:")
liga.mostrarPuntuaciones()