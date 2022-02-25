//
//  ViewController.swift
//  Nature Images
//
//  Created by DevRonins on 25/02/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Nature's Beautiful Images"
        //navigationController?.navigationBar.prefersLargeTitles = true
        
        let myFileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! myFileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nature") {
                pictures.append(item)
            }
        }
        pictures.sort()
        print(pictures)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}

