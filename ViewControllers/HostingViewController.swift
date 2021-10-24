//
//  HostingViewController.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 23/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit
import SwiftUI
class HostingViewController: UIHostingController<CharacterDetails> {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: CharacterDetails(character: dummyCharacter))
    }

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
