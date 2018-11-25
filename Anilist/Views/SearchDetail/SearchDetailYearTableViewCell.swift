//
//  SearchDetailYearTableViewCell.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/23.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class SearchDetailYearTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var yearLabel: UILabel!
    
    weak var delegate : SearchDetailYearTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        let date = Date()
        let defaultYear = Calendar.current.component(.year, from: date) + 10
        slider.maximumValue = Float(defaultYear)
        slider.minimumValue = 1970
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func valueChanged(_ sender: UISlider) {
        delegate?.valueChanged(sender, cell: self)
    }
    
}
