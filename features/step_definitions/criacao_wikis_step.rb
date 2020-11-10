Dado "nenhum registro anterior de wiki" do
  Wiki.delete_all
end

Quando "recebo uma requisição de leitura da Wiki {string}" do |name|
  put '/wikis', {
    readingtime: {
      wiki: {
        name: name,
        tabs: [
          { name: "Foo", body: "Foo body foo" },
          { name: "Baz", body: "Baz body foo" }
        ]
      }
    }
  }
end

Então "a resposta deve conter o registro da Wiki {string}" do |name|
  last_json.should have_json_path("wiki")
end
