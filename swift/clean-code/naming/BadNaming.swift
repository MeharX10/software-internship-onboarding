import Foundation

func f(_ a: Int, _ b: Int) -> Int {
    let x = a * 60
    let y = b 
    let z = x + y
    return z
}

let v1 = 2
let v2 = 30

let r = f(v1, v2)
print(r)

