//
//  MainViewController.swift
//  AppGhichu
//
//  Created by nguyễn xuân chiến on 4/9/25.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 29/255, alpha: 1)

        // Do any additional setup after loading the view.
    }
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let newPostVC = NewPostViewController(nibName: "NewPostViewController", bundle: nil)
        self.present(newPostVC, animated: true, completion: nil)
    }

   

}
