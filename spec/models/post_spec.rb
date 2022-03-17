RSpec.describe Post, type: :model do
  subject do
    Post.new(
      author_id: 1,
      title: 'My first post',
      text: 'this is the story of me learning ror!',
      comments_counter: 2,
      likes_counter: 2
    )
  end
  before { subject.save }

  it 'it should have a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title maximum length is 250' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'likes counter must be an integer greater or equal to 0' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'comments counter must be an integer greater or equal to 0' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end
end
