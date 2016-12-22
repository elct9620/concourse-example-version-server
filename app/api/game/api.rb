class Game::API < Grape::API
  version :v1, using: :path
  format :json

  get :versions do
    return Version.all.map(&:to_s) if params[:major].nil? && params[:minior].nil?
    Version.where("major >= ? AND minior >= ?", params[:major] || 0, params[:minior] || 0).map(&:to_s)
  end

  params do
    requires :major, type: Fixnum
    requires :minior, type: Fixnum
  end

  put :version do
    version = Version.find_by(major: params[:major], minior: params[:minior])
    version.touch unless version.nil?
    version.as_json(only: [:major, :minior, :updated_at]) || {}
  end

  get :monsters do
    return Monster.all.pluck(:name, :hp, :mp) if params[:major].nil? && params[:minior].nil?
    versions = Version.where("major >= ? AND minior >= ?", params[:major] || 0, params[:minior] || 0)
    Monster.where(version: versions).pluck(:name, :hp, :mp)
  end
end
