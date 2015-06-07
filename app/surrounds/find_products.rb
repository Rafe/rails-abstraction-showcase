class FindProducts
  extend Surrounded::Context

  initialize_without_keywords :params

  role :params do
    def page
      params[:page]
    end
  end

  trigger :run do
    Product.page(params.page).per(per_page)
  end

  def per_page
    9
  end
end
