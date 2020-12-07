//
//  EventCell.swift
//  Event-Planner
//
//  Created by Aidan Lane on 12/6/20.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var AuthorName: UILabel!
    @IBOutlet weak var EventDate: UILabel!
    @IBOutlet weak var EventName: UILabel!
    @IBOutlet weak var EventDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
