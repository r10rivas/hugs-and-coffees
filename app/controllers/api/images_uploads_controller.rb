class Api::ImagesUploadsController < ActiveStorage::BaseController
  skip_before_action :verify_authenticity_token

  def create
    blob = ActiveStorage::Blob.create_and_upload!(
      io: params[:image][:file].to_io,
      filename: params[:image][:filename]
    )

    render json: { id: blob.signed_id }
  end

  def show
    blob = ActiveStorage::Blob.find_signed(params[:blob_id])

    redirect_to(rails_service_blob_path(signed_id: blob.signed_id,filename: blob.filename))
  end
end
