//
//  LocationView.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//

import Foundation
import UIKit
import MapKit

class LocationView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.isScrollEnabled = false
        mapView.isZoomEnabled = false
        return mapView
    }()
    
    private lazy var imageBackView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 125
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 15
        return view
    }()
    
    private lazy var locationImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 120
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var nameTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        return imageView
    }()
    
    private lazy var parkNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var stateNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .lightGray
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutUI()
    }
    
    private func layoutUI() {
        self.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        contentView.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(300)
        }
        
        contentView.addSubview(imageBackView)
        imageBackView.snp.makeConstraints { make in
            make.centerY.equalTo(mapView.snp.bottom)
            make.size.equalTo(250)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        
        imageBackView.addSubview(locationImageView)
        locationImageView.snp.makeConstraints { make in
            make.size.equalTo(240)
            make.center.equalToSuperview()
        }
        
        contentView.addSubview(nameTitleLabel)
        nameTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageBackView.snp.bottom).offset(24)
            make.height.equalTo(25)
            make.left.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(starImageView)
        starImageView.snp.makeConstraints { make in
            make.left.equalTo(nameTitleLabel.snp.right).offset(8)
            make.centerY.equalTo(nameTitleLabel.snp.centerY)
            make.size.equalTo(25)
        }
        
        contentView.addSubview(parkNameLabel)
        parkNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTitleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(stateNameLabel)
        stateNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(parkNameLabel.snp.centerY)
            make.width.greaterThanOrEqualTo(50)
            make.height.equalTo(20)
            make.right.equalToSuperview().inset(16)
            make.left.equalTo(parkNameLabel.snp.right).offset(8)
        }
    }
    
    private func styleUI() { }
    
    public func fillData(selectedLocation: Location) {
        locationImageView.image = selectedLocation.getImage()
        parkNameLabel.text = selectedLocation.park
        stateNameLabel.text = selectedLocation.state
        nameTitleLabel.text = selectedLocation.name
        starImageView.isHidden = !selectedLocation.isFavorite
    }
    
    
    public func centerMap(on coordinates: Coordinates) {
        mapView.centerToLocation(CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude))
    }
}
