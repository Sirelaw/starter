//
//  ViewController.swift
//  starter
//
//  Created by Olawale Ipadeola on 3/28/22.
//

import UIKit

class ViewController: UIViewController {
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupCollectionView()
    }
    private func setupView(){
        title = "techstack"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
    }
    
    private func setupCollectionView(){
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TechnologyCell.self, forCellWithReuseIdentifier: "TechnologyCell")
        
        collectionView.contentInset = UIEdgeInsets(top : 16, left: 0, bottom: 16, right: 0)
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.technologies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TechnologyCell", for: indexPath) as? TechnologyCell else { return UICollectionViewCell() }
        
        guard let technology = viewModel.itemAt(indexPath.item) else { return UICollectionViewCell() }
        
        cell.configureWith(technology)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
