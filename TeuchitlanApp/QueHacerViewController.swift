//
//  QueHacerViewController.swift
//  TeuchitlanApp
//
//  Created by Emmanuel Garcia on 03/04/18.
//  Copyright © 2018 Emmanuel Garcia. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Kingfisher

class QueHacerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var handle : DatabaseHandle?
    var ref : DatabaseReference?
    var users = [Users]()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      collectionView.delegate = self
      collectionView.dataSource = self
        
      let  ref = Database.database().reference().child("Teuchitlan/lugares")
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot)
            for child in snapshot.children.allObjects as! [DataSnapshot]{
                if let value = child.value as? NSDictionary{
                    let user = Users()
                    let descripcion = value["descripcion"] as? String
                    let id = value["id"] as? String
                    let imagenes = value["imagenes"] as? String
                    let key = value["key"] as? String
                    let nombre = value["nombre"] as? String
                    let tipo = value["tipo"] as? String
                    let ubicacion = value["ubicacion"] as? String
                    
                    user.descripcion = descripcion
                    user.id = id
                    user.imagenes = imagenes
                    user.key = key
                    user.nombre = nombre
                    user.tipo = tipo
                    user.ubicacion = ubicacion
                    
                    self.users.append(user)
                  print(user.imagenes)
                }
            }
                self.collectionView.reloadData()
        }){(err: Error) in
            
            print("\(err.localizedDescription )")
        }
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Number of viewa
   public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    //populate view
   public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        let usera = users[indexPath.row]
    cell.layer.borderWidth = 2.0
    cell.layer.borderColor = UIColor.gray.cgColor
    cell.layer.cornerRadius=10
    
    cell.largeLblCell.text = usera.descripcion?.capitalized
    
    cell.ImageCell?.image = UIImage(named:"30224008_1857713860965582_191255195_o")
    cell.ImageCell?.contentMode = .scaleAspectFill
    let url = URL(string: usera.imagenes!)
    let myImg = cell.ImageCell
    myImg?.kf.setImage(with: url)
  
    return cell
    }
   
    
    

        
    
    }
  


