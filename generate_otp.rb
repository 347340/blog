require 'rubygems'
require 'rotp'



password = 'daydayup'
totp = ROTP::TOTP.new('MRQXSZDBPF2XA===', issuer: 'My_Service')
# 生成ＯＴＰ的字符串 , 跟手机App上的一致．
puts "== Current OTP: #{totp.now}"
# 这行代码就是生成 otpauth://totp/some_information?secret=your_generated_password&issuer=yourwebsite.com
puts totp.provisioning_uri('user_meiyi')
