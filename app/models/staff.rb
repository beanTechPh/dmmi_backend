# frozen_string_literal: true

class Staff < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one :company_staff 
  has_one :company, through: :company_staff
  has_many :messages, as: :user

  def formal_name
    "#{last_name}, #{first_name}"
  end
end
