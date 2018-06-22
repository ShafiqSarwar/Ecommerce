Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['256036628481609'], ENV['f675a0e48578bbd051c3dd8a46c3a7d6'],
  scope: 'email,user_birthday,read_stream', display: 'popup'
  
end