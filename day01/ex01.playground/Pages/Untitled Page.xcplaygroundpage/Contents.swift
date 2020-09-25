import UIKit

public enum Color : String {
    case hearts = "hearts"
    case diamonds = "diamonds"
    case clubs = "clubs"
    case spades = "spades"

    static let allColors : [Color] = [hearts, diamonds, clubs, spades]
}

public enum Value : Int {
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case jack = 11
    case queen = 12
    case king = 13
    case ace = 14
    static let allValues: [Value] = [two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace]
}

var arrColor : [Color] = Color.allColors
var arrValue : [Value] = Value.allValues

for elem in arrColor {
    print("\(elem) = \(elem.rawValue)")
}

print("")

for elem in arrValue {
    print("\(elem) = \(elem.rawValue)")
}
