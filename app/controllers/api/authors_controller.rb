class Api::AuthorsController < ApplicationController
#returns all authors as json
# make sure to set routes in config/routes.rb FIRST


#-----------------------------  Calls Actions in order recieved

before_action :set_author, only: [:show, :update, :destroy, ]


#--------------------------------INDEX

def index
 render json: Author.all
end

#--------------------------------CREATE

def create
# #params is defined by our controller in rails\
a = Author.new(name: params[:author][:name], age:params[:author][:age])
if(a.save)
render json: a 
else
render json: {errors: a.errors.full_messages}, status:422
end
end

#------------------------------------  SHOW

def show
puts 'return author json '
author = Author.find(params[:id])
render json: Author
end

#---------------------------------   UPDATE

def update
if (@author.update(author_params))
render json: @author
else 
render json: {errors: @author.errors.full_messages}, status: 422
end
end

#-----------------------------------  DESTROY

def destroy
author = Author.find(params[:id])
render json: @author.destroy
end 

#-----------------------------------   PRIVATE
private
def set_author
puts 'set author'
@author = Author.find(params[:id])
end
def author_params
params.require(:author).permit(:name, :age)
end

end
