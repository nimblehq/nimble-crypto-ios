import UIKit

var greeting = "Hello, playground"

let number: Decimal = 2.50

print(number.formatted(.currency(code: "usd").presentation(.narrow)))
