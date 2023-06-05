class ToggleActive < Avo::BaseAction
  self.name = "Toggle active"
  # self.visible = -> do
  #   true
  # end

  # field :notify_user, as: :boolean
  field :message, as: :textarea, default: 'Your account has been marked as inactive.'

  def handle(**args)
    models, fields = args.values_at(:models, :fields)

    models.each do |model|
      if model.active
        model.update active: false
      else
        model.update active: true
      end

      # Optionally, you may send a notification with the message to that user.
      # UserMailer.with(user: model).toggle_active(fields["message"]).deliver_later
    end

    succeed 'Perfect!'
  end

end
