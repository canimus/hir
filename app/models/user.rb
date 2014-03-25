class User < ActiveRecord::Base
  has_one :identity, dependent: :destroy
  def identity
    Identity.where(id:self.uid).first
  end

  def self.from_omniauth(auth)
    find_by(provider:auth["provider"], uid:auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]

      # TODO: Validar que la foto este en el filesystem, o permanece desactivado
      user.active = auth["info"]["status"].present? || false # TODO: Set to true for testing
      
    end
  end

end
