# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :date_of_birth, presence: true
  before_save :user_over_eighteen

  protected

  def user_over_eighteen
    errors.add(:date_of_birth, 'Must be 18 or older.') unless date_of_birth.before? Time.zone.now - 18.years
  end
end
