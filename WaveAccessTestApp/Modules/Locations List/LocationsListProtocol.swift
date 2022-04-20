//
//  LocationsListProtocol.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//  
//

import Foundation
import UIKit

// MARK: View Output (Presenter -> View)
protocol LocationsListPresenterToViewProtocol {
    func updateTableView(dataSource: [LocationDataSource])
}


// MARK: View Input (View -> Presenter)
protocol LocationsListViewToPresenterProtocol {
    var view: LocationsListPresenterToViewProtocol? { get set }
    var interactor: LocationsListPresenterToInteractorProtocol? { get set }
    var router: LocationsListPresenterToRouterProtocol? { get set }
    func viewDidLoad()
    func favoriteStateIsChanged(newValue: Bool)
    func didSelectLocation(navController: UINavigationController?, location: Location)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol LocationsListPresenterToInteractorProtocol {
    var presenter: LocationsListInteractorToPresenterProtocol? { get set }
    func initialLoad()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol LocationsListInteractorToPresenterProtocol {
    func getLocations(locations: [Location])
}


// MARK: Router Input (Presenter -> Router)
protocol LocationsListPresenterToRouterProtocol {
    func openLocation(navController: UINavigationController?, location: Location)
}
