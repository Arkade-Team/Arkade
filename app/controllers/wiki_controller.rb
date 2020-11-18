class WikiController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]

  def index
    @wikis = Wiki.all
    @wikisTotal = Wiki.joins(:readingtimes).count
    @wikisTopFive = Wiki.joins("left join readingtimes on readingtimes.wiki_id = wikis.id").order("count(wikis.id) DESC").group(:name).limit(5).count
    @wikisBottomFive = Wiki.joins("left join readingtimes on readingtimes.wiki_id = wikis.id").order("count(wikis.id) ASC").group(:name).limit(5).count
  end

  def update
    begin
      wiki_data = wiki_update_params

      @wiki = find_by_name_or_create(wiki_data[:name])

      if @wiki.valid?
        @wiki.readingtimes << Readingtime.create
        render json: { wiki: Wiki.with_readings_of(@wiki.id) }
      else
        render json: { errors: @wiki.errors }
      end
    rescue => error
      render json: error, status: 400
    end
  end

  private

    def find_by_name_or_create(name)
      Wiki.find_by_name(name) || Wiki.create(name: name)
    end

    def wiki_update_params
      params.require(:readingtime).require(:wiki).permit(:name)
    end
end
