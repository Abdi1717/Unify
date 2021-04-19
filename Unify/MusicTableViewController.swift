//
//  MusicTableViewController.swift
//  Unify
//
//  Created by Abdinajib Mohamed on 4/2/21.
//

import Foundation
import UIKit
struct Song {
    let  songName: String
    var  upVotes: Int
    var  downVotes: Int
}

class MusicTableViewController: UITableViewController, UISearchBarDelegate{
    /*let endpoint = "https://www.rijksmuseum.nl/api/nl/collection?key=dU10s0eb&involvedMaker=Rembrandt+van+Rijn&p=1-99&ps=1-30"
      */
    
    var songRankings = [Song]()
    var filteredResults = [String]()
    var searching = false
    

      
    @IBOutlet weak var upVotes: UIButton!
    
     
      var songNameMusic = ""
      var songUpVoteMusic =  0
      var songDownVoteMusic = 0

      
    
      override func viewDidLoad() {
          super.viewDidLoad()
          self.tableView.delegate = self
        self.tableView.dataSource = self
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search for song"
        self.navigationItem.titleView = searchBar
        
        songRankings.append(Song(songName: "Old Time Road", upVotes: 34, downVotes: 2))
        songRankings.append(Song(songName: "Self Care", upVotes: 30, downVotes: 4))
        songRankings.append(Song(songName: "HIGHEST IN THE ROOM", upVotes: 45, downVotes: 3))
        songRankings.append(Song(songName: "monster", upVotes: 53, downVotes: 4))
        songRankings.append(Song(songName: "BEBE", upVotes: 89, downVotes: 4))
        songRankings.append(Song(songName: "BLACKJACK", upVotes: 43, downVotes: 5))
        songRankings.append(Song(songName: "No Sad No Bad", upVotes: 63, downVotes: 9))
        songRankings.append(Song(songName: "Noticed", upVotes: 78, downVotes: 8))
        songRankings.append(Song(songName: "Killamonjaro", upVotes: 93, downVotes: 0))
        songRankings.append(Song(songName: "Moonlight", upVotes: 23, downVotes: 7))
        
        songRankings.sort( by: {$0.upVotes > $1.upVotes })
        //  makeAPIRequest()
          
          
          /*
          
          for ArtObject in artWork {
              store [ArtObject.title] = ArtObject.webImage.url
          }
          let ref = Database.database().reference()
          ref.childByAutoId().setValue(store)
          // Do any additional setup after loading the view.
          */
         
      }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var currentResults = [String]()
        for songName in songRankings {
            
            if songName.songName.contains(searchBar.text!){
                currentResults.append(songName.songName)
            }
        }
        filteredResults = currentResults
        searching = true
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            self.searching = false
            self.tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
            self.searching = false
            self.tableView.reloadData()
        }
    }
    
   
      
    /*
      func makeAPIRequest(){
          let url = URL(string: endpoint)!
          let urlRequest = URLRequest(url: url)
          let task = URLSession.shared.dataTask(with: urlRequest){
              (data, reponse, error) in guard let data = data, error == nil else {
                  print("API request failed")
                  return
              }
          if let APIResponse = try? JSONDecoder().decode(APIResponse.self, from: data) {
              print(APIResponse)
              self.artWork = APIResponse.artObjects
              DispatchQueue.main.async {
                   self.tableView.reloadData()
              }
          }
          }
          self.tableView.reloadData()
          task.resume()
      }
      */
      // MARK: - Basic table view methods
      override func numberOfSections(in tableView: UITableView) -> Int {
          // TODO: How many sections? (Hint: we have 1 section and x rows)
          return 1
      }
      
      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          // TODO: How many rows in our section?
          //print(songRankings.count)
          return songRankings.count
      }
      
      
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
         /*
          let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
         // cell.textLabel?.text = newsItems[indexPath.row].name
          if let label = cell.viewWithTag(5) as?  UILabel { label.text = newsItems[indexPath.row].name}
          */
         
    
          //let newIteamVeed = newsItems[indexPath.row]
         
          //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
          let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
          //let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        cell1.upVoteButton.tag = indexPath.row
        cell1.downVoteButton.tag = indexPath.row
        cell1.upVoteButton.addTarget(self, action: #selector(self.upVote(_:)), for: .touchUpInside)
        cell1.downVoteButton.addTarget(self, action: #selector(self.downVote(_:)), for: .touchUpInside)
        cell1.likability.text =  "\(songRankings[indexPath.row].upVotes - songRankings[indexPath.row].downVotes)"
        //upVotes.addTarget(self, action: #selector(self.onClickedMapButton(_:)), for: .touchUpInside)
        //cell1.contentView.tag = indexPath.row;
        if let label = cell1.viewWithTag(5) as?  UILabel { label.text = "\(songRankings[indexPath.row].songName)"}
          
        if let label = cell1.viewWithTag(6) as?  UILabel { label.text = "\(songRankings[indexPath.row].upVotes - songRankings[indexPath.row].downVotes)"}
          
       
     
        //self.tableView.reloadData()
          return (cell1)
      }
   
    @objc func upVote(_ sender: UIButton) {

        let rowIndex: Int = sender.tag
        print("Before: \(songRankings[rowIndex].upVotes)")
        songRankings[rowIndex].upVotes = songRankings[rowIndex].upVotes + 1
        self.tableView.reloadData()
        print("\nAfter: \(songRankings[rowIndex].upVotes)")
        songRankings.sort( by: {$0.upVotes > $1.upVotes })
        }
    
    @objc func downVote(_ sender: UIButton) {
        let rowIndex: Int = sender.tag
        print("Before: \(songRankings[rowIndex].downVotes)")
        songRankings[rowIndex].downVotes = songRankings[rowIndex].downVotes + 1
        self.tableView.reloadData()
        print("\nAfter: \(songRankings[rowIndex].downVotes)")
        songRankings.sort( by: {$0.upVotes > $1.upVotes })
    }
    
      override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 100.0
      }
      
      
      // MARK: - Handle user interaction
   

      override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
         // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
          
         print(songRankings[indexPath.row].upVotes)
        
        
        
        
        
        
          songNameMusic = "\(songRankings[indexPath.row].songName)"
          songUpVoteMusic = songRankings[indexPath.row].upVotes
          songDownVoteMusic = songRankings[indexPath.row].downVotes
          self.performSegue(withIdentifier: "MusicToMusicCommunity", sender: self)
          
         
         
       
        
          
          self.tableView.reloadData()
          tableView.deselectRow(at: indexPath, animated: true)
          
          
      }
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             
             // get a reference to the second view controller
          if let secondViewController = segue.destination as? MusicCommunityTableViewController {
              
            secondViewController.SongTitle = songNameMusic
          
             
              
              
          }
          
         }
    
      
      // MARK: - Swipe to delete functionality
      override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          // TODO: If the editing style is deletion, remove the newsItem from your model and then delete the rows. CAUTION: make sure you aren't calling tableView.reloadData when you update your model -- calling both tableView.deleteRows and tableView.reloadData will make the app crash.
          if editingStyle == .delete {
            songRankings.remove(at: indexPath.row)
              tableView.deleteRows(at: [indexPath], with: .fade)
              }
          
      }
}
