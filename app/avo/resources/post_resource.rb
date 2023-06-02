class PostResource < Avo::BaseResource
  self.title = :tittle
  self.includes = [:category]
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], tittle_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  # Fields generated from the model
  field :tittle, as: :text
  field :excerpt, as: :text, only_on: :index
  field :body, as: :trix
  field :created_at, as: :date_time

  field :category, as: :belongs_to
  field :user, name: 'Author', as: :belongs_to
  # add fields here
end
