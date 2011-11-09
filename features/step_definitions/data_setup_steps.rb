Given /^article with name "(.*)" exists$/ do |article_name|
  Article.create :name => article_name, :content => 'It is awesome!'
end

Given /^comment with name "(.*)" exists$/ do |comment_name|
  Article.first.comments.create :name => comment_name
end

