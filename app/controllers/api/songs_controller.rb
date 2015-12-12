class Api::SongsController < ApiController
  include LazyCrud

  def create
    song = current_user.songs.new(song_params)
    song.save

    render json: song
  end

  def current
    user = User.find(params[:id])
    last_song = user.songs.last

    render json: { nid: last_song.try(:nid) }
  end

  private

  def song_params
    params.require(:song).permit(:nid)
  end

end
