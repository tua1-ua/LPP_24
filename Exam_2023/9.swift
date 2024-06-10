import Foundation

// Qué imprime el siguiente código?

func foo (nums: [Int]) -> ([Int], [Int]) {
    return nums.reduce(([], []))
    {(res: ([Int], [Int]), n:Int ) -> ([Int], [Int]) in 
                            if !res.0.contains(n) {
                                return (res.0 + [n], res.1)
                            } else {
                                return ((res.0, res.1 + [n]))
                            }
    }
}

print(foo(nums: [1,2,6,3,2,4,3,2]))

// Lo que hace esta FOS es que, recorriendo el array nums, si el elemento no está en el primer
// array dividio entonces se mete en el primer array, y si ese elemento ya está previamente se 
// mete en el otro array de la derecha. Básicamente permite evitar tener elementos repetidos en el mismo array
// El resultado sería: ([1, 2, 6, 3, 4], [2, 3, 2])

// Lo sabía está BIEN!!!!!!!!!!!!!!