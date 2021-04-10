//
//  ViewController.swift
//  Weather-API
//
//  Created by Rushi Patel on 2021-04-02.
//

import UIKit
public var viewNo: Int = 0;
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var cofeeCovers = [UIImage]();
    
    @IBOutlet weak var CellInterc : UICollectionViewCell!
 var yourArray = [String](arrayLiteral: "Mumbai","Delhi", "Ahemdabad" , "Toronto","Tokyo", "Moscow","Sydney","Amsterdam","London","Cairo")
    @IBOutlet weak var colvv : UICollectionView!
    var colors = [UIColor](arrayLiteral: UIColor.systemPink, UIColor.blue,  UIColor.green, UIColor.yellow, UIColor.orange ,UIColor.purple, UIColor.red, UIColor.black,UIColor.cyan,UIColor.orange);
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cofeeCovers.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colvv.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellCV
        cell.image.image = self.cofeeCovers[indexPath.row]
        cell.bgcol.backgroundColor = self.colors[indexPath.row].withAlphaComponent(0.30);
        cell.tit.text = self.yourArray[indexPath.row]
        cell.image.layer.cornerRadius = 10.0;
        cell.bgcol.layer.cornerRadius = 10.0;
        cell.image.layer.masksToBounds = true;
        cell.bgcol.layer.masksToBounds = true;
        return cell;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colvv.dataSource = self;
        
        colvv.delegate = self;
        for image in 1...10 {
            let coffe = UIImage(named: "image_\(image)");
            self.cofeeCovers.append(coffe!);
            
        }
        self.colvv.layer.cornerRadius = 2.0
        self.colvv.layer.borderWidth = 1.0
        self.colvv.layer.borderColor = UIColor.clear.cgColor
        self.colvv.layer.masksToBounds = true
        
        
    }
    let secondView = SecondView();
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row);
        viewNo = indexPath.row + 1;
       self.secondView.currentNO = indexPath.row + 1;
    }
}
