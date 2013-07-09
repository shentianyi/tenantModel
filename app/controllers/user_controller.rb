class UserController < ApplicationController
  before_filter :check_tenant_status
  before_filter :check_tenant_resource_limitation, :only=>:create


  def new

  end


  def create

  end
end
