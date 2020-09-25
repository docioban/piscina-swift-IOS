import UIKit

// Color.swift
public enum Color : String {
    case Hearts = "hearts"
    case Diamonds = "diamonds"
    case Clubs = "clubs"
    case Spades = "spades"

    static let allColors : [Color] = [Hearts, Diamonds, Clubs, Spades]
}

// Value.swift
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

// Card.swift
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

// Deck.swift
class Deck : NSObject {
    static let allSpades: [Card] = Value.allValues.map{Card(color: Color.Spades, value: $0)}
    static let allDiamonds: [Card] = Value.allValues.map{Card(color: Color.Diamonds, value: $0)}
    static let allHeards: [Card] = Value.allValues.map{Card(color: Color.Hearts, value: $0)}
    static let allClubs: [Card] = Value.allValues.map{Card(color: Color.Clubs, value: $0)}
    
    static let allCards: [Card] = allSpades + allDiamonds + allHeards + allClubs
    
    var cards: [Card] = allCards
    var discards: [Card] = []
    var outs: [Card] = []
    
    init(mix: Bool) {
        if mix {
            cards.shuffled()
        }
    }
    
    override var description: String {
        return self.cards.description
    }
    
    func draw () -> Card? {
        outs.append(cards.first!)
        cards.removeFirst()
        return outs.last
    }
    
    func fold(c : Card) {
        if outs.contains(c) {
            outs = outs.filter{$0 != c}
            discards.append(c)
        }
    }
}

extension Deck {
    func shuffled() -> [Deck] {
        var result = Array(arrayLiteral: self)
        result.shuffle()
        return result
    }
}

// test ex02
/*var testCards = Deck.allCards

print("All Clubs: \(Deck.allClubs)")
print("All Spades: \(Deck.allSpades)")
print("All Diamonds: \(Deck.allDiamonds)")
print("All Heards: \(Deck.allHeards)")

print("In total \(Deck.allCards.count) Cards")*/


//test ex03
/*var testCards = Deck.allCards

testCards.shuffle()

print("Shuffled card deck:")
print("")
for elem in testCards {
    print(elem)
}*/

//test ex04
var testDeck = Deck(mix: false)
var x: Card?

print(testDeck)

x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()
x = testDeck.draw()

x = nil

print("")
for i in testDeck.outs {
        print("outs[i] = \(i)")
}
print("")
testDeck.fold(c: testDeck.outs[0])
testDeck.fold(c: testDeck.outs[1])
testDeck.fold(c: testDeck.outs[2])
testDeck.fold(c: testDeck.outs[3])

for i in testDeck.discards {
        print("discards[i] = \(i)")
}
print("")
for i in testDeck.outs {
        print("outs[i] = \(i)")
}
print("")
for i in testDeck.cards {
      print(i)
}
