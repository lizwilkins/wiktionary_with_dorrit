class Entry < ActiveRecord::Base

  attr_accessible :word, :definition, :id

  validates :word, :definition, :presence => true

end