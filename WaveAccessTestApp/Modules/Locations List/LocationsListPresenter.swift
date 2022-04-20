//
//  LocationsListPresenter.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//  
//

import Foundation
import UIKit

class LocationsListPresenter: LocationsListViewToPresenterProtocol {

    // MARK: Properties
    var view: LocationsListPresenterToViewProtocol?
    var interactor: LocationsListPresenterToInteractorProtocol?
    var router: LocationsListPresenterToRouterProtocol?
    
    private var isFavoriteFilterEnable: Bool = false
    private var locations: [Location] = []
    
    public func viewDidLoad() {
        interactor?.initialLoad()
    }
    
    public func getLocations(locations: [Location]) {
        self.locations = locations
        var locationRows: [LocationRow] = []
        locationRows.append(.favoriteFilter(isEnable: isFavoriteFilterEnable))
        if isFavoriteFilterEnable {
            locationRows.append(contentsOf: locations.filter({ $0.isFavorite }).map({ LocationRow.location(loc: $0)}))
        } else {
            locationRows.append(contentsOf: locations.map({ LocationRow.location(loc: $0)}))
        }
        
        let locationsDataSource = LocationDataSource(section: .main, rows: locationRows)
        view?.updateTableView(dataSource: [locationsDataSource])
    }
    
    func favoriteStateIsChanged(newValue: Bool) {
        isFavoriteFilterEnable = newValue
        getLocations(locations: locations)
    }
    
    func didSelectLocation(navController: UINavigationController?, location: Location) {
        router?.openLocation(navController: navController, location: location)
    }
}

extension LocationsListPresenter: LocationsListInteractorToPresenterProtocol {
    
}
