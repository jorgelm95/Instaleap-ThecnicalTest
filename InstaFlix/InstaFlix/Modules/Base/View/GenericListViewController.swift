//
//  GenericListViewController.swift
//  InstaFlix
//
//  Created by Jorge Luis Menco Jaraba on 3/11/24.
//

import Foundation
import UIKit

class GenericListViewController<T: ConfigurableCell>: UITableViewController {
    
    private let paddingTop: CGFloat = 10
    private let paddingLeft: CGFloat = 10
    private let paddingRight: CGFloat = 10
    private let paddingBottom: CGFloat = 10
    private let shadowOpacity: Float = 0.3
    private let emptyStateImage = "magnifyingglass.circle"
    private let emptyStateNetworkImage = "wifi.slash"
    
    
    // MARK: - internal properties -
    weak var retryDelegate: RetryDataDelegate?
    weak var saveFavoriteItemDelegate: SaveFavoriteItemDelegate?
    weak var navigateToDetailDelegate: NavigateToDetailDelegate?
    
    // MARK: - Private properties -
    
    private lazy var loadingView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        return activityIndicator
    }()
    
    // MARK: - internal Properties -
    var items: [T.DataType] = []

    var tableViewState: ItemsListState = .initialEmpty {
        didSet {
            checkEmptyState()
        }
    }
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(T.self, forCellReuseIdentifier: T.cellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setupNavigationBarAppearance()
    }
    
    // MARK: - internal methods -

    func removeLoadingView() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    // MARK: - Private methods -
    
    private func showLoadingView() {
        loadingView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        loadingView.backgroundColor = .InstaBlue
        activityIndicator.center = self.view.center
        activityIndicator.color = .InstaBlue
        loadingView.addSubview(activityIndicator)
        view.addSubview(loadingView)
        activityIndicator.startAnimating()
    }
    
    private func checkEmptyState() {
        switch tableViewState {
        case .initialEmpty:
            tableView.setEmptyState(
                text: Strings.ListMovies.emptyStateTitle,
                image: emptyStateImage, delegate: retryDelegate!)
        case .emptyResults:
            tableView.setEmptyState(
                text: Strings.ListMovies.emptyResultTitle,
                image: emptyStateImage, delegate: retryDelegate!)
        case .NetworkError:
            items = []
            tableView.setEmptyState(
                text: Strings.ListMovies.emptyStateNetworkTitle,
                image: emptyStateNetworkImage, delegate: retryDelegate!)
        case .filled:
            tableView.backgroundView = nil
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: T.cellIdentifier, for: indexPath) as! T
        let item = items[indexPath.row]
        cell.configure(with: item, index: indexPath.row)
        cell.delegate = self.saveFavoriteItemDelegate
        return cell as! UITableViewCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = self.navigateToDetailDelegate else { return }
        delegate.goToDetail(index: indexPath.row)
    }
}
