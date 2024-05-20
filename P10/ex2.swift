import Foundation

// Ejercicio 2a.1

let nums = [1,2,3,4,5,6,7,8,9,10]
print(nums.filter{$0 % 3 == 0}.count)
// Devuelve el nº de numeros divisibles entre 3 = 3

// Ejercicio 2a.2
let nums2 = [1,2,3,4,5,6,7,8,9,10]
print(nums2.map{$0+100}.filter{$0 % 5 == 0}.reduce(0,+))
// Primero se suma a todo 100, se filtran los divisibles entre 5 = 105 y 110 y se suman = 215


// Ejercicio 2a.3
let cadenas = ["En", "un", "lugar", "de", "La", "Mancha"]
print(cadenas.sorted{$0.count < $1.count}.map{$0.count})
// Primero se ordenan de menor a mayor longitud y después se deja su recuente: [2,2,2,2,5,6]


// Ejercicio 2a.4
let cadenas2 = ["En", "un", "lugar", "de", "La", "Mancha"]
print(cadenas2.reduce([]) {
    (res: [(String, Int)], c: String) -> [(String, Int)] in
        res + [(c, c.count)]}.sorted(by: {$0.1 < $1.1}))

// Primero se ordenan de menor a mayor longitud, y se pasan parejas de la "Cadena" con su longitud


// Ejercicio b1
func f(nums: [Int], n: Int) -> Int {
    return nums.filter{$0 == n}.count
}
// Devuelve el numero de elementos iguales a n

// Ejercicio b2
func g(nums: [Int]) -> [Int] {
    return nums.reduce([], {
        (res: [Int], n: Int) -> [Int] in
            if !res.contains(n) {
                return res + [n]
            } else {
                return res
            }
    })
}

// Devuelve los elementos sin repetidos

// Ejercicio b3

func h(nums: [Int], n: Int) -> ([Int], [Int]) {
   return nums.reduce(([],[]), {
       (res: ([Int],[Int]), num: Int ) -> ([Int],[Int]) in
           if (num >= n) {
               return (res.0, res.1 + [num])
           } else {
               return ((res.0 + [num], res.1))
           }
   })
}

// Devuelve una pareja de arrays, la de la izqueirda son elementos menores que n y los de la derecha mayores o iguales

// Ejercicio 2c1

func suma(palabras: [String], contienen: Character) -> Int {
    return palabras.filter{$0.contains(contienen)}.map{$0.count}.reduce(0,+)
}

print("""
  c.1)
    suma(palabras: \(cadenas), contienen: "a") = \(
    suma(palabras:   cadenas , contienen: "a") )\n
  """)


// Ejercicio 2c2
func sumaMenoresMayores(nums: [Int], pivote: Int) -> (Int, Int) {
    /* return nums.reduce((0,0), {
        (res: (Int, Int), num: Int) -> (Int, Int) in
            if (num >= pivote) {
                return (res.0, res.1 + num)
            }
            else {
                return (res.0 + num, res.1)
            }
    }) */
    return nums.reduce((0,0), {($1 < pivote) ? ($0.0 + $1, $0.1) : ($0.0, $0.1 + $1)}) 
}

    print("""
    c.2)
        sumaMenoresMayores(nums: \(nums), pivote: 8) = \(
        sumaMenoresMayores(nums:   nums , pivote: 8) )\n
    """)


  // Ejercicio 2d

  func bar(f: (Int) -> Int) {
    print(f(4))
    }

    func foo() -> (Int) -> Int {
        var x = 3
        return {
            x += $0 + 2
            return x
        }
    }

    var x = 5
    let g = foo()
    bar(f: g)   // => 9
    bar(f: g)   // => 15
