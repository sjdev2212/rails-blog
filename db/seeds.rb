
first_user = User.create(name: 'Anna', photo: 'https://randomuser.me/api/portraits/women/52.jpg', bio: 'Teacher from Denmark.')
second_user = User.create(name: 'Lilly', photo: 'https://randomuser.me/api/portraits/women/58.jpg', bio: 'Teacher from Poland.')
third_user = User.create(name: 'Stefany', photo: 'https://randomuser.me/api/portraits/women/41.jpg', bio: 'Student from Uruguay')
fourth_user = User.create(name: 'Susan', photo: 'https://randomuser.me/api/portraits/women/66.jpg', bio: 'Student from Ethiopia.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat')
second_post = Post.create(author: second_user, title: 'Hello 2', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat')
third_post = Post.create(author: third_user, title: 'Hello 3', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat')
fourth_post = Post.create(author: first_user, title: 'new post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat')
fifth_post = Post.create(author: fourth_user, title: 'my post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat')

Comment.create(post: first_post,  author: first_user,text: 'well written!!!' )
Comment.create(post: second_post,  author: second_user,text: 'amazin job!!!' )
Comment.create(post: third_post,author: third_user, text: 'i do not agree at all!!!' )
Comment.create(post: fourth_post,author: fourth_user, text: 'well written!!!' )
Comment.create(post: fifth_post,author: first_user ,text: 'excellent post!!!' )

