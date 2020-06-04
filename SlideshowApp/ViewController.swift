//
//  ViewController.swift
//  SlideshowApp
//
//  Created by hana on 2020/05/31.
//  Copyright © 2020 hana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //再生ボタン
    @IBOutlet weak var startStopButtun: UIButton!
    
    //もどるボタン
    @IBOutlet weak var returnButtun: UIButton!
    
    //すすむボタン
    @IBOutlet weak var goButtun: UIButton!
    
    //画像
    @IBOutlet weak var picture: UIImageView!
    
    //ボタン切り替えフラグ作成
    var value: Bool = true
    
    //タイマー設置
    var timer: Timer!
    
    
    //再生ボタンをタップしたとき
    @IBAction func startStop(_ sender: Any) {
        let button = sender as! UIButton
        
        //▶︎表示の時は■に切り替える
        if value == true
        {
            //ボタンの表示を切り替える
            button.setTitle("■", for: .normal)
            //■になりました。
            value = false
            
            //すすむ/もどるボタンを無視する
            goButtun.isEnabled = false
            returnButtun.isEnabled = false
            
            //もどる・すすむボタンを非表示
            returnButtun.setTitleColor(UIColor.clear, for: .normal)
            goButtun.setTitleColor(UIColor.clear, for: .normal)
            
            //****スライドショー開始！****
            // タイマーを起動
            print("スライドショー開始")
            timer = Timer.scheduledTimer(timeInterval: 2.0, //2秒毎に
            target: self,                                   //ViewController内の
            selector: #selector(ViewController.onTimer),    //onTimer関数を呼び出す
            userInfo: nil,
            repeats: true)                                  //くりかえす
        }
        
        //■表示の時は▶︎に切り替える
        else if value == false
        {
            //ボタンの表示を切り替える
            button.setTitle("▶︎", for: .normal)
            //▶︎になりました。
            value = true
            
            //タイマーを停止
            timer.invalidate();
            print("スライドショー停止")
            
            //すすむ/もどるボタンを有効にする
            goButtun.isEnabled = true
            returnButtun.isEnabled = true
            //もどる・すすむボタンを再表示
            returnButtun.setTitleColor(UIColor.white, for: .normal)
            goButtun.setTitleColor(UIColor.white, for: .normal)
        }
        
    }
    
    /// Timerによって、一定の間隔で呼び出される関数
    @objc func onTimer(timer: Timer) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        print("2秒経過、次送り")
    }
    
    
//******************************************************************
    //画像を表示していくよ！
    //表示している画像の番号
    var dispImageNo = 0
    
    //表示している画像の番号を元に画像を表示する
    func displayImage() {

        // 画像の名前の配列
        let imageNameArray = [
            "001.JPG",
            "002.JPG",
            "003.JPG",
            "004.JPG",
        ]
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 3
            print("最後の画像にジャンプしました。")
        }

        // 範囲より上を指している場合、最初の画像を表示
        else if dispImageNo > 3 {
            dispImageNo = 0
            print("最初の画像にジャンプしました。")
        }

        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]

        // 画像を読み込み
        let image = UIImage(named: name)

        // Image Viewに読み込んだ画像をセット
        picture.image = image
    }
    
    
//******************************************************************
    //すすむ/もどるボタンを実装していくよ！
    //すすむボタンをタップした時
    @IBAction func go(_ sender: Any) {
        //スライドショー中じゃなければ
        if value == true {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        print("画像番号が1ふえた。")
        }
        
    }
    
    //もどるボタンをタップした時
    @IBAction func tapReturn(_ sender: Any) {
        //スライドショー中じゃなければ
        if value == true {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        print("画像番号が1へった。")
        }
        
    }
    
//******************************************************************
    //画像タップしたときの処理だよ！
    @IBAction func imageTap(_ sender: Any) {
        performSegue(withIdentifier: "imageTap", sender:nil)
    }
    
    //画面遷移のとき渡すデータ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // segueから遷移先のExpansionViewControllerを取得する
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        // 遷移先のExpansionViewControllerで宣言しているexpansionImageにUIImageを代入して渡す
        
        // 画像の名前の配列
        let imageName = [
            "001.JPG",
            "002.JPG",
            "003.JPG",
            "004.JPG",
        ]
        let name = imageName[dispImageNo]
        let image = UIImage(named: name)
        expansionViewController.image = (image)
        print("\(image)" + "が選択されました")
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("初期設定の画像を表示します。")
        let image = UIImage(named: "001.JPG")
        picture.image = image
    }

    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
        print("とじました。")
    }

}

