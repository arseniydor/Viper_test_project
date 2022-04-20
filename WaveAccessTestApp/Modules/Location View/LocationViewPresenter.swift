//
//  LocationViewPresenter.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//  
//

import Foundation

class LocationViewPresenter: LocationViewViewToPresenterProtocol {

    // MARK: Properties
    var view: LocationViewPresenterToViewProtocol?
    var interactor: LocationViewPresenterToInteractorProtocol?
    var router: LocationViewPresenterToRouterProtocol?
    
    var selectedLocation: Location
    
    init(selectedLocation: Location) {
        self.selectedLocation = selectedLocation
    }
    
    func viewDidLoad() {
        view?.centerMap(on: selectedLocation.coordinates)
        view?.fillData(selectedLocation: selectedLocation)
    }
}

extension LocationViewPresenter: LocationViewInteractorToPresenterProtocol {
    
}
