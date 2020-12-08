//
//  FeedViewController.swift
//  Event-Planner
//
//  Created by Veeresh Rajendran on 11/30/20.
//

import UIKit
import Parse
class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var events = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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

        return cell
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
