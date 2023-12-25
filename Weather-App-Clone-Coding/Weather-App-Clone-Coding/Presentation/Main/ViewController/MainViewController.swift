//
//  MainViewController.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/14/23.
//

import UIKit
import SnapKit
import Then

enum Section: CaseIterable {
    case main
}

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    let cityList = ["seoul", "cheonan", "busan", "daegu", "jeju"]
    var serverLocationData = [LocationWeather]()
    var filteredLocationData = [LocationWeather]()
    
    // MARK: - UI Components
    private let searchController = UISearchController()
    private let mainTableView = MainTableView()
    private lazy var tableView = mainTableView.tableView
    
    // MARK: - View Life Cycle
    override func loadView() {
        super.loadView()
        view = mainTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setNavigationBar()
        setSearchBar()
        setLocationWeatherWithAPI()
    }
}

// MARK: - Extensions
extension MainViewController {
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.searchController?.searchResultsUpdater = self
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.title = "Weather"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "moreIcon"),
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.placeholder = "Search for a city or airport"
        navigationItem.searchController?.searchResultsUpdater = self
        let textFieldInsideSearchBar = navigationItem.searchController?.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
    }
}

// MARK: - UISearchController searchResultsUpdater
extension MainViewController: UISearchResultsUpdating {
    var isFilterting: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        filteredLocationData = serverLocationData.filter { return $0.name.lowercased().contains(text.lowercased()) }
        tableView.reloadData()
    }
}

// MARK: - TableView Delegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 133
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailPageVC = DetailPageViewController()
        
        for index in 0 ..< serverLocationData.count {
            let detailVC = DetailViewController()
            detailVC.indexNumber = index
            detailPageVC.viewControllersArray.append(detailVC)
        }
        
        let firstVC = detailPageVC.viewControllersArray[indexPath.row]
        detailPageVC.pageVC.setViewControllers([firstVC], direction: .forward, animated: true)
        
        self.navigationController?.pushViewController(detailPageVC, animated: true)
    }
}

// MARK: - TableView DataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFilterting ? filteredLocationData.count : serverLocationData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainLocationTableViewCell.identifier, for: indexPath) as? MainLocationTableViewCell else { return UITableViewCell() }
        if isFilterting {
            cell.bindData(data: filteredLocationData[indexPath.row], row: indexPath.row)
        } else {
            cell.bindData(data: serverLocationData[indexPath.row], row: indexPath.row)
        }
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: - Network
extension MainViewController {
    func getLocationWeatherWithAPI(location: String, completion: @escaping () -> Void) {
        MainAPI.shared.getLocationWeather(location: location) { response in
            DispatchQueue.global().async {
                switch response {
                case .success(let data):
                    if let data = data as? LocationWeather {
                        DispatchQueue.main.async {
                            self.serverLocationData.append(data)
                        }
                    }
                case .requestErr(let statusCode):
                    print("requestErr", statusCode)
                case .pathErr:
                    print(".pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
                
                DispatchQueue.main.async {
                    completion() // API 요청 완료 후 호출
                }
            }
        }
    }
    
    func setLocationWeatherWithAPI() {
        let group = DispatchGroup()
        for city in cityList {
            group.enter()
            getLocationWeatherWithAPI(location: city) {
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
}
