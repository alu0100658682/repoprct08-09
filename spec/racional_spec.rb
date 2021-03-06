require 'rubygems'
require 'bundler/setup'
require 'nokogiri'

require "rspec"
require "../lib/matriz.rb"
require "../lib/racional.rb"

describe Matrices do
  before :each do
    @r1 = Racional.new(4,8)
    @r2 = Racional.new(2,8)
    @r3 = Racional.new(3,8)
    @r4 = Racional.new(5,8)

    @matriz = Matrices.new([[1,3,5],[2,4,6],[7,8,9]])
    @matriz2 = Matrices.new([[1,3,5],[2,4,6],[7,8,9]])

    @matrac1 = Matrices.new([[@r1,@r2],[@r3,@r4]])
    @matrac2 = Matrices.new([[@r4,@r3],[@r2,@r1]])

    
  end

########SUMA MATRICES
  it "Se debe poder sumar dos matrices de enteros" do
    @aux = Matrices.new([[1,1,1],[1,1,1],[1,1,1]])
    (@matriz + @aux).matriz.should == [[2,4,6],[3,5,7],[8,9,10]]
  end

########SUMA MATRICES RACIONALES
  it "Se debe poder sumar dos matrices de racionales" do
    @matracsum = Matrices.new([[@r1+@r4,@r2+@r3],[@r3+@r2,@r4+@r1]])
    (@matrac1+@matrac2).matriz.should == @matracsum.matriz
  end

########RESTA MATRICES
  it "Se debe poder restar dos matrices de enteros" do
    @aux = Matrices.new([[1,1,1],[1,1,7],[1,1,1]])
    (@matriz - @aux).matriz.should == [[0,2,4],[1,3,-1],[6,7,8]]
  end

########RESTA MATRICES RACIONALES
  it "Se debe poder restar dos matrices de racionales" do
    @matracres = Matrices.new([[@r1-@r4,@r2-@r3],[@r3-@r2,@r4-@r1]])
    (@matrac1-@matrac2).matriz.should == @matracres.matriz
  end


#########PRODUCTO MATRICES
  it "Se debe poder multiplicar dos matrices de enteros" do
    @aux = Matrices.new([[1,2,3],[1,2,3],[1,2,3]])
    (@matriz * @aux).matriz.should == [[9,18,27],[12,24,36],[24,48,72]]
  end

########PRODUCTO MATRICES RACIONALES
#  it "Se debe poder multiplicar dos matrices de racionales" do
#    @matracprod = Matrices.new([[@r1 * @r4, @r2 * @r3], [@r3 * @r2, @r4 * @r1]])
#    (@matrac1 * @matrac2).matriz.should == @matracprod.matriz
#  end

#########TRASPUESTA MATRICES   
  it "Se debe mostrar la traspuesta de una matriz" do
	@aux = Matrices.new([[1,2,7],[3,4,8],[5,6,9]])
	@matriz.traspuesta.matriz.should == @aux.matriz
  end

#########TRASPUESTA MATRICES RACIONALES
  it "Se debe mostrar la traspuesta de una matriz de racionales" do
	@aux = Matrices.new([[@r1,@r3],[@r2,@r4]])
	@matrac1.traspuesta.matriz.should == @aux.matriz
  end



#########OPUESTA MATRICES

  it "Se debe mostrar la opuesta de una matriz" do
	@op = Matrices.new([[-1,-3,-5],[-2,-4,-6],[-7,-8,-9]])
	@matriz2.opuesta.matriz.should == @op.matriz
  end

end











