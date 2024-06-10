import Foundation

func añade(_ array: inout [Int], _ a: Int, veces n: Int) {
    array.append(a)  // Añade el primer elemento
    for _ in 0..<n - 1 {
        array.append(a)  // Añade los n-1 elementos restantes
    }
}

var numeros = [1, 2]
añade(&numeros, 10, veces:3) // Añadimos el & (inout)
print(numeros) // Imprime [1, 2, 10, 10, 10]


/* 
    A: Porque el error Bitch?  
    El código inicial tiene un error porque el array numeros no se está modificando correctamente dentro de la función añade. 
    Esto se debe a que los arrays en Swift se pasan por valor, no por referencia, lo que significa que cualquier modificación dentro de la función no afectará al array original fuera de la función.
*/