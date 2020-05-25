class AuthorController < ApplicationController
   before_action :authenticate_salah!
end
