class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
      @@cart.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/cart/)
      if @@cart.length > 0
        @@cart.each do |cart|
        resp.write "#{cart}\n"
    else
      resp.write "Your cart is empty"
    end
    elsif req.path.match(/add/)

      item_term = req.params["item"]

      if @@items.include?(item_term)
        @@cart << item_term
        resp.write "added #{item_term}"
    end

  # def handle_search(search_term)
  #   if @@items.include?(search_term)
  #     return "#{search_term} is one of our items"
    else
      return "Path Not Found"
    end
  end
  resp.finish
end
