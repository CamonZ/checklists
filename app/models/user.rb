class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :checklists, inverse_of: :user
  has_many :check_items, inverse_of: :user
  has_many :check_item_results, inverse_of: :user
  has_many :surveys, inverse_of: :user
end
