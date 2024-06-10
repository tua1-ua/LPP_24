import Foundation


protocol A {
    var descripcion: String {get set}
    func foo()-> Int?
}

struct MiStruct:A {
    var descripcion: String
    func foo() -> Int? {
        return 1
    }
}

let xd = MiStruct(descripcion: "Chupamela")
let res = xd.foo()
print(res!)

// La respuesta correcta es la b
