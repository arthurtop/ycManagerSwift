//
//  NetworkTools.swift
//  Alamofire的测试
//
//  Created by 1 on 16/9/19.
//  Copyright © 2016年 . All rights reserved.
//

import UIKit
import Alamofire


enum MethodType {
    case get
    case post
}

class NetworkTools {
    
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 2.发送网络请求
        
        
        AF.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            
            // 3.获取结果
//            guard var result = response.result else {
//                print(response.result)
//                return
//            }
            
            // 4.将结果回调出去
            finishedCallback(response.result)
            
        }
    }
    
    /*
    ///
    /// - Parameters:
    ///   - url: 地址
    ///   - image: 图片
    ///   - params: 参数
    ///   - imageName: 图片名字
    ///   - isShowHud: 是否显示HUD
    ///   - progressClosure: 进度回调
    ///   - successClosure: 成功回调
    func uploadImage(url: String,image: UIImage,params: [String:String],imageName:String,isShowHud:Bool,progressClosure:@escaping((_ progress:Double) ->Void),successClosure:@escaping((_ result:[String:AnyObject]) -> ()))
    {
      //压缩图片 可自定义
        let imageData : Data = self.compressImage(image: image, maxLength: 500)!
        let urlString = getUrl(url: url)
        let httpHeaders = HTTPHeaders([:])
        
        if isShowHud {
            HUD.flash(.progress)
            
        }

        AF.upload(multipartFormData: { multiPart in
            for p in params {
                multiPart.append("\(p.value)".data(using: String.Encoding.utf8)!, withName: p.key)
            }
            multiPart.append(imageData, withName: "attach", fileName: "\(imageName).jpg", mimeType: "image/jpg")
        }, to: urlString, method: .post, headers: httpHeaders) .uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
            progressClosure(progress.fractionCompleted)
            
        }).responseJSON(completionHandler: { data in
            print("upload finished: \(data)")

        }).response { (response) in
            
            if isShowHud {
                HUD.hide()
            }
            switch response.result {
            case .success(let dataObj):
                
                print("upload success result: \(dataObj)")
                successClosure(self.dataToDictionary(data: dataObj!)! as [String : AnyObject])

            case .failure(let err):
                print("upload err: \(err)")
            }
        }

    }

    //get  post 请求
        func request(paramenters: [String: AnyObject],methods: Method, urlStr:String,isShowHud: Bool, successBolck:@escaping ((_ result: [String: AnyObject]) -> ()), faill:@escaping((_ errorStr:[String : AnyObject]) ->()))
                  {
        //判断是需要get请求还是post请求
        var netWorkMethod:HTTPMethod = .get
        switch methods
        {
        case .GET:
            netWorkMethod = .get
            break
        case .POST:
            netWorkMethod = .post
            break
        default:
            netWorkMethod = .get
            break
        }
        let endUrl = getUrl(url: urlStr)
        print("请求URL:\(endUrl)   \n请求参数:\(paramenters)\n请求类型:\(methods)")
        
        if isShowHud {
            HUD.flash(.progress)

        }
        AF.request(endUrl, method: netWorkMethod, parameters:paramenters).responseJSON { response in
            
            if isShowHud {
                HUD.hide()
            }


            switch response.result
            {
            case .success(let value):
                
         
                print(value)
                successBolck(value as! [String : AnyObject])
                break
                
            case .failure( let failDic):
                print(failDic)

                break
                
                
                
            }
         

            
        }

    }
    
    */
    
    
    
    
}


