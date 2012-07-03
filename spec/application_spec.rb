# -*- encoding : utf-8 -*-
require "spec_helper"

describe 'main application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  describe "GET /" do
    it 'should be ok' do
      get '/'
      last_response.should be_ok
    end
  end

  describe "POST /" do
    context "valid attributes" do
      let(:params) {
        {
          "FieldStructure" => '{ "Fields": [ { "ClassNames": "expire_at", "DefaultVal": "", "ID": "Field10", "Instructions": "", "IsRequired": "1", "Page": "1", "Title": "Vencimento", "Type": "eurodate" }, { "ClassNames": "amount", "DefaultVal": "", "ID": "Field9", "Instructions": "", "IsRequired": "1", "Page": "1", "Title": "Valor", "Type": "number" }, { "ClassNames": "name", "DefaultVal": "", "ID": "Field1", "Instructions": "", "IsRequired": "1", "Page": "1", "Title": "Nome", "Type": "text" }, { "ClassNames": "email", "DefaultVal": "", "ID": "Field12", "Instructions": "", "IsRequired": "0", "Page": "1", "Title": "E-mail", "Type": "email" }, { "ClassNames": "address", "DefaultVal": "", "ID": "Field2", "Instructions": "", "IsRequired": "0", "Page": "1", "SubFields": [ { "DefaultVal": "", "ID": "Field2", "Label": "Street Address" }, { "DefaultVal": "", "ID": "Field3", "Label": "Address Line 2" }, { "DefaultVal": "", "ID": "Field4", "Label": "City" }, { "DefaultVal": "", "ID": "Field5", "Label": "State / Province / Region" }, { "DefaultVal": "", "ID": "Field6", "Label": "Postal / Zip Code" }, { "DefaultVal": "Brazil", "ID": "Field7", "Label": "Country" } ], "Title": "Endere\u00e7o", "Type": "address" } ] }',
          "FormStructure" => '{ "DateCreated": "2012-07-02 15:48:44", "DateUpdated": "2012-07-02 19:40:09", "Description": "Formul\u00e1rio de demonstra\u00e7\u00e3o da integra\u00e7\u00e3o entre Wufoo e Cobre Gr\u00e1tis.", "Email": null, "EndDate": "2030-01-01 12:00:00", "EntryLimit": "0", "Hash": "m7x1z5", "IsPublic": "1", "Language": "brazilian-portuguese", "Name": "Gerar Boleto Banc\u00e1rio", "RedirectMessage": "Great! Thanks for filling out my form!", "StartDate": "2000-01-01 12:00:00", "Url": "gerar-boleto-bancario" }',
          "Field10" => "20120731",
          "Field9" => "3480",
          "Field1" => "Rafael",
          "Field12" => "contato@rafael.adm.br",
          "Field2" => "Av. Pres. Vargas",
          "Field3" => "",
          "Field4" => "Rio de Janeiro",
          "Field5" => "RJ",
          "Field6" => "20071-004",
          "Field7" => "Brasil",
          "CreatedBy" => "public",
          "DateCreated" => "2012-07-02 15:59:23",
          "EntryId" => "2",
          "IP" => "189.106.9.213",
          "HandshakeKey" => "qMkW4rCAaeRhFEpogLtQQkKOPqwOoBji2Q7kLhISAEjVKubgyzJjBQiV57sz",
        }
      }
      it 'should be ok' do
        VCR.use_cassette('valid-attributes') do
          post '/1349/277', params
          last_response.should be_ok
        end
      end      
    end
    context "invalid attributes" do
      let(:params) {
        {
          "FieldStructure" => '{ "Fields": [ { "ClassNames": "expire_at", "DefaultVal": "", "ID": "Field10", "Instructions": "", "IsRequired": "1", "Page": "1", "Title": "Vencimento", "Type": "eurodate" }, { "ClassNames": "amount", "DefaultVal": "", "ID": "Field9", "Instructions": "", "IsRequired": "1", "Page": "1", "Title": "Valor", "Type": "number" }, { "ClassNames": "name", "DefaultVal": "", "ID": "Field1", "Instructions": "", "IsRequired": "1", "Page": "1", "Title": "Nome", "Type": "text" }, { "ClassNames": "email", "DefaultVal": "", "ID": "Field12", "Instructions": "", "IsRequired": "0", "Page": "1", "Title": "E-mail", "Type": "email" }, { "ClassNames": "address", "DefaultVal": "", "ID": "Field2", "Instructions": "", "IsRequired": "0", "Page": "1", "SubFields": [ { "DefaultVal": "", "ID": "Field2", "Label": "Street Address" }, { "DefaultVal": "", "ID": "Field3", "Label": "Address Line 2" }, { "DefaultVal": "", "ID": "Field4", "Label": "City" }, { "DefaultVal": "", "ID": "Field5", "Label": "State / Province / Region" }, { "DefaultVal": "", "ID": "Field6", "Label": "Postal / Zip Code" }, { "DefaultVal": "Brazil", "ID": "Field7", "Label": "Country" } ], "Title": "Endere\u00e7o", "Type": "address" } ] }',
          "FormStructure" => '{ "DateCreated": "2012-07-02 15:48:44", "DateUpdated": "2012-07-02 19:40:09", "Description": "Formul\u00e1rio de demonstra\u00e7\u00e3o da integra\u00e7\u00e3o entre Wufoo e Cobre Gr\u00e1tis.", "Email": null, "EndDate": "2030-01-01 12:00:00", "EntryLimit": "0", "Hash": "m7x1z5", "IsPublic": "1", "Language": "brazilian-portuguese", "Name": "Gerar Boleto Banc\u00e1rio", "RedirectMessage": "Great! Thanks for filling out my form!", "StartDate": "2000-01-01 12:00:00", "Url": "gerar-boleto-bancario" }',
          "Field10" => "20120731",
          "Field9" => "3480",
          "Field1" => "Rafael",
          "Field12" => "contato@rafael.adm.br",
          "Field2" => "Av. Pres. Vargas",
          "Field3" => "",
          "Field4" => "Rio de Janeiro",
          "Field5" => "RJ",
          "Field6" => "20071-004",
          "Field7" => "Brasil",
          "CreatedBy" => "public",
          "DateCreated" => "2012-07-02 15:59:23",
          "EntryId" => "2",
          "IP" => "189.106.9.213",
          "HandshakeKey" => "QQkKOPqwOoBji2Q7kQiV57szLhISAEjVKqMkW4rCAaeRhFEpogLtubgyzJjB",
        }
      }
      it 'should be 422' do
        VCR.use_cassette('invalid-attributes') do
          post '/1349/277', params
          last_response.status.should == 500
        end
      end      
    end
  end
end