//
//  NewsDetailTableViewCell.swift
//  DRC_Test
//
//  Created by Nihal Khokhari on 18/07/21.
//

import UIKit
import Kingfisher

class NewsDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var weblinkLable: UILabel!
    
    var webLinkClicked: ((String) -> Void)?

    
    var model: NewsCellViewModel? {
        didSet {
            guard let model = model else {
                return
            }
            setupViewDetailModel(data: model)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        setupWeblinkLable()
    }
    
    func setupWeblinkLable() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        self.weblinkLable.isUserInteractionEnabled = true
        self.weblinkLable.addGestureRecognizer(labelTap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func setupViewDetailModel(data: NewsCellViewModel) {
        newsTitleLabel.text = data.newsTitle
        ImageView.kf.setImage(with: URL.init(string: data.imageUrl))
        authorLabel.text = data.authorName
        contentLabel.text = data.content
        weblinkLable.text = data.newsUrl
        dateLabel.text = data.newsDate
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        webLinkClicked?(model?.newsUrl ?? "")
    }
}
