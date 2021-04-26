//
//  AddEventTableView.swift
//  Unify
//
//  Created by Abdinajib Mohamed on 4/25/21.
//

import Foundation
import UIKit

protocol AddEventDelegate: class {
    func didCreate(_ event: Events)
}

class AddEventTableView: UIViewController {
    weak var delegate: AddEventDelegate?
    
    
    @IBOutlet weak var EventName: UITextField!
    @IBOutlet weak var EventDate: UITextField!
    @IBOutlet weak var EventLocation: UITextField!
    @IBOutlet weak var EventTime: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func addPhoto(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
       
    
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
     }
    
    
    @IBAction func upload(_ sender: UIBarButtonItem) {
        if createNewEvent() != nil {
            self.delegate?.didCreate(createNewEvent()!)
        }
        dump(createNewEvent())
            
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
    
    
    func createNewEvent() -> Events? {
       
        if  EventName.text == nil || EventDate.text == nil || EventTime.text == nil ||  EventLocation.text == nil {
          return  nil
        }
        
        else {
            
            return Events(EventName: EventName.text!, upVotes: 0, downVotes: 0, detailsOfEvent: "\(EventLocation.text!), \(EventDate.text!), \(EventTime.text!)")
        }
        
          
            
    }
    
    
}

extension AddEventTableView :UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
