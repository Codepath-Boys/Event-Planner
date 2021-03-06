//
//  FeedViewController.swift
//  Event-Planner
//
//  Created by Veeresh Rajendran on 11/30/20.
//
import UIKit
import Parse
class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaults = UserDefaults.standard

    @IBOutlet weak var tableView: UITableView!
    
    var events = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        let query = PFQuery(className: "Events")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (events, error) in
            if events != nil {
                self.events = events!
                self.tableView.reloadData()
            }
        }
        
        if (defaults.integer(forKey: "theme") == 1) {
            view.backgroundColor = .darkGray
        } else if (defaults.integer(forKey: "theme") == 0){
            view.backgroundColor = .white
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let query = PFQuery(className: "Events")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (events, error) in
            if events != nil {
                self.events = events!
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (defaults.integer(forKey: "theme") == 1) {
            view.backgroundColor = .darkGray
            tableView.backgroundColor = .darkGray
        } else if (defaults.integer(forKey: "theme") == 0){
            view.backgroundColor = .white
            tableView.backgroundColor = .white
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell

        let event = events[indexPath.row]

        let user = event["author"] as! PFUser
        cell.AuthorName.text = user.username
        cell.EventDescription.text = event["description"] as? String
        cell.EventDate.text = event["date"] as? String
        cell.EventName.text = event["name"] as? String
        
//        if (defaults.integer(forKey: "theme") == 0) {
//            view.backgroundColor = .white
//            cell.AuthorName.textColor = .black
//            cell.EventDescription.textColor = .black
//            cell.EventDate.textColor = .black
//            cell.EventName.textColor = .black
//        } else if (defaults.integer(forKey: "theme") == 1){
//            view.backgroundColor = .darkGray
//            cell.AuthorName.textColor = .white
//            cell.EventDescription.textColor = .white
//            cell.EventDate.textColor = .white
//            cell.EventName.textColor = .white
//        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "onTap", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "onTap" {
            let vc = segue.destination as! EventViewController
            let event = events[(sender as? Int)!]
            let user = event["author"] as! PFUser
            vc.author = user.username
            vc.dsc = event["description"] as? String
            vc.date = event["date"] as? String
            vc.name = event["name"] as? String
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

}
