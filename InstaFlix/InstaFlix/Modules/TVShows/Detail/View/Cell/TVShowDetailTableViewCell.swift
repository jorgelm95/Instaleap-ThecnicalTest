//
//  TVShowDetailTableViewCell.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import UIKit
import InstaFlixDomain

final class TVShowDetailTableViewCell: BaseDetailItemTableViewCell, ConfigurableCell {
    
    typealias DataType = TVShow
    static let reuseIdentifier: String = String(describing: MovieDetailTableViewCell.self)
    
    var index: Int?
    var delegate: SaveFavoriteItemDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with tvShow: TVShow, index: Int) {
        self.selectionStyle = .none
        self.itemTitleLabel.text = tvShow.name
        self.posterImageView.downloadImage(from: Constants.baseImageUrl + tvShow.posterPath)
        self.overvewDescriptionLabel.text = tvShow.overview
        self.allowPublicLabel.text = !tvShow.adult ?  Strings.MovieDetail.allowAllPublic : Strings.MovieDetail.notAllowAllPublic
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.originalLanguageLable.text = ""
    }
}
