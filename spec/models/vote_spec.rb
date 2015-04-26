require 'rails_helper'

describe Vote do
  describe "validations" do
    
    describe "value validation" do
      it "only allows -1 or 1 as values" do
          
        invalid_vote_greater = Vote.create(value: 2)
        invalid_vote_less = Vote.create(value: -2)
        invalid_vote_zero = Vote.create(value: 0)
        valid_vote_positive = Vote.create(value: 1)
        valid_vote_negative = Vote.create(value: -1)
  
        expect( valid_vote_positive.valid? && valid_vote_negative.valid? ).to eq( true )
        expect( invalid_vote_greater.valid? && invalid_vote_less.valid? && invalid_vote_zero.valid? ).to eq( false )
      end
    end
  end
end