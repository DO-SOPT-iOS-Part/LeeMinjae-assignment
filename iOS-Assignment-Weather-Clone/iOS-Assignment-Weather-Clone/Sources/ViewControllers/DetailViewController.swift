//
//  DetailViewController.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 10/15/23.
//

import UIKit
import SnapKit
import Then

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    var indexNumber: Int = 0
    
    // MARK: - UI Components
    private let detailVerticalScrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.alwaysBounceVertical = true
    }
    private let backgroundImageView = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "bgCloudImage")
        $0.contentMode = .scaleAspectFill
    }
    private let locationLabel = UILabel().then {
        $0.text = "천안시"
        $0.textColor = .white
        $0.font = .light(size: 36)
        $0.textAlignment = .center
    }
    private let tempLabel = UILabel().then {
        $0.text = "21°"
        $0.textColor = .white
        $0.font = .light(size: 102)
        $0.textAlignment = .center
    }
    private let weatherLabel = UILabel().then {
        $0.text = "흐림"
        $0.textColor = .white
        $0.font = .light(size: 24)
        $0.textAlignment = .center
    }
    private let maxMinTempLabel = UILabel().then {
        $0.text = "최고:29° 최저:29°"
        $0.textColor = .white
        $0.font = .light(size: 20)
        $0.textAlignment = .center
    }
    private let timeWeatherView = UIView().then {
        $0.backgroundColor = .white.withAlphaComponent(0.03)
        $0.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 0.25)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
    }
    private let weatherSummaryLabel = UILabel().then {
        $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
        $0.textColor = .white
        $0.font = .medium(size: 18)
        $0.numberOfLines = 2
    }
    private let lineView = UIView().then {
        $0.backgroundColor = .white.withAlphaComponent(0.25)
    }
    private let detailHorizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let toolbar = UIView().then {
        $0.backgroundColor = UIColor(cgColor: CGColor(red: 42, green: 48, blue: 64, alpha: 0))
        $0.layer.addBorder([.top], color: .systemGray4, width: 255)
    }
    private let mapButton = UIButton().then {
        $0.setImage(UIImage(named: "mapIcon"), for: .normal)
    }
    private let listButton = UIButton().then {
        $0.setImage(UIImage(named: "listIcon"), for: .normal)
        $0.addTarget(self, action: #selector(popToMainVC), for: .touchUpInside)
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setCollectionViewLayout()
        self.setCollectionViewConfig()
    }
    
    // MARK: - @Action Functions
    @objc func popToMainVC(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - Extensions
extension DetailViewController {
    // UI 세팅
    private func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
        self.detailVerticalScrollView.contentInsetAdjustmentBehavior = .never
        
        self.view.addSubViews(backgroundImageView,
                              detailVerticalScrollView,
                              toolbar)
        self.toolbar.addSubViews(mapButton,
                                 listButton)
        self.detailVerticalScrollView.addSubViews(locationLabel,
                                                  tempLabel,
                                                  weatherLabel,
                                                  maxMinTempLabel,
                                                  timeWeatherView)
        self.timeWeatherView.addSubViews(weatherSummaryLabel,
                                         lineView,
                                         detailHorizontalCollectionView)
        
        self.setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        detailVerticalScrollView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(toolbar.snp.top)
        }
        toolbar.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(82)
        }
        mapButton.snp.makeConstraints { make in
            make.height.width.equalTo(44)
            make.top.equalToSuperview().inset(4)
            make.leading.equalToSuperview().inset(10)
        }
        listButton.snp.makeConstraints { make in
            make.height.width.equalTo(44)
            make.top.equalToSuperview().inset(4)
            make.trailing.equalToSuperview().inset(10)
        }
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(78)
        }
        tempLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(locationLabel.snp.bottom).inset(-4)
        }
        weatherLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tempLabel.snp.bottom).inset(-4)
        }
        maxMinTempLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherLabel.snp.bottom).inset(-4)
        }
        timeWeatherView.snp.makeConstraints { make in
            make.top.equalTo(maxMinTempLabel.snp.bottom).inset(-44)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(212)
            make.centerX.equalToSuperview()
        }
        weatherSummaryLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(10)
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(weatherSummaryLabel.snp.bottom).inset(-10)
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
        }
        detailHorizontalCollectionView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(14)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 46, height: 140)
        flowLayout.minimumLineSpacing = 22
        flowLayout.minimumInteritemSpacing = 22
        flowLayout.scrollDirection = .horizontal
        self.detailHorizontalCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setCollectionViewConfig() {
        self.detailHorizontalCollectionView.register(DetailTimeWeatherCollectionViewCell.self,
                                                     forCellWithReuseIdentifier: DetailTimeWeatherCollectionViewCell.identifier)
        self.detailHorizontalCollectionView.delegate = self
        self.detailHorizontalCollectionView.dataSource = self
    }
}

// MARK: - CollectionView DataSource
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyLocationData[0].timeWeatherList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: DetailTimeWeatherCollectionViewCell.identifier,
                                                            for: indexPath) as? DetailTimeWeatherCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: dummyLocationData[0].timeWeatherList[indexPath.row])
        
        return item
    }
}

// MARK: - CollectionView Delegate
extension DetailViewController: UICollectionViewDelegate {
    
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TenDaysTableViewCell.identifier, for: indexPath) as? TenDaysTableViewCell else {return UITableViewCell()}
        // self.caculateMinMax(data: tenDaysWeatherDummy)
        // cell.minMinTemp = minMinTemp
        // cell.maxMaxTemp = maxMaxTemp
        // cell.bindData(data: tenDaysWeatherDummy[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
