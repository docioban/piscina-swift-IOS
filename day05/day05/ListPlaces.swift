//
//  ListPlaces.swift
//  day05
//
//  Created by Macbook Pro on 10/12/20.
//
import UIKit
import Foundation

class Pin {
    var lat: Double
    var long: Double
    var title: String
    var subtitle: String
    var color: UIColor
    
    init(lat: Double, long: Double, title: String, subtitle: String, color: UIColor) {
        self.lat = lat
        self.long = long
        self.title = title
        self.subtitle = subtitle
        self.color = color
    }
}

let Pins = [
    Pin(lat: 47.0255, long: 28.8311, title: "Chisinau", subtitle: "Capital of Moldova", color: UIColor.black),
    Pin(lat: 40.7131, long: -74.0067, title: "New York", subtitle: "Statele unite ale americii", color: UIColor.blue),
    Pin(lat: 34.0469, long: -118.2395, title: "Los Angeles", subtitle: "Statele unite ale americii", color: UIColor.yellow)
]
