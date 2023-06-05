class DuplicateUser < Avo::BaseAction
  self.name = "Duplicate user"
  self.message = "Are you sure you want to duplicate this user?"
  self.visible = -> { view == :show }

  def handle(**args)
    models, fields = args.values_at(:models, :fields)

    models.each do |model|
      duplicated_user = model.dup
      duplicated_user.save!
    end

    succeed "Success response ✌️"
    warn "Warning response ✌️"
    inform "Info response ✌️"
    error "Error response ✌️"
  end
end
