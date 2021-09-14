//
//  StartViewController.swift
//  VideoSDK_Example
//
//  Created by VideoSDK Team Team on 13/09/21.
//  Copyright © 2021 Zujo Tech Pvt Ltd. All rights reserved.
//

import UIKit
import SwiftyJSON

/// Server Token URL
fileprivate let getTokenUrl = "https://dev-ios-api.zujonow.com/get-token"

class StartViewController: UIViewController {

    // MARK: - Properties
    
    private var serverToken = ""
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var meetingIdTextField: UITextField!
    
    @IBOutlet weak var startMeetingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startMeetingButton.layer.cornerRadius = 6
        
        // providing hard-coded meeting id for quick start
        nameTextField.text = "iOS App"
        meetingIdTextField.text = "lm7t-c3w0-dspp"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        URLSession.shared.dataTask(with: URL(string: getTokenUrl)!) { data, response, error in
            if let data = data, let json = try? JSON(data: data) {
                self.serverToken = json["token"].stringValue
            }
        }
        .resume()
    }
    
    // MARK: - Actions
    
    @IBAction func startMeetingButtonTapped(_ sender: Any) {
        nameTextField.resignFirstResponder()
        
        self.performSegue(withIdentifier: "StartMeeting", sender: nil)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let meetingViewController = segue.destination as? MeetingViewController else {
            return
        }
        
        meetingViewController.meetingData = MeetingData(
            token: serverToken,
            name: nameTextField.text ?? "Guest",
            meetingId: meetingIdTextField.text ?? "",
            micEnabled: true,
            cameraEnabled: true
        )
    }
}

extension StartViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if textField == nameTextField {
            meetingIdTextField.becomeFirstResponder()
        }
        return true
    }
}
