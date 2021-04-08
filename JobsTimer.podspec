Pod::Spec.new do |spec|
    spec.name             = 'JobsTimer'
    spec.version          = '1.0.0'
    spec.summary          = '乔布斯@时间管理'
    spec.homepage         = 'https://github.com/295060456/JobsTimer'
    spec.license          = "MIT"
    spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
    spec.source           = { :git => "https://github.com/295060456/JobsTimer.git", :tag => "#{spec.version}" }
    spec.requires_arc     = true
    spec.source_files     = "JJobsTimer/JobsTimerCore/**/*.{h,m}"
    spec.ios.deployment_target = '9.0'
end
