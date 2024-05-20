import Foundation

typealias Calificacion = (nombre: String, 
                          parcial1: Double,
                          parcial2: Double,
                          parcial3: Double,
                          años: Int)


func imprimirListadoAlumnos(_ alumnos: [Calificacion]) {
    print("Alumno   Parcial1   Parcial2   Parcial3  Años")
    for alu in alumnos {
        alu.0.withCString {
            print(String(format:"%-10s %5.2f      %5.2f    %5.2f  %3d", $0, 
                        alu.parcial1, alu.parcial2, alu.parcial3, alu.años))
        }
    }
}

let listaAlumnos = [("Pepe", 8.45, 3.75, 6.05, 1), 
                    ("Maria", 9.1, 7.5, 8.18, 1), 
                    ("Jose", 8.0, 6.65, 7.96, 1),
                    ("Carmen", 6.25, 1.2, 5.41, 2), 
                    ("Felipe", 5.65, 0.25, 3.16, 3), 
                    ("Carla", 6.25, 1.25, 4.23, 2), 
                    ("Luis", 6.75, 0.25, 4.63, 2), 
                    ("Loli", 3.0, 1.25, 2.19, 3)]

func notaFinal(_ calificacion: Calificacion) -> Double {
  return calificacion.parcial1 * 0.35 + 
         calificacion.parcial2 * 0.3 + 
         calificacion.parcial3 * 0.35
}

// Ejercicio 5a
print(listaAlumnos.filter{$0.1 >= 5.0 && $0.2 < 5.0}.count)

// Ejercicio 5b
print(listaAlumnos.filter{notaFinal($0) > 5}.map{$0.0})

// Ejercicio 5c
var tupla = (listaAlumnos.map{$0.1}.reduce(0,+), listaAlumnos.map{$0.2}.reduce(0,+), listaAlumnos.map{$0.3}.reduce(0,+))
tupla = (tupla.0 / Double(listaAlumnos.count), tupla.1 / Double(listaAlumnos.count), tupla.2 / Double(listaAlumnos.count))
print(tupla)
