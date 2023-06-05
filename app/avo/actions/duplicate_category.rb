class DuplicateCategory < Avo::BaseAction
  self.name = "Duplicate category"
  self.message = "Are you sure you want to duplicate this category?"
  # self.visible = -> do
  #   true
  # end

  def handle(**args)
    models, fields, current_user, resource = args.values_at(:models, :fields, :current_user, :resource)

    models.each do |model|
      duplicated_category = model.dup
      if duplicated_category
        redirect_to "/avo/dashboards/dashy"
        silent
      end
    end
  end
end


