Pod::Spec.new do |s|

s.name         = "ADTextField"
s.version      = "1.0"
s.summary      = "ADTextField系统UITextField的封装，使用block处理代理，键盘通知，和return按钮事件"

s.description  = <<-DESC
ADTextField系统UITextField的封装，使用block处理代理，键盘通知，和return按钮事件
DESC

s.homepage     = "https://github.com/tiancanfei/ADTextField/tree/master"

s.license      = "MIT"
s.license      = { :type => "MIT", :file => "LICENSE" }

s.author             = { "tiancanfei" => "bjwltiankong@163.com" }

#支持平台
s.platform     = :ios
#支持平台版本
s.platform     = :ios, "7.0"
#仓库地址 (不要使用ssh)
s.source       = { :git => "https://github.com/tiancanfei/ADTextField.git", :tag => "#{s.version}" }

#源文件位置
s.source_files  = "ADTextField/ADTextField/*.{h,m}"
# s.exclude_files = "Classes/Exclude"

#仓库地址 (暴露出来的头文件)
s.public_header_files = "ADTextField/ADTextField/*.h"

#需要的framewoke
# s.framework  = "UIKit"
s.frameworks = "UIKit"

#库
# s.library   = "iconv"
# s.libraries = "iconv", "xml2"

#是否arc
s.requires_arc = true

# s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

#需要依赖的三方
#s.dependency 'SDWebImage', '~> 3.7.6'

end
