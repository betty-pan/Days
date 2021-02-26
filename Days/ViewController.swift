//
//  ViewController.swift
//  Days
//
//  Created by Betty Pan on 2021/2/25.
//

import UIKit

class ViewController: UIViewController {
    //設定區View
    @IBOutlet weak var settingView: UIView!
    
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var selectDatePicker: UIDatePicker!
    @IBOutlet weak var selectDateBtn: UIButton!
    @IBOutlet weak var enterDateBtn: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    
    //scrollView設定背景
    @IBOutlet weak var scrollViewView: UIView!
    @IBOutlet var backgroundBtn: [UIButton]!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    
    //設定完之畫面
    @IBOutlet var resultView: UIView!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var totalDaysLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet var needColorChangeLabels: [UILabel]!
    
    
    let dateFormatter = DateFormatter()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerView.isHidden = true
        resultView.isHidden = true
        backgroundImageView.image = UIImage(named: "inRelationship.jpg")
        changeTextColor()
    }
    //因背景顏色不同(字會消失在背景顏色裡)，設func更改textColor
    func changeTextColor() {
        if backgroundImageView.image == UIImage(named: "family.jpg") {
            selectedDateLabel.textColor = UIColor.black
            titleLabel.textColor = UIColor.black
            totalDaysLabel.textColor = UIColor.black
            yearLabel.textColor = UIColor.black
            monthLabel.textColor = UIColor.black
            dayLabel.textColor = UIColor.black
            for i in needColorChangeLabels{
                i.textColor = UIColor.black
            }
        }else{
            selectedDateLabel.textColor = UIColor.white
            titleLabel.textColor = UIColor.white
            totalDaysLabel.textColor = UIColor.white
            yearLabel.textColor = UIColor.white
            monthLabel.textColor = UIColor.white
            dayLabel.textColor = UIColor.white
            
            for i in needColorChangeLabels{
                i.textColor = UIColor.white
            }
        }
    }
    
    @IBAction func changeBackground(_ sender: UIButton) {
        
        if sender == backgroundBtn[0] {
            backgroundImageView.image = UIImage(named: "graduation.jpg")
            backgroundColorView.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 152/255, green: 183/255, blue: 165/255, alpha: 1))
        }else if sender == backgroundBtn[1] {
            backgroundImageView.image = UIImage(named: "inRelationship.jpg")
            backgroundColorView.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 191/255, green: 179/255, blue: 165/255, alpha: 1))
        }else if sender == backgroundBtn[2] {
            backgroundImageView.image = UIImage(named: "wedding.jpg")
            backgroundColorView.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 224/255, green: 200/255, blue: 176/255, alpha: 1))
        }else if sender == backgroundBtn[3]{
            backgroundImageView.image = UIImage(named: "family.jpg")
            backgroundColorView.backgroundColor = UIColor.white
        }else {
            backgroundImageView.image = UIImage(named: "female.jpg")
            backgroundColorView.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 171/255, green: 169/255, blue: 156/255, alpha: 1))
        }
        changeTextColor()
        
    }
    
    @IBAction func selectDate(_ sender: Any) {
        datePickerView.isHidden = false
        
    }
    @IBAction func enterDate(_ sender: Any) {
        dateFormatter.dateFormat = "y-M-d"
        let selectedDate = selectDatePicker.date
        let selectedDateString = dateFormatter.string(from: selectedDate)
        selectDateBtn.setTitle("\(selectedDateString)", for: .normal)
        selectedDateLabel.text = "\(selectedDateString)"
        datePickerView.isHidden = true
        
        let interval = -Int(selectedDate.timeIntervalSinceNow)
        let totalDays = interval/60/60/24
        let years = totalDays/365
        let months = totalDays%365/31
        let days = totalDays%365%31
        
        totalDaysLabel.text = "\(totalDays)"
        yearLabel.text = "\(years)"
        monthLabel.text = "\(months)"
        dayLabel.text = "\(days)"
    }
    
    @IBAction func doneSetting(_ sender: Any) {
        titleLabel.text = titleTextField.text
        if settingView.isHidden == false {
            settingView.isHidden = true
            scrollViewView.isHidden = true
            resultView.isHidden = false
            
        }else{
            settingView.isHidden = false
            scrollViewView.isHidden = false
            resultView.isHidden = true
        }
        
    }
    
}

