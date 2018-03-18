class Mascot < ApplicationRecord
  has_many :teams
  validates_presence_of :name, :color, :motto
end
