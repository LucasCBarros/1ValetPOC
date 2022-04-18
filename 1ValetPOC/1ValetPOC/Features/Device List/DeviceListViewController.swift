//
//  DeviceListViewController.swift
//  1ValetPOC
//
//  Created by Lucas C Barros on 16/04/22.
//

import UIKit

class DeviceListViewController: UIViewController {
    
    // MARK: Variables
    @IBOutlet weak var deviceSearchBar: UISearchBar!
    @IBOutlet weak var devicesList: UITableView!
    
    var viewModel = DeviceListViewModel()
    var searchedDevices: [DeviceModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchedDevices = viewModel.devices
    }
}

// MARK: - Search bar Methods
extension DeviceListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        searchFor(searchText)
        
        // END reload list
        self.devicesList.reloadData()
    }
    
    func searchFor(_ searchText: String) {
        // Start with Empty search list
        searchedDevices = []
        
        // IF search is empty THEN keep all devices
        if searchText == "" {
            searchedDevices = viewModel.devices
        
        // ELSE filter devices WITH search text
        } else {
            let numberOfDevices = viewModel.devices?.count ?? 0
            
            for deviceIndex in 0 ..< numberOfDevices {
                if let device = viewModel.devices?[deviceIndex],
                   let deviceName = device.name,
                   deviceName.lowercased().contains(searchText.lowercased()) {
                    
                    searchedDevices?.append(device)
                }
            }
        }
    }
}

// MARK: - Tableview Methods
extension DeviceListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Number of devices
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedDevices?.count ?? 0
    }
    
    // Device list cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell")! as UITableViewCell
        
        cell.textLabel?.text = searchedDevices?[indexPath.row].name
        
        return cell
    }
    
    // WHEN tap in row THEN open device detail controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let deviceDetailViewModel = DeviceDetailViewModel(device: searchedDevices?[indexPath.row])
        if let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DeviceDetailViewController") as? DeviceDetailViewController {
            
            detailViewController.viewModel = deviceDetailViewModel
            navigationController?.pushViewController(detailViewController, animated: true)
        }
        
    }
}
