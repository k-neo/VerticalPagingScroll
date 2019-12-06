//
//  ViewController.swift
//  VerticalPagingScroll
//
//  Created by 秋本大介 on 2019/12/06.
//  Copyright © 2019 秋本大介. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset.top = -UIApplication.shared.statusBarFrame.height
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseIdentifier", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.backgroundColor = UIColor.red
        case 1:
            cell.backgroundColor = UIColor.green
        default:
            cell.backgroundColor = UIColor.blue
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
        return size
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageHeight = scrollView.frame.size.height
        let page = Int(floor((scrollView.contentOffset.y - pageHeight / 2) / pageHeight) + 1)
        print("page = \(page)")
    }
}
