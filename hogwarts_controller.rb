require( 'sinatra' )
require( 'sinatra/reloader' )

require_relative( './models/student' )
require_relative( './models/house' )

get '/students' do # index
  @students = Student.all()
  erb( :index )
end

get '/students/new' do # new
  @students = Student.all
  erb( :new )
end

get '/students/:id' do # show
  @student = Student.find( params[:id] )
  erb( :show )
end
