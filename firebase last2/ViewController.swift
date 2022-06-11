//
//  ViewController.swift
//  firebase last2
//
//  Created by 篠原優仁 on 2022/05/20.
//

import UIKit
import Firebase
import FirebaseStorageUI

class ViewController: UIViewController {

    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func uploadImagebutton(_ sender: Any) {
           uploadImage()
       }
       
    @IBAction func loadImage(_ sender: Any) {
           loadImage()
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Storageに画像を保存する
        func uploadImage() {
            //Storageの参照（"Item"という名前で保存）
            let storageref = Storage.storage().reference(forURL: "gs://fir-last2.appspot.com").child("Item")
            //画像
            let image = UIImage(named: "test.png")
            //imageをNSDataに変換
            let data = image!.jpegData(compressionQuality: 1.0)! as NSData
            //Storageに保存
            storageref.putData(data as Data, metadata: nil) { (data, error) in
                if error != nil {
                    return
                }
            }
            self.dismiss(animated: true, completion: nil)
        }
        
        //取得したURLを基にStorageから画像を取得する
        func loadImage() {
            //StorageのURLを参照
            let storageref = Storage.storage().reference(forURL: "gs://fir-last2.appspot.com").child("Item")
            //画像をセット
            imageView.sd_setImage(with: storageref)
        }



}

