class Identity < OmniAuth::Identity::Models::ActiveRecord
  validates :email, uniqueness:true
  validates :name, :email, :password, :password_confirmation, :presence => true  

  def user
    User.where(:uid => self.uid).first
  end

end