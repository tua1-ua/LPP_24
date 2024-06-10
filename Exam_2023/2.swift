import Foundation

struct Vector2D {
    var x = 0.0, y = 0.0
    static func * (izquierdo:Double, derecho:Vector2D) -> Vector2D {
        return Vector2D(x:izquierdo * derecho.x, y:izquierdo * derecho.y)
    }
}

let vector = Vector2D(x:3.0, y:1.0)
let resultado = 2.0 * vector
print(resultado)