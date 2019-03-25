//
//  NewViewController.swift
//  NavigationDemo
//
//  Created by Treel Mobility  on 04/03/19.
//  Copyright © 2019 Treel Mobility . All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            print("notification: Keyboard will show")
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            searchBar.showsCancelButton = true
            
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            searchBar.showsCancelButton = false
            
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    @IBAction func backbuttonAc(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func cancelB(_ sender: Any) {
        dismiss(animated: true)
        NotificationCenter.default.post(name: .showHomeScreen, object: nil);
    }
    @IBAction func backB(_ sender: Any) {
        dismiss(animated: true)
        NotificationCenter.default.post(name: .showHomeScreen, object: nil);
        //        self.navigationController?.popViewController(animated: true)
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

extension NewViewController : UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 3{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell\(indexPath.row)")
            return cell!;
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        return cell!;
    }
    
}
extension NewViewController : UISearchBarDelegate{
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
       

    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       
        searchBar.resignFirstResponder()
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
     return true
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
       return true

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
}
