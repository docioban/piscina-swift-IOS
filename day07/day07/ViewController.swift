//
//  ViewController.swift
//  day07
//
//  Created by Macbook Pro on 10/18/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var rez: UITextView!
    var meteo: Meteo?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func getData(name : String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(name)&appid=5f3d526ebf762cf5c7c50aafc76df458&units=metric"
        guard let url = URL(string: urlString) else {
            print("Invalide url")
            return
        }
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if (data == nil) {
                    return
                }
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String : AnyObject]
                if json["message"] != nil {
                    return
                }
                self.meteo = Meteo(p: json)
                DispatchQueue.main.async {
                    if (self.meteo != nil) {
                        self.rez.text = "Orasul: \(self.meteo!.name)\nGrade: \( self.meteo!.main.temp)\nSe simte: \(self.meteo!.main.feels_like)\nCer: \(self.meteo!.weather.main)"
                    }
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
    @IBAction func searchButton(_ sender: Any) {
        getData(name: input.text ?? "London")
    }


}

