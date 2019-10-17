# frozen_string_literal: true

module PostsHelper
  def root_posts(user)
    index_posts = []
    user.friends.each do |f|
      f.posts.each do |fp|
        index_posts.push(fp)
      end
    end
  end
end
