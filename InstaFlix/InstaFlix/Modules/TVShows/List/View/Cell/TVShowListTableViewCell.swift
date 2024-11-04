//
//  TVShowListTableViewCell.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import UIKit
import InstaFlixDomain

final class TVShowListTableViewCell: UITableViewCell, ConfigurableCell {
   
    typealias DataType = TVShow
    
    static let reuseIdentifier: String = String(describing: TVShowListTableViewCell.self)
    
    private struct Constants {
        static let paddingTop: CGFloat = 10
        static let paddingLeft: CGFloat = 10
        static let paddingRight: CGFloat = 10
        static let paddingBottom: CGFloat = 10
        static let titleLabelFontSize: CGFloat = 14
        static let textLabelfontsize: CGFloat = 16
        static let posterMovieImageSize: CGSize = CGSize(width: 150, height: 200)
        static let baseImageUrl: String = "https://image.tmdb.org/t/p/w1280"
    }
    
    private lazy var tvShowView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8.0
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font =  UIFont.boldSystemFont(ofSize: Constants.titleLabelFontSize)
        label.textColor = .black
        return label
    }()
    
    private lazy var popularity: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font =  UIFont.boldSystemFont(ofSize: Constants.textLabelfontsize)
        label.textColor = .instaFlixLighGray
        return label
    }()

    private lazy var numberOfVotesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font =  UIFont.boldSystemFont(ofSize: Constants.textLabelfontsize)
        label.textColor = .instaFlixLighGray
        return label
    }()
    
    private lazy var allowPublicLabel: UILabel = {
        let label = UILabel()
        label.font =  UIFont.systemFont(ofSize: Constants.textLabelfontsize)
        label.textColor = .black
        return label
    }()
    
    var index: Int?
    var delegate: SaveFavoriteItemDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
        setupPosterImageView()
        setupInformationStackView()
        setupInformationLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with tvShow: TVShow, index: Int) {
        self.index = index
        self.selectionStyle = .none
        titleLabel.text = tvShow.name
        popularity.text =  Strings.ListTVShow.popularityTitle + String(tvShow.popularity)
        posterImageView.downloadImage(from: Constants.baseImageUrl + tvShow.posterPath)
        numberOfVotesLabel.text = Strings.ListTVShow.numberOfVotes + tvShow.voteCount
    }
    
    private func setupContentView() {
        contentView.addSubview(tvShowView)
        tvShowView.addConstraints(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor,
            paddingTop: 10.0,
            paddingLeft: 16.0,
            paddingBottom: 10.0,
            paddingRight: 16.0)
        
        tvShowView.layer.cornerRadius = 15.0
        tvShowView.layer.shadowOpacity = 0.3
        tvShowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        tvShowView.layer.shadowRadius = 4
    }
    
    private func setupPosterImageView() {
        tvShowView.addSubview(posterImageView)
        posterImageView.addConstraints(
            top: tvShowView.topAnchor,
            leading: tvShowView.leadingAnchor,
            paddingTop: 5.0,
            paddingLeft: 10.0,
            width: Constants.posterMovieImageSize.width,
            height: Constants.posterMovieImageSize.height)
    }
    
    private func setupNumberOfVotesLabel() {
        tvShowView.addSubview(numberOfVotesLabel)
        posterImageView.addConstraints(
            top: posterImageView.bottomAnchor,
            leading: tvShowView.leadingAnchor,
            paddingTop: 8.0,
            paddingLeft: 10.0)
    }
    
    private func setupInformationStackView() {
        tvShowView.addSubview(infoStackView)
        infoStackView.addConstraints(
            top: tvShowView.topAnchor,
            leading: posterImageView.trailingAnchor,
            trailing: contentView.trailingAnchor,
            paddingTop: Constants.paddingTop,
            paddingLeft: Constants.paddingLeft,
            paddingRight: Constants.paddingRight)
    }
    
    private func setupInformationLabels() {
        infoStackView.addArrangedSubview(titleLabel)
        infoStackView.addArrangedSubview(popularity)
        infoStackView.addArrangedSubview(allowPublicLabel)
    }
}
