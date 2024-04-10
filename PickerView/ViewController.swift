//
//  ViewController.swift
//  PickerView
//
//  Created by TJ on 2022/04/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
 
    var imageFileName = ["w1.jpg","w2.jpg","w3.jpg","w4.jpg","w5.jpg","w6.jpg","w7.jpg","w8.jpg","w9.jpg","w10.jpg"]
    var imageArray = [UIImage?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<imageFileName.count{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
   
        lblImageFileName.text = imageFileName[0]
        imgView.image = imageArray[0]
        
        //**********extension후 반드시 연결 해야함 ***********
        pickerImage.dataSource = self
        pickerImage.delegate = self
    }


}
//dataSource 외형만들기
extension ViewController : UIPickerViewDataSource{
    
    //pickerView의 컬럼 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    //출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
}
//delegate 내부만들기
extension ViewController : UIPickerViewDelegate{
    
////    //Piker View에 파일 이름 넣기
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    //이름 보여주기
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imgView.image = imageArray[row]

    }
    //그림 이미지 집어넣기
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
//
//        //여기다 쓰면 Picker고를때 그림도 같이 돈다
//        lblImageFileName.text = imageFileName[row]
//        imgView.image = imageArray[row]
       
        return imageView
    }
}

