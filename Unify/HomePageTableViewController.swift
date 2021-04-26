//
//  HomePageTableViewController.swift
//  Unify
//
//  Created by Abdinajib Mohamed on 4/19/21.
//

import Foundation
import UIKit


class HomePageTableViewController: UITableViewController, UISearchBarDelegate{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: How many sections? (Hint: we have 1 section and x rows)
        return 1
    }
    
    
  
    
    
    
    @IBAction func music(_ sender: Any) {
        self.performSegue(withIdentifier: "HomePageToMusic", sender: self)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     self.performSegue(withIdentifier: "HomePageToMusic", sender: self)
        
       
        self.tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
     
      
        

        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
        
       }
    
    
}
