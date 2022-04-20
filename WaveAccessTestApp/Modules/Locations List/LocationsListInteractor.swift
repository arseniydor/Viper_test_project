//
//  LocationsListInteractor.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//  
//

import Foundation

class LocationsListInteractor: LocationsListPresenterToInteractorProtocol {
    // MARK: Properties
    var presenter: LocationsListInteractorToPresenterProtocol?
    
    private let locationService: LocationService = LocationService()
    
    func initialLoad() {
        retrieveLocations()
    }
    
    private func retrieveLocations() {
        if let locations = locationService.retrieveLocations() {
            presenter?.getLocations(locations: locations)
        }
    }
}
