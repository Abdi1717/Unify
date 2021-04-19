//
//  MusicCommunityTableView.swift
//  Unify
//
//  Created by Abdinajib Mohamed on 4/2/21.
//

import Foundation
import UIKit

struct Community {
    let  user: String
    var  likes: Int
    
}




class MusicCommunityTableViewController: UITableViewController {
   // private var playerView: PlayerView = PlayerView()
    //private var videoPlayer:VideoPlayer?
    
    var communityList = [Community]()

    
    
    
    @IBOutlet weak var SongTitleName: UILabel!
    var SongTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SongTitleName.text = SongTitle
        
        communityList.append(Community(user: "Sam", likes: 2))
        communityList.append(Community(user: "Jon", likes: 3))
        communityList.append(Community(user: "Blake", likes: 6))
        
        self.tableView.reloadData()
       // view.addSubview(playerView)
       // preparePlayer()

        // set Constraints (if you do it purely in code)
       // playerView.translatesAutoresizingMaskIntoConstraints = false
       // playerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10.0).isActive = true
       // playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
       // playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
        //playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10.0).isActive = true
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: How many sections? (Hint: we have 1 section and x rows)
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: How many rows in our section?
        
        return communityList.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! CustomTableViewCell
        cell.HeartButtonMusicCommunity.tag = indexPath.row
     
        cell.HeartButtonMusicCommunity.addTarget(self, action: #selector(self.heartCount(_:)), for: .touchUpInside)
        cell.heartCountMusicCommunity.text = "\(communityList[indexPath.row].likes)"
        
        //if let label = cell.viewWithTag(11) as?  UILabel { label.text = "22"}
          
        if let label = cell.viewWithTag(12) as?  UILabel { label.text = "33"}
        
       /*
        cell.textLabel?.text = newsItems[indexPath.row].name
        if let label = cell.viewWithTag(5) as?  UILabel { label.text = newsItems[indexPath.row].name}
        */
       
  
        //let newIteamVeed = newsItems[indexPath.row]
       
   
        
     
   
      //self.tableView.reloadData()
        return (cell)
    }
    
    @objc func heartCount(_ sender: UIButton) {

        let rowIndex: Int = sender.tag
        print("Before: \(communityList[rowIndex].likes)")
        communityList[rowIndex].likes = communityList[rowIndex].likes + 1
        self.tableView.reloadData()
        print("\nAfter: \(communityList[rowIndex].likes)")
        communityList.sort( by: {$0.likes > $1.likes })
        }
  
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
    
    // MARK: - Handle user interaction

    

        
       
    
    
    
    
    
    
   


}
