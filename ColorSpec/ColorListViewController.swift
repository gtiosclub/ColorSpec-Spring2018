//
//  ColorListViewController.swift
//  ColorSpec
//
//  Created by Kevin Randrup on 3/12/18.
//  Copyright © 2018 Kevin Randrup. All rights reserved.
//

import UIKit

class ColorListViewController : UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var colors: [UIColor] = [UIColor.blue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Are we going to the color picker?
        if let destination = segue.destination as? ColorPickerViewController {
            
            // Do we have a color to give it?
            if let cell = sender as? UICollectionViewCell,
                let indexPath = collectionView.indexPath(for: cell) {
                let color = colors[indexPath.row]
                destination.initialize(startingColor: color, callback: { (newColor) in
                    self.colors[indexPath.row] = newColor
                    self.collectionView.reloadData()
                })
            }
        }
    }
}

extension ColorListViewController : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        view.backgroundColor = colors[indexPath.row]
        return view
    }
}

