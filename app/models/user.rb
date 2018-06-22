class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

   validates:username, presence: true
   validates:city, presence: true
   validates:state, presence: true
   validates:zip, presence: true
   validates:phone_number, presence: true

has_many :listings

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.provider = auth.provider
    user.uid = auth.uid
    user.password = Devise.friendly_token[0,20]
  end
  end
  def has_facebook_linked?
  self.provider.present? && self.uid.present?
end
end
