class Admin < ActiveRecord::Base
<<<<<<< HEAD
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  
=======
acts_as_voter
has_many :comments, dependent: :destroy
has_many :posts, dependent: :destroy
>>>>>>> 3e1cd039745de6f20ae8f2430bdb5e48a3586fb4
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    #user.name = auth.info.name   # assuming the user model has a name
   # user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
  end
end
