class ProductsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
  before_filter :authorize_admin, only: [:new, :create, :destroy]

  # GET /products
  # GET /products.json
  def index
  	@categories = Category.all
    @products = Product.order(params[:order]).paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @photos = @product.photos
	@related_products = Product.where("category_id = ? and manufacturer_id = ? and id <> ?", @product.category, @product.manufacturer,@product.id ).limit(6)
    @reviews = @product.reviews.paginate(:page => params[:page], :per_page => 10)
    @manufacturer_products = @product.manufacturer.products.where("id <> ?",@product.id).limit(5)
    if (current_user != nil)
      @cart = User.find(session[:user_id]).cart
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @manufacturers = Manufacturer.all
    @categories = Category.all
    @product.photos.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
    @manufacturers = Manufacturer.all
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    @manufacturers = Manufacturer.all
    @categories = Category.all
    respond_to do |format|
      if @product.save
        
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
