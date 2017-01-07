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

  it 'does not post a duplicate link' do
    link = JSON.generate(url: "http://www.google.com")
    link2 = JSON.generate(url: "http://www.yahoo.com")
    link3 = JSON.generate(url: "http://www.google.com")

    post '/links/',
      params: link,
      headers: {'Content-type': 'application/json'}
    post '/links/',
      params: link2,
      headers: {'Content-type': 'application/json'}
    post '/links/',
      params: link3,
      headers: {'Content-type': 'application/json'}

    expect(Link.count).to eq(2)
    # look at Google linkl in database and get the count - line for record
    expect(Link.find_by(url: "http://www.google.com").submission_count).to eq(2)
    expect(Link.find_by(url: "http://www.yahoo.com").submission_count).to eq(1)
  end
end
