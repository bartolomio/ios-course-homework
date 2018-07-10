//
//  CollectiooViewController.swift
//  08-UICollectionView
//
//  Created by Роман on 11.07.18.
//  Copyright © 2018 bartolomio. All rights reserved.
//

import UIKit

class CollectiooViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register([CollectionViewMyCell.reuseIdentifier])
        
        let record = Record(name: "1111", text: "1111", tags: "11")
        record.image = #imageLiteral(resourceName: "addInsrtuction2")
        RecordHandler.shared.records.append(record)

        // Do any additional setup after loading the view.
    }

}

extension CollectiooViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RecordHandler.shared.records.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let record = RecordHandler.shared.records[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewMyCell.reuseIdentifier, for: indexPath) as! CollectionViewMyCell
        cell.set(with: record, isBlack: Settings.shared.isBlackTheme())
        
        return cell
    }
    
}
