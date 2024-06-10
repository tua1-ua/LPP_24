import Foundation

// Ejercicio 1b

protocol A {
    var a: Int {get set}
    func foo(a: Int, b: Int) -> Int
}

protocol B {
    mutating func bar()
}

struct MiStruct: A, B {
    var a = 10
    func foo( a: Int,  b: Int) -> Int {
        let res = a > 10 ? a: b
        return res
    }

    mutating func bar() {
        self.a = 69
    }
}
