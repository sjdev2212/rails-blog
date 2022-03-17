require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Bruno',
      photo: 'https://www.somepicture.com',
      bio: 'Teacher from Denmark',
      posts_counter: 4
    )
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Posts counter should not be nil' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end
end
