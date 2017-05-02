require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

# INDEX - READ 
get '/pizzas' do
  @pizzas = Pizza.all()
  erb(:index)
end

#NEW-CREATE
get '/pizzas/new' do
  erb(:new)
end

 #SHOW - READ
get '/pizzas/:id' do
  id_from_route = params[:id]
  id_to_find = id_from_route
  @pizza = Pizza.find(id_to_find)
  erb(:show)
end

#CREATE - CREATE
post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end

#DESTROY - DELETE

post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id])
  @pizza.delete()
  redirect '/pizzas'
end

#EDIT - UPDATE
get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

#UPDATE - UPDATE

post '/pizzas/:id' do
  @pizza = Pizza.new(params)
  @pizza.update()
  erb(:update)
end
