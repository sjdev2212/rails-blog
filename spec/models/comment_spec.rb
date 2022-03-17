require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Comment.new(
      author_id: 1,
      post_id: 1,
      text: 'great post!'
    )
  end
  before { subject.save }

  it 'it should have a text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
