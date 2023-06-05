class DuplicateUser < Avo::BaseAction
  self.name = "Duplicate user"
  self.message = "Are you sure you want to duplicate this user?"
  # self.visible = -> do
  #   true
  # end

  def handle(models:, **)

    models.each do |model|
      duplicated_user = model.dup
      duplicated_user.save!
    end
  end
end
