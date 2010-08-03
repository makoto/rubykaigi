# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe PagesController do
  context "page does not found" do
    integrate_views

    specify do
      expect {
        get :show, :year => '2010', :page_name => 'registration', :locale => 'ja'
      }.to raise_error(ActionView::MissingTemplate)
    end
  end
end
