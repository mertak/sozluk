class Writer::BaseController < ActionController::Base
  before_action :authenticate_writer!
end
