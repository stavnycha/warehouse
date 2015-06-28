class Product::Searcher

  class << self
    def search(params)
      params ||= {}
      params   = params.with_indifferent_access

      query    = params[:query]
      category = params[:category]

      results  = category ? Product.joins(:categories).references(:categories).where(categories: { name: category }) : Product.all
      results  = results.where(search_query, query: "%#{query}%") if query
      results
    end

    private

    def search_query
      'products.name ILIKE :query OR description ILIKE :query'
    end
  end
end