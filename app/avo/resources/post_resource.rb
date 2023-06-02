class PostResource < Avo::BaseResource
  self.title = :tittle
  self.includes = [:category]
  self.search_query = -> do
    if params[:global]
      # Perform global search
      scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
    else
      # Perform resource search
      scope.ransack(id_eq: params[:q], tittle_cont: params[:q], m: "or").result(distinct: false)
    end
  end

  self.search_result_path = -> {
    # Return any path here. You have access to the search `record` the user clicked on.
    # avo.resources_post_path record, custom: "yup"
    "https://google.com"
  }

  field :id, as: :id
  # Fields generated from the model
  field :tittle, as: :text
  field :complex_tittle, as: :text, hide_on: :all, as_label: true do |model|
    "[#{model.id}] #{model.tittle}"
  end

  field :excerpt, as: :text, only_on: :index, as_description: true do |model|
    ActionView::Base.full_sanitizer.sanitize(model.body).truncate 130
  rescue
    ""
  end
  field :body, as: :trix
  field :created_at, as: :date_time
  field :category, as: :belongs_to
  field :user, name: 'Author', as: :belongs_to
  # add fields here

  # self.hide_from_global_search = true
end
