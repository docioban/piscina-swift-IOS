//
//  StructMeteo.swift
//  day07
//
//  Created by Macbook Pro on 10/19/20.
//

import Foundation

struct Meteo {
    var coord : Coord
    var weather : Weather
    var base : String
    var main : Main
    var visibility : Int
    var wind : Wind
    var clouds : Clouds
    var dt : Int64
    var sys : Sys
    var timezone : Int32
    var id : Int64
    var name : String
    var cod : Int32
    
    init(p : [String : AnyObject]) {
        print("Hi")
        coord = Coord(p: p["coord"]!)
        weather = Weather(p: p["weather"]?[0] as AnyObject)
        base = p["base"] as! String
        main = Main(p: p["main"]!)
        visibility = p["visibility"] as! Int
        wind = Wind(p: p["wind"]!)
        clouds = Clouds(p: p["clouds"]!)
        dt = p["dt"] as! Int64
        sys = Sys(p: p["sys"]!)
        timezone = p["timezone"] as! Int32
        id = p["id"] as! Int64
        name = p["name"] as! String
        cod = p["cod"] as! Int32
    }
}

struct Coord {
    var lat : Double
    var long: Double
    
    init(p : AnyObject) {
        lat = p["lat"] as! Double
        long = p["lon"] as! Double
    }
}

struct Weather {
    var id : Int
    var main : String
    var description : String
    var icon : String
    
    init(p : AnyObject) {
        id = p["id"] as! Int
        main = p["main"] as! String
        description = p["description"] as! String
        icon = p["icon"] as! String
    }
}

struct Main {
    var temp : Double
    var feels_like : Double
    var temp_min : Double
    var temp_max : Double
    var pressure : Double
    var humidity : Double
    
    init(p : AnyObject) {
        temp = p["temp"] as! Double
        feels_like = p["feels_like"] as! Double
        temp_min = p["temp_min"] as! Double
        temp_max = p["temp_max"] as! Double
        pressure = p["pressure"] as! Double
        humidity = p["humidity"] as! Double
    }
}

struct Wind {
    var speed : Double
    var deg : Int
    
    init(p: AnyObject) {
        speed = p["speed"] as! Double
        deg = p["deg"] as! Int
    }
}

struct Clouds {
    var all : Int
    
    init(p: AnyObject) {
        all = p["all"] as! Int
    }
}

struct Sys {
    var type : Int
    var id : Int32
    var country : String
    var sunrise : Int64
    var sunset : Int64
    
    init(p: AnyObject) {
        type = p["type"] as! Int
        id = p["id"] as! Int32
        country = p["country"] as! String
        sunrise = p["sunrise"] as! Int64
        sunset = p["sunset"] as! Int64
    }
}
