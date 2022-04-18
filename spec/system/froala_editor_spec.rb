# frozen_string_literal: true

RSpec.describe 'Froala editor', type: :system do
  let(:author) { Author.create!(email: 'some_email@example.com', name: 'John Doe', age: 30) }
  let!(:post) { Post.create!(title: 'Test', author: author, description: '') }

  context 'with a Froala editor' do
    it 'initializes the editor', :aggregate_failures do
      post.update(description: 'Some content...')
      visit "/admin/posts/#{post.id}/edit"

      %w[undo redo bold italic].each do |button|
        expect(page).to have_css(".fr-box [data-cmd=\"#{button}\"]")
      end
      expect(page).to have_css('#post_description[data-aa-froala-editor]', visible: :hidden)
      expect(page).to have_css('#post_description_input .fr-element', text: 'Some content...')
    end

    it 'adds some text to the description', :aggregate_failures do
      visit "/admin/posts/#{post.id}/edit"

      find('#post_description_input .fr-element').base.send_keys('Some text')
      find('[type="submit"]').click

      expect(page).to have_content('was successfully updated')
      expect(post.reload.description).to eq '<p>Some text</p>'
    end

    it 'adds some bold text to the description', :aggregate_failures do
      visit "/admin/posts/#{post.id}/edit"

      find('#post_description_input .fr-element').click
      find('#post_description_input .fr-toolbar [data-cmd="bold"]').click
      find('#post_description_input .fr-element').base.send_keys('Some bold text')
      find('[type="submit"]').click

      expect(page).to have_content('was successfully updated')
      expect(post.reload.description).to eq '<p><strong>Some bold text</strong></p>'
    end

    it 'adds some italic text to the description', :aggregate_failures do
      visit "/admin/posts/#{post.id}/edit"

      find('#post_description_input .fr-element').click
      find('#post_description_input .fr-toolbar [data-cmd="italic"]').click
      find('#post_description_input .fr-element').base.send_keys('Some italic text')
      find('[type="submit"]').click

      expect(page).to have_content('was successfully updated')
      expect(post.reload.description).to eq '<p><em>Some italic text</em></p>'
    end
  end

  context 'with 2 Froala editors' do
    it 'updates some HTML content for 2 fields', :aggregate_failures do
      visit "/admin/posts/#{post.id}/edit"

      find('#post_description_input .fr-element').click
      find('#post_description_input .fr-toolbar [data-cmd="bold"]').click
      find('#post_description_input .fr-element').base.send_keys('Bold text')
      find('#post_summary_input .fr-element').click
      find('#post_summary_input .fr-toolbar [data-cmd="italic"]').click
      find('#post_summary_input .fr-element').base.send_keys('Italic text')
      find('[type="submit"]').click
      post.reload

      expect(post.description).to eq '<p><strong>Bold text</strong></p>'
      expect(post.summary).to eq '<p><em>Italic text</em></p>'
    end
  end

  context 'with a Froala editor in a nested resource' do
    it 'updates some HTML content of a new nested resource', :aggregate_failures do
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
