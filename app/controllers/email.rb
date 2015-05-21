require 'rest-client'

API_KEY = ENV['MAILGUN_API_KEY']
API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/app2064a568116c4930b75d7cf85f646da6.mailgun.org"

get '/email/:token' do
  token = params[:token]
  user = User.first(password_token: token)

  RestClient::Request.execute(
    url: API_URL + '/messages',
    method: :post,
    payload: {
      from: 'postmaster@app2064a568116c4930b75d7cf85f646da6.mailgun.org',
      to: 'timrobertson0122@gmail.com',
      subject: 'This is subject',
      text: 'This is text',
      html: 'https://worlds-best-bookmark-manager.herokuapp.com/password/reset' + token,
      multipart: true
    },
    headers: {
      "h:X-My-Header": 'www/mailgun-email-send'
    },
    verify_ssl: false
  )
end