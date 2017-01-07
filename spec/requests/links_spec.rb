require 'rails_helper'

describe "Links API" do
  it 'retrieves a link' do

    link = JSON.generate(url: "http://www.google.com")

    post '/links/',
      params: link,
      headers: {'Content-type': 'application/json'}

    expect(response.status).to eq(201)
    expect(Link.last.url).to eq ("http://www.google.com")
  end
end
