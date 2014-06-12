Pod::Spec.new do |s|
  s.name             = 'DZImageEditing'
  s.version          = '1.0.0'
  s.summary          = 'Replacement for UIImagePickerController editing mode'
  s.homepage         = "https://github.com/DZozulya/DZImageEditing"
  s.license          = 'MIT'
  s.author           = { 'Dmitry Zozulya' => 'nsdmitry@yandex.ru' }
  s.social_media_url = 'https://twitter.com/NSDmitriy'
  s.source           = { :git => 'https://github.com/DZozulya/DZImageEditing.git', :tag => s.version.to_s }
  s.requires_arc 	 = true
  s.source_files 	 = 'DZImageEditing/**/*.{h,m}'
  s.resources 		 = 'DZImageEditing/**/*.{xib}'
  s.frameworks 		 = 'UIKit', 'Foundation'
  s.platform     	 = :ios, '7.0'
  s.ios.deployment_target = '7.0'
end