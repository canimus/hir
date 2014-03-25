class IdentitiesController < ApplicationController
  def new
  end

  def create
    User.from_omniauth(env['omniauth.identity'])
    redirect_to controller: identities, action: new
  end
end
