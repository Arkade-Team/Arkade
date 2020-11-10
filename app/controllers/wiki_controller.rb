class WikiController < ApplicationController
  def update
    wiki_data = wiki_update_params
    @wiki = Wiki.new(name: wiki_data[:name])

    if @wiki.save
      render json: { wiki: @wiki }
    end
  end

  private

    def wiki_update_params
      params.require(:readingtime).permit(:wiki)
    end
end
