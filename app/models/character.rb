class Character < ApplicationRecord
  belongs_to :combat
  belongs_to :user

  after_initialize :set_defaults

  private
  
  def set_defaults
    self.initiative ||= 0
    self.onslaught ||= 0
    self.wound ||= 0
    self.acted ||= false
  end
end
