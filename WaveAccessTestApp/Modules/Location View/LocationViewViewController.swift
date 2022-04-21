//
//  LocationViewViewController.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//  
//

import UIKit
import MapKit

class LocationViewViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: LocationViewViewToPresenterProtocol?
    
    private lazy var locationView: LocationView = LocationView()
   
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        layoutUI()
        styleUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func layoutUI() {
        view.addSubview(locationView)
        locationView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    private func styleUI() {
        view.backgroundColor = .white
    }
}

extension LocationViewViewController: LocationViewPresenterToViewProtocol {
    public func fillData(selectedLocation: Location) {
        self.title = selectedLocation.name
        self.locationView.fillData(selectedLocation: selectedLocation)
    }

    public func centerMap(on coordinates: Coordinates) {
        self.locationView.centerMap(on: coordinates)
    }
}

