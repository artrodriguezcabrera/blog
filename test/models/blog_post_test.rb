require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog post" do
    assert draft_blog_post.draft?
  end

  test "draft? returns false for a published blog post" do
    refute BlogPost.new(published_at: 1.year.ago).draft?
  end

  test "draft? returns false for a scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).draft?
  end

  test "published? returns true for puplished blog post" do
    assert BlogPost.new(published_at: 1.year.ago).published?
  end

  test "published? returns false for draft blog post" do
    refute draft_blog_post.published?
  end

  test "published? returns false for scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).published?
  end

  def draft_blog_post
    BlogPost.new(published_at: nil)
  end


end
