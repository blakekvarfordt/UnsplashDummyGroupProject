//
//  UnsplashTVC.swift
//  DummyProjectUnsplash
//
//  Created by Blake kvarfordt on 9/30/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class UnsplashTVC: UITableViewController {

    var photos = [UnsplashPhoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        category(.inspirationalQuote)
        
    }
    
    func category(_ unsplashRoute: UnsplashRoute) {
        
        UnsplashService.shared.fetchFromUnsplash(for: unsplashRoute) { (photos) in
            DispatchQueue.main.async {
                guard let photos = photos else { return }
                self.photos = photos
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as? UnsplashPhotoCell else { return UITableViewCell() }

        let photo = photos[indexPath.row]
        cell.photo = photo
        

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
