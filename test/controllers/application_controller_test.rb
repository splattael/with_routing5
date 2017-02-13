require 'test_helper'

class ApplicationDummyController < ApplicationController
  def foo
    link = root_path
    render plain: link
  end
end

class ApplicationControllerTest < ActionController::TestCase
  tests ApplicationDummyController

  test "false" do
    with_routing do |set|
      set.draw do
        match 'foo' => 'application_dummy', :via => :all
      end

      get :foo
      # boom
    end
  end
end
