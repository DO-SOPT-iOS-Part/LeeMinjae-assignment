//
//  MainViewController.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/14/23.
//

import UIKit
import SnapKit
import Then

protocol LocationSelectedProtocol: NSObject {
    func dataSend(data: [TimeWeather])
}

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    var delegate: LocationSelectedProtocol?
    var filteredLocationData = [WeatherLocation]()
    
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
        self.setTableViewConfig()
    }
}

// MARK: - Extensions
extension MainViewController {
    // UI 세팅
    private func setupUI() {
        
        setNavigationBar()
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        self.view.addSubViews(mainTableView)
        
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setTableViewConfig() {
        self.mainTableView.register(MainLocationTableViewCell.self,
                                    forCellReuseIdentifier: MainLocationTableViewCell.identifier)
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
    }
    
    private func setNavigationBar() {
        setSearchBar()
        
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

extension MainViewController: UISearchResultsUpdating {
    var isFilterting: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        
        return isActive && isSearchBarHasText
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        self.filteredLocationData = dummyLocationData.filter { return $0.location.lowercased().contains(text.lowercased()) }
        self.mainTableView.reloadData()
    }
    
}

// MARK: - TableView Delegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 133
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailPageVC = DetailPageViewController()
        
        for index in 0 ..< dummyLocationData.count {
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
        return self.isFilterting ? self.filteredLocationData.count : dummyLocationData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainLocationTableViewCell.identifier, for: indexPath) as? MainLocationTableViewCell else { return UITableViewCell() }
        
        if self.isFilterting {
            cell.bindData(data: filteredLocationData[indexPath.row], row: indexPath.row)
        } else {
            cell.bindData(data: dummyLocationData[indexPath.row], row: indexPath.row)
        }
        cell.selectionStyle = .none
        return cell
    }
}
