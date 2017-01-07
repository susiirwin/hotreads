require 'rails_helper'

RSpec.describe "Show Links" do
  it "shows all links" do

    link = Link.create(url: "http://www.google.com")

    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_content(link.url)
  end
end
