//
//  ViewController.swift
//  CQAutoLayout
//
//  Created by Y_CQ on 2017/7/22.
//  Copyright © 2017年 YCQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.test()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func test() {
//        let btnTest = self.view.createSubButton()
//        btnTest.left(10).width(70).top(50).height(40)
//        btnTest.backgroundColor = UIColor.red
//        btnTest.setTitle("click me", for: UIControlState.normal)
//        btnTest.titleLabel?.font = UIFont.systemFont(ofSize: 11)
//        btnTest._model = ["info": "每个view都可以动态的添加一个自己的附加属性保存一些信息，在需要的时候可以很方便的取出来"]
//        btnTest.addTarget(self, action: #selector(self.btnTestClick(_:)), for: UIControlEvents.touchUpInside)
        
        let testStr = "测试label的自动布局，\n测试label的自动布局，\n测试label的自动布局，\n测试label的自动布局，\n测试label的自动布局"
        //MARK: 最基础的
        let myView = self.view.createSubView()
        //距离父控件左100，右100，上20
        myView.left(100).right(100).top(20)
        myView.backgroundColor = UIColor.red
        
        let myIv = myView.createSubImageView()
        myIv.left(20).right(20).top(20).height(60)
        myIv.backgroundColor = UIColor.green
        myIv.image = UIImage(named: "IMG_5108.JPG")
        myIv.contentMode = .scaleAspectFit

        let myLabel = myView.createSubLabel()
        myLabel.font = UIFont.systemFont(ofSize: 12)
        myLabel.numberOfLines = 0
        myLabel.text = "测试"
        myLabel.left(20).right(20).bottom(20, toItem: myIv).bottom(20)
        myLabel.backgroundColor = UIColor.green
        
        
        
        
        //MARK: 实现scrollview的自动布局
        let myScv = self.view.createSubScrollView()
        myScv.left(100).right(100).bottom(30, toItem: myView).height(150)
        myScv.backgroundColor = UIColor.brown
        
        //
        let vContent = myScv.createSubView()
        //MARK: 需要给定宽度
        vContent.left(0).right(0).top(0).bottom(0).width(self.view.bounds.size.width - 200)
        
        let myLabel1 = vContent.createSubLabel()
        myLabel1.left(10).right(10).top(10)
        myLabel1.font = UIFont.systemFont(ofSize: 12)
        myLabel1.numberOfLines = 0
        myLabel1.text = testStr
        myLabel1.backgroundColor = UIColor.green
        
        let myIv1 = vContent.createSubImageView()
        myIv1.left(20).right(20).bottom(20, toItem: myLabel1).bottom(40).height(100)
        myIv1.backgroundColor = UIColor.green
        myIv1.image = UIImage(named: "IMG_5108.JPG")
        myIv1.contentMode = .scaleAspectFit
        
        
        //MARK: 实现view的自动布局，适用于tableviewCell
        let vContent1 = self.view.createSubView()
        vContent1.left(100).right(100).bottom(30, toItem: myScv)
        vContent1.backgroundColor = UIColor.cyan
        
        let myLabel2 = vContent1.createSubLabel()
        myLabel2.left(10).right(10).top(10)
        myLabel2.font = UIFont.systemFont(ofSize: 12)
        myLabel2.numberOfLines = 0
        myLabel2.text = testStr
        myLabel2.backgroundColor = UIColor.green
        
        let myIv2 = vContent1.createSubImageView()
        myIv2.left(20).right(20).bottom(20, toItem: myLabel2).bottom(20).height(100)
        myIv2.backgroundColor = UIColor.green
        myIv2.image = UIImage(named: "IMG_5108.JPG")
        myIv2.contentMode = .scaleAspectFit

    }
    
    func btnTestClick(_ btn: UIButton) {
        let model = btn._model ?? [:]
        print("\(model)")
    }
}

