//
//  NewPostViewController.swift
//  AppGhichu
//
//  Created by nguyễn xuân chiến on 10/9/25.
//

import UIKit

class NewPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func newPostButtonTapped(_ sender: UIButton) {
        let composeVC = ComposeViewController(nibName: "ComposeViewController", bundle: nil)
        composeVC.modalPresentationStyle = .fullScreen
        self.present(composeVC, animated: true, completion: nil)
    }
    

}
