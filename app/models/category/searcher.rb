class Category::Searcher

  class << self
    def search(params)
      params ||= {}
      params   = params.with_indifferent_access

      params[:query] ? Category.where(search_query, query: "%#{params[:query]}%") : Category.all
    end

    private

    def search_query
      'categories.name ILIKE :query'
    end
  end
end