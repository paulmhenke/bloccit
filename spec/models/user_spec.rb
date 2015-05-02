require 'rails_helper'

describe User do
  
  include TestFactories
  
  before do
    @user = authenticated_user
    @post = Post.create(title: "rspec post", body: "this is an rspec post for the purpose of testing", id: 1)
    @post_2 = Post.create(title: "second rspec post", body: "this is the second rspec post for testing", id: 2)
  end
    
  describe '#favorited(post)' do
    it "returns 'nil' if the user has not favorited the post" do
      expect(@user.favorited(@post)).to be_nil
    end
    
    it "returns the appropriate favorite if it exists" do
      favorite = Favorite.create(post_id: @post.id, user_id: @user.id)
      expect(@user.favorited(@post)).to eq(favorite)
    end
    
    it "returns 'nil' if the user has favorited a different post" do
      favorite = Favorite.create(post_id: @post.id, user_id: @user.id)
      expect(@user.favorited(@post_2)).to be_nil
    end
  end
end