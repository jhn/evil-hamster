class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :require_user

  protected
    # Given a hash such as
    #
    # h = {
    #   date_of_birth(1i): '2015',
    #   date_of_birth(2i): '01',
    #   date_of_birth(3i): '31'
    # }
    #
    # and a call such as
    #
    # flatten_date_attrs(h, ['date_of_birth'])
    #
    # returns a new hash where each attribute is an instance of Date
    #
    # { date_of_birth: '#<Date: 2015-01-31>' }
    #
    # Attributes not in the attributes array are left untouched.
    def flatten_date_attrs(params, attributes = [])
      attributes.reduce(params.dup) do |_params, attribute|
        date_values = [1, 2, 3].map { |n| _params.delete("#{attribute}(#{n}i)").to_i }
        _params.merge(attribute => Date.new(*date_values))
      end
    end
end
