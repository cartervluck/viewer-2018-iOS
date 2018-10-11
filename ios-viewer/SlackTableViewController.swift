//
//  SlackTableViewController.swift
//  ios-viewer
//
//  Created by Carter Luck on 2/17/18.
//  Copyright © 2018 brytonmoeller. All rights reserved.
//

import UIKit

class SlackTableViewController: ArrayTableViewController {
    
    var firebase : DatabaseReference = Database.database().reference()
    
    override func viewDidLoad() {
        self.keyboardType = UnsafeMutablePointer<UIKeyboardType>.allocate(capacity: UIKeyboardType.default.rawValue)
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector:#selector(SlackTableViewController.reloadTableView), name:NSNotification.Name(rawValue: "updateLeftTable"), object:nil)
    }
    
    @objc func reloadTableView(_ note: Notification) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if filteredArray != nil {
            count = filteredArray.count
        } else {
            count = (self.firebaseFetcher?.slackProfiles.count)!
        }
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SlackTableViewCell = tableView.dequeueReusableCell(withIdentifier: "slackTableViewCell", for: indexPath) as! SlackTableViewCell
        if let castFiltered = filteredArray as? ([SlackProfile]!), filteredArray != nil {
            cell.displayNameLabel.text = Array(castFiltered!)[indexPath.row].name
            cell.slackUsernameLabel.text = Array(castFiltered!)[indexPath.row].tag
        } else {
            cell.displayNameLabel.text = Array(self.firebaseFetcher!.slackProfiles.values)[indexPath.row].name
            cell.slackUsernameLabel.text = Array(self.firebaseFetcher!.slackProfiles.values)[indexPath.row].tag
        }
        return cell
    }
    
    override func filteredArray(forSearchText text: String!, inScope scope: Int) -> [Any]! {
        let filtered = self.firebaseFetcher?.slackProfiles.filter({ (p) -> Bool in
            if p.value.name?.lowercased().range(of: text.lowercased()) != nil { return true }
            if p.value.tag?.lowercased().range(of: text.lowercased()) != nil { return true }
            return false
        })
        var arrayed : [Any] = []
        for i in (filtered?.values)! {
            arrayed.append(i)
        }
        return arrayed
    }
    
    override func cellIdentifier() -> String! {
        return "SlackTableViewCell"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let defaults = UserDefaults.standard
        let token = defaults.value(forKey: "NotificationToken")
        var existingSlack : String?
        for i in 0..<Array(self.firebaseFetcher!.activeProfiles.values).count {
            if Array(self.firebaseFetcher!.activeProfiles.values)[i].appToken == token as? String {
                //this is really ugly and it will probably crash...
                existingSlack = (self.firebaseFetcher?.activeProfiles as! NSDictionary).allKeys(for: Array(self.firebaseFetcher!.activeProfiles.values)[i])[0] as? String
            }
        }
        var newSlack: String? = ""
        if self.filteredArray != nil {
            newSlack = (self.firebaseFetcher?.slackProfiles as! NSDictionary).allKeys(for: self.filteredArray[indexPath.row])[0] as? String
        } else {
            newSlack = (self.firebaseFetcher?.slackProfiles as! NSDictionary).allKeys(for: Array(self.firebaseFetcher!.slackProfiles.values)[indexPath.row])[0] as? String
        }
        self.firebaseFetcher?.currentMatchManager.slackId = newSlack
        let preAlert = UIAlertController(title: "Notified in Advance", message: "How many matches in advance do you want to be notified?", preferredStyle: .alert)
        preAlert.addTextField(configurationHandler: { (field) in
            field.keyboardType = .numberPad
        })
        preAlert.addAction(UIAlertAction(title:"Submit",style:.default,handler: { (action) in
            self.firebaseFetcher?.currentMatchManager.preNotify = Int((preAlert.textFields?[0].text)!) ?? 0
            if existingSlack == nil {
                self.firebase.child("activeSlackProfiles").child(newSlack!).child("appToken").setValue(token)
                self.firebase.child("activeSlackProfiles").child(newSlack!).child("notifyInAdvance").setValue(self.firebaseFetcher?.currentMatchManager.preNotify)
            } else {
                self.firebase.child("activeSlackProfiles").child(existingSlack!).removeValue()
                self.firebaseFetcher.activeProfiles[existingSlack!] = nil
                self.firebase.child("activeSlackProfiles").child(newSlack!).child("appToken").setValue(token)
                self.firebase.child("activeSlackProfiles").child(newSlack!).child("notifyInAdvance").setValue(self.firebaseFetcher?.currentMatchManager.preNotify)
            }
            self.firebaseFetcher?.getSlackProfiles()
            self.searchController.searchBar.text = ""
            self.searchController.dismiss(animated: true, completion: {() in
                //nada
            })
            self.dataArray = self.loadDataArray(false)
            self.reloadTableView(Notification(name: Notification.Name(rawValue: "boi")))
            self.firebase.child("activeSlackProfiles").child(newSlack!).observeSingleEvent(of: .value, with: { (snap) in
                if let arrayThing = snap.childSnapshot(forPath: "starredMatches").value as? [Int] {
                    var array2 : [Int] = []
                    for i in arrayThing {
                        array2.append(i)
                    }
                    self.firebaseFetcher.currentMatchManager.starredMatchesArray = array2
                } else {
                    self.firebaseFetcher.currentMatchManager.starredMatchesArray = []
                }
            })
        }))
        self.present(preAlert, animated: true, completion: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
