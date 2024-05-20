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


func imprimirListadosNotas(_ alumnos: [Calificacion]) {
    // Listado ORIGINAL
    print("LISTADO ORIGINAL")
    imprimirListadoAlumnos(alumnos)

    // Ordenado nombre orden creciente
    let nombre_creciente = alumnos.sorted {$0.0 < $1.0}
    print("\nLISTADO ORDENADO por Nombre")
    imprimirListadoAlumnos(nombre_creciente)

    // Ordenado parcial 1 decreciente
    let parcial1_decre = alumnos.sorted {$0.1 > $1.1}
    print("\nLISTADO ORDENADO por Parcial1 (decreciente)")
    imprimirListadoAlumnos(parcial1_decre)

    // Ordenado parcial 2 creciente
    let parcial2_crece = alumnos.sorted{$0.2 < $1.2}
    print("\nLISTADO ORDENADO por Parcial2 (creciente)")
    imprimirListadoAlumnos(parcial2_crece)

    // Ordenado por año y parcial 3 decreciente
    let anyo_parcial3 = alumnos.sorted(by:{
        a1,a2 in 
            if a1.años == a2.años {
                return a1.parcial3 > a2.parcial3
            }
            else {
                return a1.años > a2.años
            }
    })
    print("\nLISTADO ORDENADO por Año de Matriculación y Parcial3 (decreciente año y nota)")
    imprimirListadoAlumnos(anyo_parcial3)

    print("\nLISTADO ORDENADO por Nota final (decreciente)")
    let final = alumnos.sorted(by:{
        a1,a2 in 
            let primero = notaFinal(a1)
            let segundo = notaFinal(a2)
            return primero > segundo
    })
    imprimirListadoAlumnos(final)

}


imprimirListadosNotas(listaAlumnos)
