//
//  LocationTableViewCell.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//

import UIKit
import SnapKit

class LocationTableViewCell: UITableViewCell {
    
    private lazy var locationIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var locationNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
        styleUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutUI()
        styleUI()
    }
    
    private func layoutUI() {
        contentView.addSubview(locationIconImageView)
        locationIconImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.size.equalTo(40)
            make.top.bottom.equalToSuperview().inset(8)
        }
        
        contentView.addSubview(locationNameLabel)
        locationNameLabel.snp.makeConstraints { make in
            make.left.equalTo(locationIconImageView.snp.right).offset(8)
            make.height.equalTo(20)
            make.centerY.equalTo(locationIconImageView.snp.centerY)
        }
        
        contentView.addSubview(starImageView)
        starImageView.snp.makeConstraints { make in
            make.left.equalTo(locationNameLabel.snp.right).offset(1)
            make.centerY.equalTo(locationNameLabel.snp.centerY)
            make.size.equalTo(20)
        }
    }

    private func styleUI() {
        self.accessoryType = .disclosureIndicator
    }
    
    public func configure(location: Location) {
        locationIconImageView.image = location.getImage()
        locationNameLabel.text = location.name
        starImageView.isHidden = !location.isFavorite
    }
}
