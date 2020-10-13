//
//  SecondViewController.swift
//  day03
//
//  Created by Macbook Pro on 10/4/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    var imageScrollView: ImageScrollView!
    var nameImage: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        imageScrollView = ImageScrollView(frame: view.bounds)
        view.addSubview(imageScrollView)
        setupImageScrollView()
        
        if let image = UIImage(named: nameImage+".jpg") {
            self.imageScrollView.set(image: image)
        }
    }
    
    func setupImageScrollView() {
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        imageScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
}
