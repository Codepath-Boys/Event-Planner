//
//  EventViewController.swift
//  Event-Planner
//
//  Created by Veeresh Rajendran on 12/9/20.
//

import UIKit
import Parse

class EventViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventAuthor: UILabel!
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var sendButton: UIButton!
    
    var author: String?
    var date: String?
    var dsc: String?
    var name: String?
    
    var messages: [PFObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventAuthor.text = author
        eventDate.text = date
        eventDescription.text = dsc
        eventName.text = name
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(retrieveChatMessages), userInfo: nil, repeats: true)
        
        sendButton.layer.cornerRadius = 8
        
        // Do any additional setup after loading the view.
    }
    
    @objc func retrieveChatMessages() {
        let query = PFQuery(className: "Message")
        query.addDescendingOrder("createdAt")
        query.includeKey("user")
        
        query.findObjectsInBackground { (messages, error) in
            if let messages = messages {
                self.messages = messages
                self.tableView.reloadData()
                print("Successfully retrieved the messages")
            } else if let error = error {
                print("Error getting the message \(error.localizedDescription)")
            }
        }
    
    }
    
    @IBAction func onSend(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        
        chatMessage["text"] = messageTextField.text ?? ""
        
        let user = PFUser.current()
        chatMessage["user"] = user
        
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("Saved the message successfully")
                
                self.messageTextField.text = ""
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingCell", for: indexPath) as! ChattingCell
        
        let message = messages[indexPath.row]
        cell.messageLabel.text = message["text"] as? String
        
        if let user = message["user"] as? PFUser {
            cell.usernameLabel.text = user.username
        } else {
            cell.usernameLabel.text = "?"
        }
        
        // BONUS: ADD avatarImage TO CELL STORYBOARD AND CONNECT TO ChatCell
//        let baseURL = "https://api.adorable.io/avatars/"
//        let imageSize = 20
//        let avatarURL = URL(string: baseURL+"\(imageSize)/\(identifier).png")
//        cell.avatarImage.af_setImage(withURL: avatarURL!)
//        cell.avatarImage.layer.cornerRadius = cell.avatarImage.frame.height / 2
//        cell.avatarImage.clipsToBounds = true
    

        return cell
    }
    
}
