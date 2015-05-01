require 'rails_helper'

describe Vote do
  include TestFactories
  describe "validations" do
    
    describe "value validation" do
      it "only allows -1 or 1 as values" do
          
        invalid_vote_greater = Vote.new(value: 2)
        invalid_vote_less = Vote.new(value: -2)
        invalid_vote_zero = Vote.new(value: 0)
        valid_vote_positive = Vote.new(value: 1)
        valid_vote_negative = Vote.new(value: -1)
  
        expect( valid_vote_positive.valid? && valid_vote_negative.valid? ).to eq( true )
        expect( invalid_vote_greater.valid? && invalid_vote_less.valid? && invalid_vote_zero.valid? ).to eq( false )
      end
    end
  end
  
  describe 'after_save' do
    it "calls 'Post#update_rank' after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
end
  
   