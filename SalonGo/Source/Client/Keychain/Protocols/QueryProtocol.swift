//
//  QueryProtocol.swift
//  SalonGo
//
//  Created by Yago Marques on 19/11/22.
//

import Foundation

protocol QueryProtocol {
    var query: [String: AnyObject] { get set }
    func getGenericQuery() -> [String: AnyObject]
    func getValueQuery(_ value: Data) -> [String: AnyObject]
    func getFinderQuery() -> [String: AnyObject]
}
