//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by hana on 2020/05/31.
//  Copyright © 2020 hana. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {
    
    //imageViewを入れる
    @IBOutlet weak var expansionView: UIImageView!
    //渡された画像の名前を入れる箱
    var image:UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 上記では、画像名をnilで宣言していたが、
        // 1画面目のViewControllerから遷移するときにprepareForSegueで
        // imageの値を新たに代入されたので名前が入っている
        expansionView.image = self.image
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
