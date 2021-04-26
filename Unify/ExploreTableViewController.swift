//
//  ExploreTableViewController.swift
//  Unify
//
//  Created by Abdinajib Mohamed on 4/24/21.
//

import Foundation
import UIKit




class ExploreTableViewController: UITableViewController, AddEventDelegate {
    var EventsArray = [Events]()
    
    var eventNameExplore = ""
    var eventDetails = ""
    var image = UIImage.self
    
    
    func didCreate(_ event: Events) {
        let vc = AddEventTableView()
        //event
          vc.dismiss(animated: true, completion: nil)
          navigationController?.dismiss(animated: true, completion: nil)
        EventsArray.append(event)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: How many sections? (Hint: we have 1 section and x rows)
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: How many rows in our section?
        
        return EventsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
    
       
        
       // if let label = cell.viewWithTag(5) as?  UILabel { label.text =
            
         //  "\(EventsArray[indexPath.row].firstName), \(EventsArray[indexPath.row].lastName)"}
        
        
        
        return (cell)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    // MARK: - Handle user interaction
 

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
       /*
        nameCTVC = "\(contacts[indexPath.row].firstName), \(contacts[indexPath.row].lastName)"
        EmailCTVC =  contacts[indexPath.row].email
        companyCTVC = contacts[indexPath.row].company
        phoneNumberCTVC = contacts[indexPath.row].phoneNumber
 */
 self.performSegue(withIdentifier: "EventDetailsPage", sender: self)
       
 
        
        self.tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           // get a reference to the second view controller
        if let secondViewController = segue.destination as? ExploreDetailsTableViewController {
            
           // secondViewController.name = nameCTVC
            //secondViewController.Email = EmailCTVC
           // secondViewController.company = companyCTVC
            //secondViewController.phoneNumber = phoneNumberCTVC
            
            
        }
        
     if let thirdViewController = segue.destination as? AddEventTableView {
        
        thirdViewController.delegate = self
     
     }
          
       }
  
    
}
