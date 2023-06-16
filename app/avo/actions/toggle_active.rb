class ToggleActive < Avo::BaseAction
  self.name = "Toggle active"
  # self.visible = -> do
  #   true
  # end

  # field :notify_user, as: :boolean
  field :message, as: :textarea,
        default: "You will change the status of the account. Make sure the status you want is correct"

  def handle(**args)
    models, fields = args.values_at(:models, :fields)

    models.each do |model|
      if model.active
        model.update active: false
        succeed "Done! User marked as inactive!"
      else
        model.update active: true
        succeed "Done! User marked as active!"
      end

      # Optionally, you may send a notification with the message to that user.
      # UserMailer.with(user: model).toggle_active(fields["message"]).deliver_later
    end
  end
end
