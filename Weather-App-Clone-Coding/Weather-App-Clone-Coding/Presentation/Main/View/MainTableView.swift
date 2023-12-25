//
//  MainTableView.swift
//  Weather-App-Clone-Coding
//
//  Created by 민 on 12/24/23.
//

import UIKit
import SnapKit

final class MainTableView: UIView {
    
    // MARK: - UI Components
    lazy var tableView = UITableView(frame: .zero, style: .insetGrouped).then {
        $0.backgroundColor = .black
    }
    
    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setLayout()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension MainTableView {
    func setHierarchy() {
        addSubview(tableView)
    }
    
    func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setRegisterCell() {
        self.tableView.register(MainLocationTableViewCell.self,
                                forCellReuseIdentifier: MainLocationTableViewCell.identifier)
    }
}
