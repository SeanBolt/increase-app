# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @accounts = IncreaseService.new.list_accounts['data']
  end
end
