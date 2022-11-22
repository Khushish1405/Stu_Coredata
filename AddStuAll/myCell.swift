//
//  myCell.swift
//  AddStuAll
//
//  Created by Jaimin Solanki on 11/11/22.
//

import UIKit

class myCell: UITableViewCell {

    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblroll: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblMarks: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
