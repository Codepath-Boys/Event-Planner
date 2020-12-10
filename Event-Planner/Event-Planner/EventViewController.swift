//
//  EventViewController.swift
//  Event-Planner
//
//  Created by Veeresh Rajendran on 12/9/20.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventAuthor: UILabel!
    
    var author: String?
    var date: String?
    var dsc: String?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventAuthor.text = author
        eventDate.text = date
        eventDescription.text = dsc
        eventName.text = name
        
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
