class Writer::BaseController < ApplicationController
  before_action :authenticate_writer!
end
