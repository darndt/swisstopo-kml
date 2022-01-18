require 'rubygems'
require 'cowsay'

Handler = Proc.new do |req, res|
  res.status = 200
  res['Content-Type'] = 'text/text; charset=utf-8'
  if req.query.has_key?("name")
    name = req.query["name"]
    res.body = Cowsay.say("Hello #{name}", 'cow')
  else
    res.body = "Hello, stranger!"
  end
end
