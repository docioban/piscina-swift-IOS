import UIKit

public enum Color : String {
    case Hearts = "hearts"
    case Diamonds = "diamonds"
    case Clubs = "clubs"
    case Spades = "spades"

    static let allColors : [Color] = [Hearts, Diamonds, Clubs, Spades]
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

class Card : NSObject {
    var color : Color
    var value : Value
    
    init (color : Color, value : Value) {
        self.color = color
        self.value = value
    }
    
    override var description: String {
        return "\(color), \(value)"
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let object = object as? Card {
            return color == object.color && value == object.value
        }
        return false
    }
    
    static func == (c1 : Card, c2 : Card) -> Bool {
        return c1.value == c2.value && c1.color == c2.color
    }
}

let card1 = Card(color: Color.Spades, value: Value.eight)
print(card1)

let card2 = Card(color: Color.Diamonds, value: Value.two)
print(card2)

print(card1 == card2)
