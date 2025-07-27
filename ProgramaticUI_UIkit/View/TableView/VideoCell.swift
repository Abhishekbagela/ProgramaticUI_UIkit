//
//  VideoCell.swift
//  ProgramaticUI_UIkit
//
//  Created by Abhishek Bagela on 25/07/25.
//

import UIKit

class VideoCell: UITableViewCell {
    
    var videoImageView = UIImageView()
    var videoTitleView = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add subviews to contentView instead of cell directly
        contentView.addSubview(videoImageView)
        contentView.addSubview(videoTitleView)
        
        configImageView()
        configTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configImageView() {
        videoImageView.layer.cornerRadius = 10
        videoImageView.clipsToBounds = true
//        videoImageView.contentMode = .scaleAspectFill // Add this for proper image display
    }
    
    func configTitleLabel() {
        videoTitleView.numberOfLines = 0
        videoTitleView.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        // Set this on the imageView, not the cell
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        videoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setTitleLabelConstraints() {
        // Set this on the titleView, not the cell
        videoTitleView.translatesAutoresizingMaskIntoConstraints = false
        videoTitleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        videoTitleView.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20).isActive = true
        videoTitleView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoTitleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
    }
    
    func set(video: Video) {
        videoImageView.image = video.image
        videoTitleView.text = video.title
    }
}
