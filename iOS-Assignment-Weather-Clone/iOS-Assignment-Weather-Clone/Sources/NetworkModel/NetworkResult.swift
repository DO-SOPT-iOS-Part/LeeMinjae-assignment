//
//  NetworkResult.swift
//  iOS-Assignment-Weather-Clone
//
//  Created by 민 on 11/13/23.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
