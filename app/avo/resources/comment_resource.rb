class CommentResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :excerpt, as: :text do |model|
    model.body.truncate 30
  end
  field :commentable, as: :belongs_to, polymorphic_as: :commentable, types:
    [::Post]
  field :body, as: :textarea
  field :user, as: :belongs_to
  field :status, as: :badge, options: {
    success: 'Published',
    warning: 'Pending',
    danger: 'Spam'
  }
  field :status, as: :select, hide_on: [:show, :index], options: {
    'Published': 'Published',
    'Pending': 'Pending',
    'Spam': 'Spam'
  }, placeholder: 'Choose the stage.'
end
