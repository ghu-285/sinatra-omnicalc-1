require "sinatra"
require "sinatra/reloader"

get("/") do
  @n = params[:num].to_f
  @sq = @n ** 2
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @n = params[:number]
  @sq = @n.to_f ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @n = params[:number]
  @sqrt = @n.to_f ** 0.5
  erb(:square_root_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params[:user_min].to_f
  @max = params[:user_max].to_f
  @random = rand(@min..@max)
  erb(:random_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params[:user_apr].to_f / 100 / 12
  @years = params[:user_years].to_i * 12
  @principal = params[:user_pv].to_f
  @payment = @apr * @principal / (1 - (1 + @apr) ** (-1 * @years))
  erb(:payment_results)
end
