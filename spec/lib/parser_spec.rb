# -*- encoding : utf-8 -*-
require "spec_helper"

describe Parser do
  let(:params) {
    {
      "FieldStructure" => {
        "Fields" => [
          {
            "Title" => "Vencimento",
            "Instructions" => "",
            "IsRequired" => "1",
            "ClassNames" => "expire_at",
            "DefaultVal" => "",
            "Page" => "1",
            "Type" => "eurodate",
            "ID" => "Field10"
          }, {
            "Title" => "Valor",
            "Instructions" => "",
            "IsRequired" => "1",
            "ClassNames" => "amount",
            "DefaultVal" => "",
            "Page" => "1",
            "Type" => "number",
            "ID" => "Field9"
          }, {
            "Title" => "Nome",
            "Instructions" => "",
            "IsRequired" => "1",
            "ClassNames" => "bold name",
            "DefaultVal" => "",
            "Page" => "1",
            "Type" => "text",
            "ID" => "Field1"
          }, {
            "Title" => "E-mail",
            "Instructions" => "",
            "IsRequired" => "0",
            "ClassNames" => "email bold",
            "DefaultVal" => "",
            "Page" => "1",
            "Type" => "email",
            "ID" => "Field12"
          }, {
            "Title" => "Endereço",
            "Instructions" => "",
            "IsRequired" => "1",
            "ClassNames" => "address",
            "DefaultVal" => "",
            "Page" => "1",
            "SubFields" => [{
                "DefaultVal" => "",
                "ID" => "Field2",
                "Label" => "Street Address"
              },        {
                "DefaultVal" => "",
                "ID" => "Field3",
                "Label" => "Address Line 2"
              },        {
                "DefaultVal" => "",
                "ID" => "Field4",
                "Label" => "City"
              },        {
                "DefaultVal" => "",
                "ID" => "Field5",
                "Label" => "State / Province / Region"
              },        {
                "DefaultVal" => "",
                "ID" => "Field6",
                "Label" => "Postal / Zip Code"
              },        {
                "DefaultVal" => "Brazil",
                "ID" => "Field7",
                "Label" => "Country"
              }],
            "Type" => "address",
            "ID" => "Field2"
          }
        ]
      },
      "FormStructure" => {
        "Name" => "Gerar Boleto Bancário",
        "Description" => "Formulário de demonstração da integração entre Wufoo e Cobre Grátis.",
        "RedirectMessage" => "Great! Thanks for filling out my form!",
        "Url" => "gerar-boleto-bancario",
        "Email" => "null",
        "IsPublic" => "1",
        "Language" => "brazilian-portuguese",
        "StartDate" => "2000-01-01 12:00:00",
        "EndDate" => "2030-01-01 12:00:00",
        "EntryLimit" => "0",
        "DateCreated" => "2012-07-02 15:48:44",
        "DateUpdated" => "2012-07-02 15:58:08",
        "Hash" => "m7x1z5"
      },
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
      "HandshakeKey" => "handshake",
    }
  }
  let(:parser) { Parser.new(params) }
  describe :bank_billet_attributes do
    it {
      parser.bank_billet_attributes.should == {
        amount: 34.80,
        expire_at: Date.parse('2012-07-31'),
        name: "Rafael",
        address: "Av. Pres. Vargas",
        city: "Rio de Janeiro",
        state: "RJ",
        zipcode: "20071-004",
        email: {
          name: "Rafael",
          address: "contato@rafael.adm.br"
        }
      }
    }
  end
  describe :cobregratis_token do
    it { parser.cobregratis_token.should == "handshake" }
  end
end