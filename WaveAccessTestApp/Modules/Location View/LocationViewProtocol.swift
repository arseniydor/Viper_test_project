//
//  LocationViewProtocol.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol LocationViewPresenterToViewProtocol {
    func centerMap(on coordinates: Coordinates)
    func fillData(selectedLocation: Location)
}


// MARK: View Input (View -> Presenter)
protocol LocationViewViewToPresenterProtocol {
    var view: LocationViewPresenterToViewProtocol? { get set }
    var interactor: LocationViewPresenterToInteractorProtocol? { get set }
    var router: LocationViewPresenterToRouterProtocol? { get set }
    func viewDidLoad()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol LocationViewPresenterToInteractorProtocol {
    var presenter: LocationViewInteractorToPresenterProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol LocationViewInteractorToPresenterProtocol {}


// MARK: Router Input (Presenter -> Router)
protocol LocationViewPresenterToRouterProtocol {}
