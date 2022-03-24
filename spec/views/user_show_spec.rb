require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before do
    User.create(id: 1, name: 'name', email: 'name@name.com', bio: "Hello there! I'm Qwerty.",
                photo: 'https://randomuser.me/api/portraits/men/75.jpg',
                password: 'password', posts_counter: 0)

    Post.create(id: 1, author_id: 1, title: 'Hello 1', text: 'This is my first post', comments_counter: 0,
                likes_counter: 0)

    Post.create(id: 2, author_id: 1, title: 'Hello 2', text: 'This is my second post', comments_counter: 0,
                likes_counter: 0)

    Post.create(id: 3, author_id: 1, title: 'Hello 3', text: 'This is my third post', comments_counter: 0,
                likes_counter: 0)
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
      expect(page).to have_text('Number of posts: 3')
    end

    it 'should display the Bio of user' do
      expect(page).to have_text('Hello 1')
    end

    it "should display the user's recent posts" do
      expect(page).to have_text('Hello 1')
      expect(page).to have_text('Hello 2')
      expect(page).to have_text('Hello 3')
    end

    it 'should have a See all posts button' do
      expect(page).to have_button('see all posts')
    end

    it 'should redirect to posts show page when clicking a user post' do
      click_link('Hello 1')
      expect(page).to have_current_path('/users/1/posts/1')
    end
  end
end
