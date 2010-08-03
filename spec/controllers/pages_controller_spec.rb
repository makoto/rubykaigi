# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe PagesController do
  context "page does not found" do
    specify do
      get :show, :year => RubyKaigi.latest_year, :year => '2010', :page_name => "registration", :locale => 'ja'
      response.should render_template("/pages/2010/registration") # こんなtemplateはほんとうは存在してない
      response.status.should == 404 # 200……だとッ?!
    end
  end
end
