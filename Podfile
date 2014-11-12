platform :ios, '7.1'

xcodeproj 'ZLITodo', 'Release' => :release, 'Debug' => :debug

target :ZLITodo do
    if FileTest::directory?('../ios_utils')
        pod 'ZLIUtils', :path => '../ios_utils'
    else
        pod 'ZLIUtils', :git => 'https://github.com/zhoulijoe/ios_utils.git', :branch => 'master'
    end
end
