//
//  MainViewController.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/14/23.
//

import UIKit
import SnapKit
import Then

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    static let dummyLocationData: [WeatherLocation] = [
        WeatherLocation(location: "천안시",
                        weather: "흐림",
                        temp: 18, maxTemp: 18, minTemp: 11,
                        weatherSummary: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                        timeWeatherList: [TimeWeather(time: "Now", weather: .cloud, temp: 18),
                                          TimeWeather(time: "10시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "11시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "12시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "13시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "14시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "15시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "16시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "17시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "18시", weather: .cloud, temp: 18)],
                        indexNumber: 0),
        WeatherLocation(location: "수원시",
                        weather: "흐림",
                        temp: 18, maxTemp: 18, minTemp: 11,
                        weatherSummary: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                        timeWeatherList: [TimeWeather(time: "Now", weather: .cloud, temp: 18),
                                          TimeWeather(time: "10시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "11시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "12시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "13시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "14시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "15시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "16시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "17시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "18시", weather: .cloud, temp: 18)],
                        indexNumber: 1),
        WeatherLocation(location: "광진구",
                        weather: "흐림",
                        temp: 18, maxTemp: 18, minTemp: 11,
                        weatherSummary: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
                        timeWeatherList: [TimeWeather(time: "Now", weather: .cloud, temp: 18),
                                          TimeWeather(time: "10시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "11시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "12시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "13시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "14시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "15시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "16시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "17시", weather: .cloud, temp: 18),
                                          TimeWeather(time: "18시", weather: .cloud, temp: 18)],
                        indexNumber: 2)]
    
    // MARK: - UI Components
    private let searchController = UISearchController()
    private let mainContentView = UIView()
    private let mainScrollView = UIScrollView().then() {
        $0.alwaysBounceVertical = true
    }
    private let locationStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 15
    }
    let firstLocationView = MainLocationView(city: dummyLocationData[0].location, weather: dummyLocationData[0].weather, temp: dummyLocationData[0].temp, maxTemp: dummyLocationData[0].maxTemp, minTemp: dummyLocationData[0].minTemp, indexNum: dummyLocationData[0].indexNumber)
    let secondLocationView = MainLocationView(city: dummyLocationData[1].location, weather: dummyLocationData[1].weather, temp: dummyLocationData[1].temp, maxTemp: dummyLocationData[1].maxTemp, minTemp: dummyLocationData[1].minTemp, indexNum: dummyLocationData[1].indexNumber)
    let thirdLocationView = MainLocationView(city: dummyLocationData[2].location, weather: dummyLocationData[2].weather, temp: dummyLocationData[2].temp, maxTemp: dummyLocationData[2].maxTemp, minTemp: dummyLocationData[2].minTemp, indexNum: dummyLocationData[2].indexNumber)
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupGestureRecognizer()
    }
    
    // MARK: - @IBAction Properties
    @objc func pushToDetailVC(sender: UITapGestureRecognizer) {
        let detailPageVC = DetailPageViewController()
        
        for index in 0..<3 {
            let detailVC = DetailViewController()
            detailVC.indexNumber = index
            detailPageVC.viewControllersArray.append(detailVC)
        }
        
        let firstVC = detailPageVC.viewControllersArray[0]
        detailPageVC.pageVC.setViewControllers([firstVC], direction: .forward, animated: true)
        
        self.navigationController?.pushViewController(detailPageVC, animated: true)
    }
}


// MARK: - Extensions
extension MainViewController {
    // UI 세팅
    private func setupUI() {       
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.title = "Weather"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "moreIcon"),
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.placeholder = "Search for a city or airport"
        navigationItem.hidesSearchBarWhenScrolling = false
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        self.view.addSubview(mainScrollView)
        self.mainScrollView.addSubview(mainContentView)
        self.mainContentView.addSubview(locationStackView)
        self.locationStackView.addArrangeSubViews(firstLocationView, secondLocationView, thirdLocationView)
        
        mainScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainContentView.snp.makeConstraints { make in
            make.top.bottom.centerX.width.equalToSuperview()
        }
        locationStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    // GestureRecognizer 세팅
    private func setupGestureRecognizer() {
        let pushBtn = UITapGestureRecognizer(target: self, action: #selector(pushToDetailVC))
        firstLocationView.isUserInteractionEnabled = true
        firstLocationView.addGestureRecognizer(pushBtn)
    }
    
}
