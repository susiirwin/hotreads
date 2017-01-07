require 'rails_helper'

RSpec.describe "Show Links" do
  it "shows all links" do

    link = Link.create(url: "http://www.google.com")

    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_content(link.url)
  end

  it "limits view to 10 links" do
    11.times do |i|
      Link.create(url: "#{i}.com")
    end

    visit '/'

    expect(page).to have_selector("li", count: 10)
  end

  it 'shows links from within 24 hours of update' do
    Timecop.freeze(Date.today - 2) do
      Link.create(url: "http://test.com")
    end

    Link.create(url: "http://www.google.com")

    visit '/'

    expect(page).to have_selector("li", count: 1)
  end
end
