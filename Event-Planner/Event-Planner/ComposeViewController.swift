//
//  ComposeViewController.swift
//  Event-Planner
//
//  Created by Aidan Lane on 12/2/20.
//

import UIKit
import Parse
import Foundation

class ComposeViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (defaults.integer(forKey: "theme") == 0) {
            view.backgroundColor = .white
            eventNameLabel.textColor = .black
            dateLabel.textColor = .black
            descriptionLabel.textColor = .black
        } else {
            view.backgroundColor = .darkGray
            eventNameLabel.textColor = .white
            dateLabel.textColor = .white
            descriptionLabel.textColor = .white
        }
    }
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var EventDatePicker: UIDatePicker!
    @IBOutlet weak var DescriptionTextField: UITextField!
    
    
    @IBAction func onSubmit(_ sender: Any) {
        let event = PFObject(className: "Events")
        let dateConverted = EventDatePicker.date
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm"
        df.dateFormat = "MMM dd, YYY hh:mm"
        event["author"] = PFUser.current()!
        event["name"] = NameTextField.text!
        event["date"] = df.string(from: dateConverted)
        event["description"] = DescriptionTextField.text!
        
        event.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else {
                print("error!")
            }
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("returning")
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
