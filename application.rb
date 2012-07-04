# -*- encoding : utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'cobregratis'
require 'haml'
require './lib/parser'

configure do
  set :views, '.'
end

get '/' do
  markdown :README, :layout_engine => :haml
end

post '/:service_id/:bank_billet_account_id' do
  puts "---> Receiving request. Params = #{params.inspect}"
  parser = Parser.new(params)
  Cobregratis::BankBillet.site = "https://app.cobregratis.com.br"
  Cobregratis::BankBillet.user = parser.cobregratis_token
  Cobregratis::BankBillet.password = 'X'
  Cobregratis::BankBillet.format = :xml
  Cobregratis::BankBillet.connection.cache_store = nil
  bank_billet_attributes = parser.bank_billet_attributes.merge(service_id: params[:service_id], bank_billet_account_id: params[:bank_billet_account_id])
  puts "----> Bank Billet Attributes = #{bank_billet_attributes.inspect}"
  @bank_billet = Cobregratis::BankBillet.create(bank_billet_attributes)
  puts "----> Bank Billet Created!"
end