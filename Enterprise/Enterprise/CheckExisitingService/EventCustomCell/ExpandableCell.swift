//
//  ExpandableCell.swift
//  Enterprise
//
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {
    @IBOutlet weak var locationDesc: UILabel!
    @IBOutlet weak var containerView: UIView!
   
    @IBOutlet weak var dateLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
