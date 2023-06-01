class CommentResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :commentable, as: :belongs_to, polymorphic_as: :commentable, types:
    [::Post]
  field :body, as: :textarea
  field :user, as: :belongs_to
  # add fields here
end
