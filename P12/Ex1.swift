import Foundation

// Ejercicio 1

protocol A {
    var a: String {get}
    func foo(a: String) -> String?
}
protocol B {
    mutating func bar()
}
struct MiStruct: A, B {
    var a = 10
    func foo(a: Int, b: Int) -> Int? {
        let res = a + b > self.a ? a + b : nil
        return res
    }
    mutating func bar() {
        a += 1
    }
}



