# frozen_string_literal: true

RSpec.describe 'Froala editor', type: :system do
  let(:author) { Author.create!(email: 'some_email@example.com', name: 'John Doe', age: 30) }
  let(:post) { Post.create!(title: 'Test', author: author, description: 'Some content...') }

  before do
    post
  end

  after do
    Post.delete_all
    author.delete
  end

  context 'with a Froala editor' do
    it 'initialize the editor' do
      visit "/admin/posts/#{post.id}/edit"

      %w[undo redo bold italic].each do |button|
        expect(page).to have_css(".fr-box [data-cmd=\"#{button}\"]")
      end
      expect(page).to have_css('#post_description[data-aa-froala-editor]', visible: :hidden)
      expect(page).to have_css('#post_description_input .fr-element', text: 'Some content...')
    end

    it 'adds some text to the description' do
      visit "/admin/posts/#{post.id}/edit"

      find('#post_description_input .fr-element').base.send_keys('more text')
      find('[type="submit"]').click

      expect(page).to have_content('was successfully updated')
      expect(post.reload.description).to eq '<p>Some content...more text</p>'
    end

    it 'adds some bold text to the description' do
      visit "/admin/posts/#{post.id}/edit"

      find('#post_description_input .fr-element').click
      find('.fr-toolbar [data-cmd="bold"]').click
      find('#post_description_input .fr-element').base.send_keys('bold text')
      find('[type="submit"]').click

      expect(page).to have_content('was successfully updated')
      expect(post.reload.description).to eq '<p>Some content...<strong>bold text</strong></p>'
    end

    it 'adds some italic text to the description' do
      visit "/admin/posts/#{post.id}/edit"

      find('#post_description_input .fr-element').click
      find('.fr-toolbar [data-cmd="italic"]').click
      find('#post_description_input .fr-element').base.send_keys('italic text')
      find('[type="submit"]').click

      expect(page).to have_content('was successfully updated')
      expect(post.reload.description).to eq '<p>Some content...<em>italic text</em></p>'
    end
  end

  context 'with a Froala editor in a nested resource' do
    it 'updates some HTML content of a new nested resource' do
      visit "/admin/authors/#{author.id}/edit"

      find('.posts.has_many_container .has_many_add').click
      expect(page).to have_css('.posts.has_many_container .fr-element', count: 2)

      fill_in('author[posts_attributes][1][title]', with: 'A new post')
      find('#author_posts_attributes_1_description_input .fr-element').base.send_keys('new post text')
      find('[type="submit"]').click

      expect(page).to have_content('was successfully updated')
      expect(author.posts.last.description).to eq '<p>new post text</p>'
    end
  end
end
