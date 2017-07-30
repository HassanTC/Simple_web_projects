class ChecksController < ApplicationController

  def find
    system_libararies = Information.search(params[:gem_name], params[:os_name])
    if system_libararies
      render json: {
        total: system_libararies.size,
        libararies: system_libararies,
        install_code: Osystem.get_install_code(params[:os_name]),
        status: 200
      },status: :ok
    else
      render json: { erorr: "Not found!", status: 404 },status: :not_found
    end
  end

  def add
    rgem = Rgem.find_or_create_by(name: params[:gemname])
    os   = Osystem.create_with(install_code: params[:install_code]).find_or_create_by(name: params[:os_name])
    sys  = Systemlib.find_or_create_by(name: params[:systemlib_name])
    info = Information.new(rgem_id: rgem.id,
                           osystem_id: os.id,
                           systemlib_id: sys.id
                          )
    if info.valid?
      info.save!
      render json: { msg: "Gem added succefully" }, status: :ok
    elsif info.invalid?
      render json: {erorrs: info.errors.messages},status: :unprocessable_entity
    else
      render json: {erorrs: "internal Erorr"}
    end
  end
  def home
    #code
  end
end
