import Foundation

func divisionEntera (_ x:Int,divididoEntre y:Int) -> Int? {
    if y == 0 {
        return nil
    }
    return x / y
}

func imprimeResultado(_ num:Int?) {
    if num == nil {
        print("División por 0")
    }
    else {
        print("res = \(num!)")
    }

    // Otra alternativa para imprimir el resultado

    if let res = num {
        print("res = \(res)")
    }
    else {
        print("División por 0")
    }
}

var res = divisionEntera(20, divididoEntre: 10)
imprimeResultado(res)

var XdDani = divisionEntera(20, divididoEntre: 0)
imprimeResultado(XdDani)

