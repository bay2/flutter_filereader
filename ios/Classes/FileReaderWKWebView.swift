//
//  FileReaderWKWebView.swift
//  flutter_downloader
//
//  Created by 胡杰 on 2019/10/21.
//

import UIKit
import WebKit
import QuickLook

//extension URL: QLPreviewItem {
//
//    public var previewItemURL: URL? {
//        return self
//    }
//
//    public var previewItemTitle: String? {
//        return self.lastPathComponent
//    }
//
//}

class FileReaderWKWebView : UIView, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1;
    }
    
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return filePath;
    }
    
    
    var previewController: QLPreviewController? = QLPreviewController();
    
    var preview: UIView?
    var filePath: NSURL!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        preview?.frame = CGRect(x: 5, y: 0, width: self.bounds.size.width - 5, height: self.bounds.height);
    }
    

    func load(url: NSURL) {
        
        previewController = QLPreviewController();
        previewController?.delegate = self;
        previewController?.dataSource = self;
        
        preview = previewController!.view;
        filePath = url

        self.addSubview(preview!);
        
//        preview?.frame = self.bounds;
        
    }
    

    
}
