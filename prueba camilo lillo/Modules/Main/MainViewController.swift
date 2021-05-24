//
//  MainViewController.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import UIKit

class MainViewController: UIViewController {
    var presenter: MainPresenterProtocol?
    
    var data: [Local]? {
        didSet {
            guard let data = data else {
                return
            }
            collectionView.reloadData()
        }
    }
    
    @IBOutlet var collectionView: UICollectionView!
}

extension MainViewController {
    override func viewDidLoad() {
        setupNavigationBar()
        presenter?.onViewDidLoad()
    }
}

extension MainViewController: MainViewProtocol {
    func set(data: [Local]) {
        self.data = data
    }
}
//MARK:- Methods
extension MainViewController {
    func setupNavigationBar() {
        let backItem = UIBarButtonItem(
            image: UIImage(named: "backDark"),
            style: .plain,
            target: self,
            action: #selector(onBackButtonPressed(sender:))
        )

        navigationItem.setLeftBarButton(backItem, animated: true)

        setNavigationBar(
            tintColor: .white,
            titleColor: nil,
            titleFont: nil,
            leftBarButtomItemTintColor: .systemBlue
        )
        
        navigationController?.navigationBar.isHidden = false
    }
}
//MARK:- Targets
extension MainViewController {
    @objc func onBackButtonPressed(sender: UIButton) {
        presenter?.onBackButtonPressed()
    }
}
// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (data?.count ?? 0)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: LocalCell.reuseIdentifier,
            for: indexPath
        ) as? LocalCell else {
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: LocalCell.reuseIdentifier,
                for: indexPath
            )
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 16
        let width = screenWidth - (padding * 2)
        let height = width * (72/343)
        return CGSize(
            width: width,
            height: height
        )
    }
}
