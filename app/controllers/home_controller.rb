class HomeController < ApplicationController

  # por convenção, quando esta função for chamada,
  # ela vai buscar por uma view específica:
  # views/home/index.html.erb
  def index
    @team = [
      "Alécio Godoi",
      "Daniel Quiteque",
      "Fábio Nogueira",
      "Gustavo Molina",
      "João Daniel",
      "Pedro França",
      "Fulano de Tal"
    ]
  end
end
