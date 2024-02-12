class PagesController < ApplicationController
  def home
    render({ :template => "pages/home" })
  end

  def square_results
    @number = params.fetch("square").to_f
    @number_squared = (@number ** 2)

    render({ :template => "pages/square_results" })
  end

  def square_root
    render({ :template => "pages/square_root" })
  end

  def square_root_results
    @number = params.fetch("squareroot").to_f
    @number_square_root = Math.sqrt(@number)

    render({ :template => "pages/square_root_results" })
  end

  def payment    
    render({ :template => "pages/payment" })
  end
  
  def payment_results   
    @APR_raw = params.fetch("APR").to_f
    @APR = @APR_raw.to_fs(:percentage, {:precision => 4})
    @r = @APR_raw/100/12
    
    @numofyears = params.fetch("numofyears").to_i
    @n =  @numofyears * -12
    
    @p = params.fetch("principal").to_f
    @principal = @p.to_fs(:currency)
  
    @numerator = @r * @p
    @demoninator = 1 - (1 + @r) ** @n
  
    @payment = (@numerator/@demoninator).to_fs(:currency)

    render({ :template => "pages/payment_results" })
  end

  def random    
    render({ :template => "pages/random" })
  end

  def random_results
    @min = params.fetch("min").to_f
    @max = params.fetch("max").to_f
    @number_rand = rand(@min..@max)

    render({ :template => "pages/random_results" })
  end

end
