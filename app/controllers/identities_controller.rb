class IdentitiesController < ApplicationController
  def new
    @identity = env['omniauth.identity']
  end

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    # Usuario existe y esta activo
    if user.present? and user.active?
      Rails.logger.info "Entrando al dash"
      # RULE: La session contiene el id del usuario en hexadecimal
      session['user_id'] = user.id.to_s(16)

      # Redireccionar al dashboard
      redirect_to dashboard_url

    # Usuario existe pero necesita ser activado    
    else
      # Mensaje de registro correcto.
      flash[:info] = "Cuenta de usuario creada. Pendiente activacion"
      # Activacion pendiente      
      redirect_to login_url
    end
  end
end
