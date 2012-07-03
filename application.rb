# -*- encoding : utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'cobregratis'
require './lib/parser'

get '/' do
  "nothing here"
end

post '/:service_id/:bank_billet_account_id' do
  begin
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
    "OK"
  rescue Exception => e
    puts "----> Error - #{e.inspect}"
    halt 422
  end
end