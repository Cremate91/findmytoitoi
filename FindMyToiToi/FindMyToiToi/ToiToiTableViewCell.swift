//
//  ToiToiTableViewCell.swift
//  FindMyToiToi
//
//  Created by master on 07.07.16.
//  Copyright © 2016 de.beuth-hochschule. All rights reserved.
//

import UIKit

class ToiToiTableViewCell: UITableViewCell {

    
    // MARK: Properties
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
