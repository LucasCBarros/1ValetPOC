//
//  HomeViewController.swift
//  1ValetPOC
//
//  Created by Lucas C Barros on 16/04/22.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: Variables
    @IBOutlet weak var deviceCounter: UILabel!
    @IBOutlet weak var AddDeviceButton: UIButton!
    
    var viewModel: HomeViewModelProtocol
    
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deviceCounter.text = String(describing: viewModel.deviceAmount)
    }
    
    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = HomeViewModel()
        super.init(coder: coder)
    }
    
    //MARK: Methods and Actions
    @IBAction func tapAddDevice(_ sender: Any) {
        tapAddDevice()
    }
    
    func tapAddDevice() {
        // Go to another VC to add the information
        // For now just +1 in device counter
        viewModel.addDevice()
        viewDidLoad()
    }
}
