# AutoLayout
swift3.0轻量级的自动布局
## 用法
*       
        //MARK: 最基础的
        let myView = self.view.createSubView()
        //距离父控件左100，右100，上20，高60
        myView.left(100).right(100).top(20).height(100)
        myView.backgroundColor = UIColor.red
![image](https://github.com/wordlesser/AutoLayout/blob/master/Source/1.png)
*
        //MARK: 由子控件确定父控件大小
        let myView = self.view.createSubView()
        //距离父控件左100，右100，上20
        myView.left(100).right(100).top(20)
        myView.backgroundColor = UIColor.red
        
        let myIv = myView.createSubImageView()
        myIv.left(20).right(20).top(20).height(60)
        myIv.backgroundColor = UIColor.green
        myIv.image = UIImage(named: "IMG_5108.JPG")
        myIv.contentMode = .scaleAspectFit

        let mylabel = myView.createSubLabel()
        //由于mylabel距离父控件的下间距和与上边myIv的距离已经确定而且label会根据自身文字属性确定自身高度，因此父控件myView的高度就被确定了
        mylabel.left(20).right(20).bottom(20, toItem: myIv).bottom(20)
        //但是如果label换成普通view需要明确告知其高度即 mylabel.left(20).right(20).bottom(20, toItem: myIv).bottom(20).height(x)
        myLabel.numberOfLines = 0
        myLabel.text = "test"
        mylabel.backgroundColor = UIColor.green
![image](https://github.com/wordlesser/AutoLayout/blob/master/Source/2.png)
*
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
![image](https://github.com/wordlesser/AutoLayout/blob/master/Source/scrollView.gif)
*
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
![image](https://github.com/wordlesser/AutoLayout/blob/master/Source/3.png)
