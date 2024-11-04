//
//  BaseProtocols.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import Foundation

protocol ConfigurableCell: AnyObject {
    associatedtype DataType
    static var cellIdentifier: String { get }
    var delegate: SaveFavoriteItemDelegate? { set get }
    func configure(with data: DataType, index: Int)
}

extension ConfigurableCell {
    static var cellIdentifier: String { return "\(self)" }
}

protocol SaveFavoriteItemDelegate: AnyObject {
    func saveItem(index id: Int)
}

protocol NavigateToDetailDelegate: AnyObject {
    func goToDetail(index: Int)
}
