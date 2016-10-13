require 'pry'
class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    #binding.pry
    if req.path.include?"/items/"
      item_to_find = req.path.split('/').last
      item = @@items.detect{ |item| item.name == item_to_find }
      #binding.pry
      if item
        resp.write "#{item.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end



end
