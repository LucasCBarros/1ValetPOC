//
//  DeviceDetailViewController.swift
//  1ValetPOC
//
//  Created by Lucas C Barros on 16/04/22.
//

import UIKit

class DeviceDetailViewController: UIViewController {
    
    // MARK: Variables
    @IBOutlet weak var devicePhoto: UIImageView!
    
    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var deviceID: UILabel!
    @IBOutlet weak var isFavoriteDevice: UILabel!
    
    // Will receive the viewModel from Device List controller
    var viewModel: DeviceDetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - UI Setup
extension DeviceDetailViewController {
    func setupUI() {
        setupViewContent()
        setupPhotoView()
    }
    
    func setupPhotoView() {
        devicePhoto.layer.borderWidth = 5
        devicePhoto.layer.masksToBounds = false
        devicePhoto.layer.borderColor = UIColor.white.cgColor
        devicePhoto.layer.cornerRadius = devicePhoto.frame.height/2
        devicePhoto.clipsToBounds = true
    }
    
    func setupViewContent() {
        deviceName.text = viewModel?.device?.name
        deviceID.text = String(describing: viewModel?.device?.id ?? 0)
        isFavoriteDevice.text = String(describing: viewModel?.device?.isFavorite ?? false)
        devicePhoto.image = UIImage(named: viewModel?.device?.image ?? "placeholder")
    }
}
