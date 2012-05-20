# -*- coding: utf-8 -*-
=begin
require 'spec_helper'

describe 'AbTestingUnitController', :type => :controller do
  before do
    enable_unit(:ab_testing_unit)
  end

  it "success" do
    get :index
    response.should be_success
  end
end
=end
