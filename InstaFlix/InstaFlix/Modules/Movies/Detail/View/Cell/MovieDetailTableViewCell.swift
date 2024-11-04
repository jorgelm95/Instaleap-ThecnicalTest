//
//  MovieDetailTableViewCell.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 26/09/24.
//

import UIKit
import InstaFlixDomain

final class MovieDetailTableViewCell: BaseDetailItemTableViewCell, ConfigurableCell {
    
    typealias DataType = Movie
    static let reuseIdentifier: String = String(describing: MovieDetailTableViewCell.self)
    
    var movie: Movie?
    var index: Int?
    var delegate: SaveFavoriteItemDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movie: Movie, index: Int) {
        self.movie = movie
        self.selectionStyle = .none
        self.itemTitleLabel.text = movie.originalTitle
        self.posterImageView.downloadImage(from: Constants.baseImageUrl + movie.posterPath)
        self.overvewDescriptionLabel.text = movie.overview
        self.originalLanguageLable.text = "original languaje " + movie.originalLanguage
        self.allowPublicLabel.text = !movie.adult ?  Strings.MovieDetail.allowAllPublic : Strings.MovieDetail.notAllowAllPublic
    }
}
