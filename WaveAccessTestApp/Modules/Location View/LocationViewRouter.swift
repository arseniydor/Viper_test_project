//
//  LocationViewRouter.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//  
//

import Foundation
import UIKit

class LocationViewRouter: LocationViewPresenterToRouterProtocol {
    
    // MARK: Static methods
    static func createModule(selectedLocation: Location) -> UIViewController {
        
        let viewController = LocationViewViewController()
        
        let presenter: LocationViewViewToPresenterProtocol & LocationViewInteractorToPresenterProtocol = LocationViewPresenter(selectedLocation: selectedLocation)
        
        viewController.presenter = presenter
        viewController.presenter?.router = LocationViewRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = LocationViewInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
