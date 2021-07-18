//
//  NewsTableViewCell.swift
//  DRC_Test
//
//  Created by Nihal Khokhari on 18/07/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var model: NewsCellViewModel? {
        didSet {
            guard let model = model else {
                return
            }
            setupViewModel(data: model)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupViewModel(data: NewsCellViewModel) {
        titleLabel.text = data.newsTitle
        authorLabel.text = data.authorName
        dateLabel.text = data.newsDate
    }
}
