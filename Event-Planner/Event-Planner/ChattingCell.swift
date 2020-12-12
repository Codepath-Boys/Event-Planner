//
//  ChattingCell.swift
//  Event-Planner
//
//  Created by Kenny Mei on 12/11/20.
//

import UIKit

class ChattingCell: UITableViewCell {
    
    let defaults = UserDefaults.standard

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
