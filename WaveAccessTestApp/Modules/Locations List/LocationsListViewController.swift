//
//  LocationsListViewController.swift
//  WaveAccessTestApp
//
//  Created by Arseniy Dorogin on 20.04.2022.
//
//

import SnapKit
import UIKit

enum LocationSection {
    case main
}

enum LocationRow {
    case favoriteFilter(isEnable: Bool)
    case location(loc: Location)
}

struct LocationDataSource {
    var section: LocationSection
    var rows: [LocationRow]
}

class LocationsListViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.nameOfClass)
        tableView.register(LocationFavoriteTableViewCell.self, forCellReuseIdentifier: LocationFavoriteTableViewCell.nameOfClass)
        tableView.isUserInteractionEnabled = true
        return tableView
    }()

    // MARK: - Properties

    var presenter: LocationsListViewToPresenterProtocol?
    private var dataSource: [LocationDataSource] = []

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        layoutUI()
        styleUI()
    }

    private func layoutUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func styleUI() {
        title = "Landmarks"
    }
}

extension LocationsListViewController: LocationsListPresenterToViewProtocol {
    func updateTableView(dataSource: [LocationDataSource]) {
        self.dataSource = dataSource
        tableView.reloadData()
    }

    // TODO: Implement View Output Methods
}

extension LocationsListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentRow = dataSource[indexPath.section].rows[indexPath.row]
        switch currentRow {
        case let .location(location):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.nameOfClass, for: indexPath) as? LocationTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(location: location)
            return cell
        case let .favoriteFilter(isEnable):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationFavoriteTableViewCell.nameOfClass, for: indexPath) as? LocationFavoriteTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(isFavoriteEnable: isEnable)
            cell.delegate = self
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let currentRow = dataSource[indexPath.section].rows[indexPath.row]
        switch currentRow {
        case let .location(location):
            self.presenter?.didSelectLocation(navController: self.navigationController, location: location)
        default:
            break
        }
    }
}

extension LocationsListViewController: LocationFavoriteCellDelegate {
    func didChangeFavoriteState(isOn: Bool) {
        presenter?.favoriteStateIsChanged(newValue: isOn)
    }
}
