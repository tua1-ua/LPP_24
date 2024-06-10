import Foundation

/*
================================
Ejercicio 6: Figuras geométricas
================================
*/


// Trabajamos con coordenadas de pantalla,
// donde la esquina superior izquierda tiene las coordenadas
// (0,0), la coordenada X crece hacia la derecha y la Y 
// crece hacia abajo

// Función auxiliar que calcula el área de un triángulo

func areaTriangulo(_ p1: Punto, _ p2: Punto, _ p3: Punto) -> Double {
    let det = p1.x * (p2.y - p3.y) + p2.x * (p3.y - p1.y) + p3.x * (p1.y - p2.y)
    return abs(det)/2
}

struct Punto {
    var x = 0.0, y = 0.0
}

struct Tamaño {
    var ancho = 0.0, alto = 0.0
}

class Figura {
    var origen: Punto
    var tamaño: Tamaño

    var area: Double {
        return tamaño.ancho * tamaño.alto
    }

    var centro: Punto {
        get {
            let centroX = origen.x + (tamaño.ancho / 2)
            let centroY = origen.y + (tamaño.alto / 2)
            return Punto(x: centroX, y: centroY)
        }
        set {
            origen.x = newValue.x - (tamaño.ancho / 2)
            origen.y = newValue.y - (tamaño.alto / 2)
        }
    }

    init(origen: Punto, tamaño: Tamaño) {
      self.origen = origen
      self.tamaño = tamaño
    }
}

class Cuadrilatero: Figura {
    var p1, p2, p3, p4: Punto
    override var centro: Punto {
        get {
            super.centro
        }
        set {
            let incX = newValue.x - centro.x
            let incY = newValue.y - centro.y
            // Se llama al setter de la figura
            super.centro = newValue
            // Se actualiza las coordenadas de los puntos
            p1 = Punto(x: p1.x + incX, y: p1.y + incY)
            p2 = Punto(x: p2.x + incX, y: p2.y + incY)
            p3 = Punto(x: p3.x + incX, y: p3.y + incY)
            p4 = Punto(x: p4.x + incX, y: p4.y + incY)
        }
    }

    override var area: Double {
        let areaTriangulo1 = areaTriangulo(p1, p2, p3)
        let areaTriangulo2 = areaTriangulo(p3, p4, p1)
        return areaTriangulo1 + areaTriangulo2
    }


    init(p1: Punto, p2: Punto, p3: Punto, p4: Punto) {
        self.p1 = p1
        self.p2 = p2
        self.p3 = p3
        self.p4 = p4
        let minX = min(p1.x, p2.x, p3.x, p4.x)
        let minY = min(p1.y, p2.y, p3.y, p4.y)
        let maxX = max(p1.x, p2.x, p3.x, p4.x)
        let maxY = max(p1.y, p2.y, p3.y, p4.y)
        let alto = maxY - minY
        let ancho = maxX - minX
        super.init(origen: Punto(x: minX, y: minY), tamaño: Tamaño(ancho: ancho, alto: alto))
    }
}

class Circulo: Figura {
    var radio: Double {
        didSet {
            let incRadio = radio - oldValue
            origen.x -= incRadio
            origen.y -= incRadio
            let alto = radio * 2
            let ancho = radio * 2
            tamaño = Tamaño(ancho: ancho, alto: alto)
        }
    }
    override var area: Double {
        get {
            Double.pi * radio * radio
        }
        set {
            let radioCuadrado = newValue / Double.pi
            radio = radioCuadrado.squareRoot()
        }
    } 

    init(centro: Punto, radio: Double) {
        self.radio = radio
        let minX = centro.x - radio
        let minY = centro.y - radio
        let alto = radio * 2
        let ancho = radio * 2
        super.init(origen: Punto(x: minX, y: minY), tamaño: Tamaño(ancho: ancho, alto: alto))
    }
}


struct AlmacenFiguras {
    var figuras = [Figura]()

    var numFiguras: Int {
        return figuras.count
    }

    var areaTotal: Double {
        return figuras.reduce(0) {$0 + $1.area}
    }

    mutating func añade(figura: Figura) {
        figuras.append(figura)
    }

    mutating func desplaza(incX: Double, incY: Double) {
        for figura in figuras {
            let centro = figura.centro
            let nuevoCentro = Punto(x: centro.x + incX, y: centro.y + incY)
            figura.centro = nuevoCentro
        }
    }
}


print("""
---
Ejercicio 6
---\n
""")

// Cuadrilaterio

var cuadrilatero = Cuadrilatero(p1: Punto(x: 2, y: 6), p2: Punto(x: 5, y: 2),
                                p3: Punto(x: 8, y: 7), p4: Punto(x: 3, y: 8))
print("\nCuadrilátero")
print("------------")
print("p1: \(cuadrilatero.p1), p2: \(cuadrilatero.p2)")
print("p3: \(cuadrilatero.p3), p4: \(cuadrilatero.p4)")
print("Origen: \(cuadrilatero.origen)")
print("Tamaño: \(cuadrilatero.tamaño)")
print("Centro: \(cuadrilatero.centro)")
print("Área: \(cuadrilatero.area)")
let nuevoCentro = Punto(x: 10, y: 10)
print("Movemos el centro a la posición \(nuevoCentro)")
cuadrilatero.centro = nuevoCentro
print("Origen: \(cuadrilatero.origen)")
print("Centro: \(cuadrilatero.centro)")
print("Área: \(cuadrilatero.area)")
print("p1: \(cuadrilatero.p1), p2: \(cuadrilatero.p2)")
print("p3: \(cuadrilatero.p3), p4: \(cuadrilatero.p4)")

// Circulo

var circulo = Circulo(centro: Punto(x: 12, y: 12), radio: 5)
print("\nCírculo")
print("-------")
print("Centro: \(circulo.centro)")
print("Radio: \(circulo.radio)")
print("Área: \(circulo.area)")
print("Origen: \(circulo.origen)")
print("Tamaño: \(circulo.tamaño)")
let nuevoRadio = 3.0
print("Nuevo radio: \(nuevoRadio)")
circulo.radio = nuevoRadio
print("Radio: \(circulo.radio)")
print("Centro: \(circulo.centro)")
print("Origen: \(circulo.origen)")
print("Tamaño: \(circulo.tamaño)")
let nuevaArea = 100.0
circulo.area = nuevaArea
print("Nueva area: \(nuevaArea)")
print("Centro: \(circulo.centro)")
print("Radio: \(circulo.radio)")
print("Área: \(circulo.area)")
print("Origen: \(circulo.origen)")
print("Tamaño: \(circulo.tamaño)")

// Almacén

var almacen = AlmacenFiguras()
almacen.añade(figura: cuadrilatero)
almacen.añade(figura: circulo)
print("Total áreas de las figuras: \(almacen.areaTotal)")
almacen.desplaza(incX: 100, incY: 100)
print("Nuevos centros de las figuras:")
for figura in almacen.figuras {
    print("Centro: \(figura.centro)")
}