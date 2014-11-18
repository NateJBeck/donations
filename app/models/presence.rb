class Presence < ActiveRecord::Base
  belongs_to :charity
  belongs_to :town
end
