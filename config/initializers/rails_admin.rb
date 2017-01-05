RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  # for log out link
  config.current_user_method(&:current_user)

  config.authorize_with do
    unless current_user.try(:admin?)
      if current_user
        sign_out
        flash[:alert] = 'You are not admin'
        redirect_to '/'
      else
        flash[:alert] = 'You are not admin'
        redirect_to '/users/sign_in'
      end
    end
  end

  config.model Phone do
    object_label_method :description
  end

  config.model Clergyman do
    object_label_method :full_name
  end

  config.excluded_models = %w(Locating Addressing Phoning)

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
