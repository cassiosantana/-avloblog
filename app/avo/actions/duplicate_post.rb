class DuplicatePost < Avo::BaseAction
  self.name = "Duplicate post"
  self.message = "Are you sure you want to duplicate this post?"

  # self.visible = -> do
  #   true
  # end

  def handle(models:, **)

    models.each do |model|
      duplicated_post = model.dup
      duplicated_post.save!
    end
  end
end
