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
    var dataSource: UITableViewDiffableDataSource<Section, LocationWeather>!
    var serverLocationData = [LocationWeather]()
    var filteredLocationData = [LocationWeather]()
    
    // MARK: - UI Components
    private let searchController = UISearchController()
    private let mainContentView = UIView()
    private let mainTableView = UITableView(frame: .zero, style: .insetGrouped).then {
        $0.backgroundColor = .black
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.fetchData()
        self.setTableViewConfig()
    }
}

// MARK: - Extensions
extension MainViewController {
    // UI 세팅
    private func setupUI() {
        self.setupLayout()
        self.setNavigationBar()
        self.setSearchBar()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        self.view.addSubViews(mainTableView)
        
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // 네비게이션바 세팅
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
    
    // 서치바 세팅
    private func setSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.placeholder = "Search for a city or airport"
        navigationItem.searchController?.searchResultsUpdater = self
        
        let textFieldInsideSearchBar = navigationItem.searchController?.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
    }
    
    // 테이블뷰 세팅
    private func setTableViewConfig() {
        self.mainTableView.register(MainLocationTableViewCell.self,
                                    forCellReuseIdentifier: MainLocationTableViewCell.identifier)
        self.mainTableView.delegate = self
        self.dataSource = UITableViewDiffableDataSource<Section, LocationWeather>(tableView: mainTableView) { (tableView, indexPath, location) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainLocationTableViewCell.identifier, for: indexPath) as? MainLocationTableViewCell else { return UITableViewCell() }
            cell.bindData(data: location, row: indexPath.row)
            cell.selectionStyle = .none
            
            return cell
        }
        self.mainTableView.dataSource = dataSource
    }
    
    // snapshot & apply 적용 부분
    private func performQuery(with filter: String?) {
        self.filteredLocationData = serverLocationData.filter { return $0.name.lowercased().contains(filter ?? "".lowercased()) }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, LocationWeather>()
        snapshot.appendSections([.main])
        if self.isFilterting {
            snapshot.appendItems(filteredLocationData)
        } else {
            snapshot.appendItems(serverLocationData)
        }
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func fetchData() {
        let locations = ["gwangju", "daegu", "daejeon", "busan", "seoul", "jeju", "cheonan"]
        for location in locations {
            GetLocationWeatherService.shared.getLocationWeatherInfo(location: location) { (response) in
                
                switch(response)
                {
                case .success(let weatherData):
                    if let data = weatherData as? LocationWeather {
                        self.serverLocationData.append(data)
                        print(data)
                    }
                case .requestErr(let message):
                    print("REQUEST_ERROR", message)
                case .pathErr:
                    print("PATH_ERROR")
                case .serverErr:
                    print("SERVER_ERROR")
                case .networkFail:
                    print("NETWORK_FAIL")
                }
            }
        }
        self.mainTableView.reloadData()
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
        performQuery(with: text)
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
