require 'rails_helper'

RSpec.describe TwitterController, type: :controller do
	describe "GET #index" do
		it 'fetches 20 tweets' do
			get :index
			expect(assigns[:tweets].size).to eq 20
		end

		it 'renders the :index view' do
			get :index
			expect(response).to render_template :index
		end
	end

	describe "GET #user" do
		it 'fetches 20 tweets' do
			get :user, user: 'casetabs'
			expect(assigns[:tweets].size).to eq 20
		end

		it 'also renders the :index view' do
			get :user, user: 'casetabs'
			expect(response).to render_template :index
		end
	end
end