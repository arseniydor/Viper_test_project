//
//  LocationsListRouter.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//  
//

import Foundation
import UIKit

class LocationsListRouter: LocationsListPresenterToRouterProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = LocationsListViewController()
        let presenter: LocationsListViewToPresenterProtocol & LocationsListInteractorToPresenterProtocol = LocationsListPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = LocationsListRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = LocationsListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func openLocation(navController: UINavigationController?, location: Location) {
        let vc = LocationViewRouter.createModule(selectedLocation: location)
        navController?.pushViewController(vc, animated: true)
    }
}
