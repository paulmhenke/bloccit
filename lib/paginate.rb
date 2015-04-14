module Page
  
  def paginate(params)
    per_page = params[per_page: 10]
    page = params[page: 1]
    
  end