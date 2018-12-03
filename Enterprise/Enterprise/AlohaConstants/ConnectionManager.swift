//
//  ConnectionManager.swift
//  sureEcosystem Inspect
//
//  Created by admin on 04/06/18.
//

import UIKit
import MobileCoreServices

class ConnectionManager: NSObject {
    
    
    class func callPostMethodWith(url: String, postDict: NSDictionary, completionHandler : @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error? )->Void){
        
        //self.startActivity()
        
        //let postString = self.getPostDataToSend()
        
        let finalUrlString = BASE_URL + url
        
        let finalUrl = URL(string: finalUrlString)!
       
        let authToken : String? = UserDefaults.standard.value(forKey: AUTH_TOKEN_KEY) as? String
        
        var finalAuthToken : String?
        
        if authToken != nil {
            finalAuthToken = "Bearer " + authToken!
        }
    
        var request = URLRequest(url: finalUrl)
       // request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        
        if url == "/token"{
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }else{
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(finalAuthToken, forHTTPHeaderField: "Authorization")
        }
        
        
        let data = try! JSONSerialization.data(withJSONObject: postDict, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        
        if url == "/token"{
            
            let str : String = self.getLoginParams(dict: postDict)
            let data : Data = str.data(using: String.Encoding.utf8)!
            request.httpBody = data as Data
        }else{
            request.httpBody = json?.data(using: String.Encoding.utf8.rawValue, allowLossyConversion: false)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            completionHandler(data, response, error)
        }
        task.resume()
    }
    
    
    
    
    class func callGetMethodWith(url: String,  completionHandler : @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error? )->Void){
        
        //self.activityIndicator.startAnimating()
        
        let finalUrlString = BASE_URL + url
        
        let urlAppended = finalUrlString
        
        let url = URL(string: urlAppended)
        
        let authToken : String? = UserDefaults.standard.value(forKey: AUTH_TOKEN_KEY) as? String
        
        var finalAuthToken : String?
        
        if authToken != nil {
            finalAuthToken = "Bearer " + authToken!
        }
        
        let boundry : String = ""
        let contentType : String = String(format: "multipart/form-data; boundary=%@", boundry)
        
        var urlRequest = URLRequest(url : url!)
        
        urlRequest.httpMethod = "GET"
        
        urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        urlRequest.setValue(finalAuthToken, forHTTPHeaderField: "Authorization")
        
        // set up the session
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30.0
        config.timeoutIntervalForResource = 60.0
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
            completionHandler(data, response, error)
            
        })
        task.resume()
    }
    
    class func callMultiPartPostMethodWith(url: String, postDict: NSDictionary, completionHandler : @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error? )->Void){
        
        //self.startActivity()
        
        //let postString = self.getPostDataToSend()
       
        
        let finalUrlString = BASE_URL + url + getDocumentParams(dict: postDict)
        
        
        
        let finalUrl = URL(string: finalUrlString)!
        
        let authToken : String? = UserDefaults.standard.value(forKey: AUTH_TOKEN_KEY) as? String
        
        var finalAuthToken : String?
        
        if authToken != nil {
            finalAuthToken = "Bearer " + authToken!
        }
        
        var request = URLRequest(url: finalUrl)
        // request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        
        let boundry : String = ""
        let contentType : String = String(format: "multipart/form-data; boundary=%@", boundry)
        
       request.setValue(contentType, forHTTPHeaderField: "Content-Type")
       request.setValue(finalAuthToken, forHTTPHeaderField: "Authorization")
       // ["inspectionQueId" as NSCopying,"completed_on" as NSCopying, "fileURL" as NSCopying])
        
 
       let filePath: String  = (postDict.object(forKey: "fileURL") as! String)
       let url = URL(fileURLWithPath: filePath)
       let filename = url.lastPathComponent
       // let data = try? Data(contentsOf: url)
       let mimetype = mimeTypeForPath(path: filePath)

       var fileData : NSData?
        
       if let fileContents = FileManager.default.contents(atPath: filePath) {
                 fileData = fileContents as NSData
              }
        
        
        var error: NSError?
        let boundaryStart = "--\(boundry)\r\n"
        let boundaryEnd = "--\(boundry)--\r\n"
        let contentDispositionString = "Content-Disposition: form-data; name=\"\(filename)\"; filename=\"\(filename)\"\r\n"
        let contentTypeString = "Content-Type: \(mimetype)\r\n\r\n"
        
        // Prepare the HTTPBody for the request.
        let requestBodyData : NSMutableData = NSMutableData()
        requestBodyData.append(boundaryStart.data(using: String.Encoding.utf8)!)
        requestBodyData.append(contentDispositionString.data(using: String.Encoding.utf8)!)
        requestBodyData.append(contentTypeString.data(using: String.Encoding.utf8)!)
        requestBodyData.append(fileData! as Data)
        requestBodyData.append("\r\n".data(using: String.Encoding.utf8)!)
        requestBodyData.append(boundaryEnd.data(using: String.Encoding.utf8)!)
        
        request.httpBody = requestBodyData as Data
        
        
        // Set the HTTPBody we'd like to submit
        //let requestBodyData = (dataString as NSString).data(using: String.Encoding.utf8.rawValue)
       // request.httpBody = requestBodyData
        
//        let data = try! JSONSerialization.data(withJSONObject: postDict, options: JSONSerialization.WritingOptions.prettyPrinted)
//
//        let json = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//
//
//            request.httpBody = json?.data(using: String.Encoding.utf8.rawValue, allowLossyConversion: false)
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            completionHandler(data, response, error)
        }
        task.resume()
    }
    
    
    
    
    
//  class func mimeType(for path: String) -> String {
//        let url = URL(fileURLWithPath: path)
//        let pathExtension = url.pathExtension
//
//        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as NSString, nil)?.takeRetainedValue() {
//            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
//                return mimetype as String
//            }
//        }
//        return "application/octet-stream"
//    }
//
    class func getLoginParams(dict: NSDictionary) ->String {
        
        let username : String = dict.object(forKey: "username") as! String
        let password : String = dict.object(forKey: "password") as! String
        let grantType : String = dict.object(forKey: "grant_type") as! String
        
        let stringToSend = "username" + "=" + username + "&" +
            "password" + "=" + password + "&" +
            "grant_type" + "=" + grantType
        
        
        return stringToSend
    }
    
    
    class func getDocumentParams(dict: NSDictionary) ->String {
        
        let inspectionQueId: String  = (dict.object(forKey: "inspectionQueId") as! String)
        let completed_on: String  = (dict.object(forKey: "completed_on") as! String)
        
        let stringToSend = "?inspectionQueId" + "=" + inspectionQueId + "&" +
            "completed_on" + "=" + completed_on
        
        
        return stringToSend
    }
    
    class func mimeTypeForPath(path: String) -> String {
        let url = NSURL(fileURLWithPath: path)
        let pathExtension = url.pathExtension
        
        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension! as NSString, nil)?.takeRetainedValue() {
            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
                return mimetype as String
            }
        }
        return "application/octet-stream"
    }
}



