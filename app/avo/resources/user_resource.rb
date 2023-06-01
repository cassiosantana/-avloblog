class UserResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = ->(params:) do
    scope.ransack(id_eq: params[:q], name_cont: params[:q], email_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  # Fields generated from the model
  field :email, as: :gravatar, link_to_resource: true, as_avatar: true
  field :name, as: :text
  field :email, as: :text, as_description: true
  # add fields here
end
