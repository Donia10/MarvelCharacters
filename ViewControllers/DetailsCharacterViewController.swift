//
//  DetailsCharacterViewController.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 20/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit

class DetailsCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)

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
