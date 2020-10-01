//
//  NewCellViewController.swift
//  Death Note
//
//  Created by Macbook Pro on 10/1/20.
//

import UIKit

class NewCellViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var dateField: UIDatePicker!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if nameField != nil {
            print(nameField.text ?? "ERROR NO NAME")
            print(descriptionField.text ?? "ERROR NO DESCRIPTION")
            let format = DateFormatter()
            format.dateFormat = "dd MMMM yyyy"
            print(format.string(from: dateField.date))
            DATA.note.append((nameField.text!, descriptionField.text!, format.string(from: dateField.date)))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
