//
//  MediaDetailReviewTableViewCell.swift
//  Anilist
//
//  Created by NaotoIto on 2018/12/02.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class MediaDetailReviewTableViewCell: UITableViewCell {
    
    static let identifier = "\(Swift.type(of: self))"

    weak var delegate: MediaDetailReviewTableViewCellDelegate?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        delegate?.touchesBegan(cell: self)
    }
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(_ userName: String?, text: String?) {
        userLabel.text = userName
        let font = bodyLabel.font!
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.blue,
            ]
        guard let text = text else {return}
        let attributedMore = NSAttributedString(string: "More", attributes: attributes)
        let attributedText = NSMutableAttributedString(string: text.trunc(length: 100))
        attributedText.append(attributedMore)
        bodyLabel.attributedText = attributedText
        bodyLabel.sizeToFit()
    }
    
    func reloadTextView(_ text: String) {
        bodyLabel.attributedText = NSMutableAttributedString(string: text)
    }
    
}
