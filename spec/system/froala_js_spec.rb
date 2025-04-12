# frozen_string_literal: true

RSpec.describe 'Froala JS' do
  it 'has a Javascript function defined and returns the version', :aggregate_failures do
    visit '/admin/posts'

    expect(page.evaluate_script('typeof FroalaEditor')).to eq 'function'
    expect(page.evaluate_script('FroalaEditor.VERSION')).to eq(ActiveAdmin::FroalaEditor::FROALA_VERSION)
  end
end
