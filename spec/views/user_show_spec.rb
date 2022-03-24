require 'rails_helper'


RSpec.describe 'User show page', type: :system do
    before do
    first_user = User.create(id: 1, name: 'name', email: 'name@name.com',
         photo: 'https://images.pexels.com/photos/6171563/pexels-photo-6171563.jpeg  width = "300" height = "300"',
         password: 'password', posts_counter: 2, bio: 'Artist from Dreamland')
 
 
       User.create(id: 2, name: 'amel', email: 'amel@amel.com',
                   photo: 'https://randomuser.me/api/portraits/men/55.jpg',
                 password: '123456', posts_counter: 6)

post1 = Post.create(author: first_user, title: 'I am Vertical', text: 'I am Vertical')
post2 = Post.create(author: first_user, title: 'Hello world', text: 'I am not a tree with my root in the soil')
post3 = Post.create(author: first_user, title: 'words', text: 'But I would rather be horizontal')
   end
 
   describe 'Visiting the users show page' do
     before :each do
       visit '/users/1'
     end

 
      it 'should display the username of user' do
        expect(page).to have_text('name')
      end
 
      it 'should display the profile picture of user' do
        expect(page).to have_css('img')
      end
 
      it 'should display the number of posts of user' do
        expect(page).to have_text('Number of posts: 2')
      end


      it 'should display the Bio of user' do
        expect(page).to have_text('Artist from Dreamland')
      end

      it "should display the user's recent posts" do
        expect(page).to have_text('I am Vertical')
        expect(page).to have_text('Hello world')
        expect(page).to have_text('words')
      end

      
     it 'should have a See all posts button' do
        expect(page).to have_button('See all posts')
      end
  
 
      it 'should redirect to posts show page when clicking a user post' do
       click_link('I am Vertical')    
       expect(page).to have_current_path('/users/1/posts/2')
    end

    it 'should redirect to posts show page when clicking a user post' do
        click_button('See all posts')    
        expect(page).to have_current_path('/users/1/posts')
    end
  end
end
