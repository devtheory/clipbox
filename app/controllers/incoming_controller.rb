class IncomingController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    @user = User.where(email: params['sender']).first
    @topic = Topic.where(name: params[:subject]).first_or_create
    unless @user.name == "User"
      @topic.bookmarks.create(link: params['stripped-text'], user_id: @user.id)
    end
    head 200
  end
  
end

# params[:sender] has email to match with user
# params[:subject] to access subject
# params[:stripped-text] to get the body

# {
#   "recipient"=>"postmaster@app26554848.mailgun.org", 
#   "sender"=>"hailex@live.com", 
#   "subject"=>"#inspirational", 
#   "from"=>"Jose S <hailex@live.com>", 
#   "X-Envelope-From"=>"<hailex@live.com>", 
#   "Received"=>"from BAY172-W29 ([65.54.190.124]) by BAY004-OMC2S25.hotmail.com with Microsoft SMTPSVC(7.5.7601.22712);\t Fri, 20 Jun 2014 11:02:05 -0700", 
#   "X-Tmn"=>"[9xoQJ7x3Ra7gyZo6ek7fMqbLoBmyEFXs]", 
#   "X-Originating-Email"=>"[hailex@live.com]", 
#   "Message-Id"=>"<BAY172-W29D05B077B74192611797EB2120@phx.gbl>", 
#   "Return-Path"=>"hailex@live.com", 
#   "Content-Type"=>"multipart/alternative; boundary=\"_64d7084e-d895-4ef9-9a3f-c3f16b3a7aab_\"", 
#   "From"=>"Jose S <hailex@live.com>", 
#   "To"=>"\"postmaster@app26554848.mailgun.org\" <postmaster@app26554848.mailgun.org>", 
#   "Subject"=>"#inspirational", 
#   "Date"=>"Fri, 20 Jun 2014 14:02:05 -0400", 
#   "Importance"=>"Normal", 
#   "Mime-Version"=>"1.0", 
#   "X-Originalarrivaltime"=>"20 Jun 2014 18:02:05.0794 (UTC) FILETIME=[BEF63420:01CF8CB1]", 
#   "X-Mailgun-Incoming"=>"Yes", 
#   "message-headers"=>"[[\"X-Envelope-From\", \"<hailex@live.com>\"], [\"Received\", \"from BAY004-OMC2S25.hotmail.com (bay004-omc2s25.hotmail.com [65.54.190.100]) by mxa.mailgun.org with ESMTP id 53a4771f.4a038f0-in2; Fri, 20 Jun 2014 18:02:07 -0000 (UTC)\"], [\"Received\", \"from BAY172-W29 ([65.54.190.124]) by BAY004-OMC2S25.hotmail.com with Microsoft SMTPSVC(7.5.7601.22712);\\t Fri, 20 Jun 2014 11:02:05 -0700\"], [\"X-Tmn\", \"[9xoQJ7x3Ra7gyZo6ek7fMqbLoBmyEFXs]\"], [\"X-Originating-Email\", \"[hailex@live.com]\"], [\"Message-Id\", \"<BAY172-W29D05B077B74192611797EB2120@phx.gbl>\"], [\"Return-Path\", \"hailex@live.com\"], [\"Content-Type\", \"multipart/alternative; boundary=\\\"_64d7084e-d895-4ef9-9a3f-c3f16b3a7aab_\\\"\"], [\"From\", \"Jose S <hailex@live.com>\"], [\"To\", \"\\\"postmaster@app26554848.mailgun.org\\\" <postmaster@app26554848.mailgun.org>\"], [\"Subject\", \"#inspirational\"], [\"Date\", \"Fri, 20 Jun 2014 14:02:05 -0400\"], [\"Importance\", \"Normal\"], [\"Mime-Version\", \"1.0\"], [\"X-Originalarrivaltime\", \"20 Jun 2014 18:02:05.0794 (UTC) FILETIME=[BEF63420:01CF8CB1]\"], [\"X-Mailgun-Incoming\", \"Yes\"]]", 
#   "timestamp"=>"1403287334", 
#   "token"=>"972s5flqfyt1w427wxe1wvzbzywzkvfv9pe-ukyruajc747ef0", 
#   "signature"=>"1ac6f985491f0129b80df28ad2308ad422f7b05b9bbf895768c64538ff87827f", 
#   "body-plain"=>"http://www.wrapbootstrap.com \t\t \t   \t\t  ", 
#   "body-html"=>"<html>\r\n<head>\r\n<style><!--\r\n.hmmessage P\r\n{\r\nmargin:0px;\r\npadding:0px\r\n}\r\nbody.hmmessage\r\n{\r\nfont-size: 12pt;\r\nfont-family:Calibri\r\n}\r\n--></style></head>\r\n<body class='hmmessage'><div dir='ltr'>http://www.wrapbootstrap.com \t\t \t   \t\t  </div></body>\r\n</html>", 
#   "stripped-html"=>"<html>\r\n<head>\r\n<style><!--\r\n.hmmessage P\r\n{\r\nmargin:0px;\r\npadding:0px\r\n}\r\nbody.hmmessage\r\n{\r\nfont-size: 12pt;\r\nfont-family:Calibri\r\n}\r\n--></style></head>\r\n<body class='hmmessage'><div dir='ltr'>http://www.wrapbootstrap.com \t\t \t   \t\t  </div></body>\r\n</html>", 
#   "stripped-text"=>"http://www.wrapbootstrap.com", 
#   "stripped-signature"=>""
# }