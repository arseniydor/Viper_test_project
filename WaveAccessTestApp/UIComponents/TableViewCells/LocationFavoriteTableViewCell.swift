//
//  LocationFavoriteTableViewCell.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//

import UIKit
import SnapKit

protocol LocationFavoriteCellDelegate: AnyObject {
    func didChangeFavoriteState(isOn: Bool)
}

class LocationFavoriteTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var favoriteSwitchView: UISwitch = {
        let switchView = UISwitch()
        return switchView
    }()
    
    public weak var delegate: LocationFavoriteCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
        styleUI()
        bindUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutUI()
        styleUI()
        bindUI()
    }
    
    private func layoutUI() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(favoriteSwitchView)
        favoriteSwitchView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
    }

    private func styleUI() {
        titleLabel.text = "Favorites only"
        self.isUserInteractionEnabled = true
        self.selectionStyle = .none
    }
    
    private func bindUI() {
        favoriteSwitchView.addTarget(self, action: #selector(didChangeSwitch), for: .valueChanged)
    }
    
    @objc
    private func didChangeSwitch() {
        delegate?.didChangeFavoriteState(isOn: favoriteSwitchView.isOn)
    }
    
    public func configure(isFavoriteEnable: Bool) {
        favoriteSwitchView.isOn = isFavoriteEnable
    }
}
