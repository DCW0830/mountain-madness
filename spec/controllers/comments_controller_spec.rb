require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  describe "creating a comment" do
    it 'cannot create a comment if user is not logged in' do
      post :create
      expect(flash[:notice]).to be_present
      expect(response).to redirect_to(comments_path)
    end

    it 'can create a comment if user is logged in' do
      request.env["HTTP_REFERER"] = "where_i_came_from"
      Trail.create(name: 'inya face')
      session[:user_id] = User.create(name: 'steve').id
      post :create, comment: {body: 'testing'}, trail_id: 1
      expect(flash[:notice]).to_not be_present
      expect(response).to redirect_to("where_i_came_from")
    end
  end
end
