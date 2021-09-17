#１行掲示板
require "sinatra"
require "sinatra/reloader"
require "erb"

get "/" do
  File.open("articles.txt", "r") do |f|
    @articles = f.read.split("\n")
  end
  erb :bbs
end

post "/" do
  @article = params[:article]
  @name = params[:name]
  File.open("articles.txt", "a") do |f|
    f.puts("#{@article}, #{@name}")
  end
  erb :result
end
