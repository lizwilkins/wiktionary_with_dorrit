require 'spec_helper'


describe Entry do 
  context 'validations' do
    it {should validate_presence_of :word}
    it {should validate_presence_of :definition}
  end

  it {should allow_mass_assignment_of :word}
  it {should allow_mass_assignment_of :definition}


end 