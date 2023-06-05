class DuplicatePost < Avo::BaseAction
  self.name = "Duplicate post"
  self.message = "Are you sure you want to duplicate this post?"
  self.confirm_button_label = "Duplicate"
  self.cancel_button_label = "Cancel and do not duplicate"

  self.visible = -> do
    view == :show
  end

  def handle(**args)
    models, fields = args.values_at(:models, :fields)
    duplicated_post = nil

    models.each do |model|
      duplicated_post = model.dup
      duplicated_post.save!
    end

    succeed 'Done!, This is the duplicated post.'
    redirect_to avo.resources_post_path(duplicated_post)
  end
end
