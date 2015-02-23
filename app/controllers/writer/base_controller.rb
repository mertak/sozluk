class Writer::BaseController < ApplicationController

  before_action :authenticate!
end
