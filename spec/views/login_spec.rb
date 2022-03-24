require 'rails_helper'

RSpec.describe 'Login page', type: :system do
   before do
     User.create(id: 1, name: 'name', email: 'name@name.com',
                 photo: 'https://images.pexels.com/photos/6171563/pexels-photo-6171563.jpeg  width = "300" height = "300"',
                 password: 'password', posts_counter: 0)
   end

   describe 'Visiting the login page' do
     before :each do
       visit '/users/sign_in'
     end

     it 'should have email input field' do
       expect(page).to have_text('Email')
     end

     it 'should have password input field' do
       expect(page).to have_text('Password')
     end
    end
