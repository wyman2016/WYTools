Pod::Spec.new do |s|
s.name         = "WYTools"
s.version      = "2.0.0"
s.ios.deployment_target = '9.0'
s.summary      = "能不能成功呢"
s.homepage     = "https://github.com/wyman2016/WYTools"
s.social_media_url = 'https://www.baidu.com'
s.license      = "MIT"
s.dependency    "SVProgressHUD"  
s.dependency    "Masonry"
# s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
s.author       = { "wyman" => "296626979@qq.com" }
s.source       = { :git => 'https://github.com/wyman2016/WYTools.git', :tag => s.version}
s.requires_arc = true
s.source_files = 'WYTools/*'
#s.public_header_files = 'runtime/TFRuntimeManager.h'
 # spec.ios.framework  = 'UIKit'
s.resources = 'WYTools/WYTools.bundle'

end
