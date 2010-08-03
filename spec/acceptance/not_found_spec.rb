require File.dirname(__FILE__) + '/acceptance_helper'

feature 'page does not found' do
  scenario "/2010/ja/registration" do
    header 'Accept-Language', 'ja'
    visit '/2010/ja/registration'
    page.status_code.should == 404
  end
end
