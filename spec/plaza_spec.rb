require "Aparcamiento/datos"
require "Aparcamiento/funcionalidades"
require "Aparcamiento/plazas"
require "Aparcamiento/vehiculo"
require "Aparcamiento/motor"
require "Aparcamiento/plaza_minusvalido"

RSpec.describe Aparcamiento do
  before :all do
    @plaza1 = Aparcamiento::Plaza.new(10, 20, 30)
    @plaza2 = Aparcamiento::Plaza.new(40, 40, 40)
    @plaza3 = Aparcamiento::Plaza.new(10, 10, 10)
    @plaza_minusvalido = Aparcamiento::PlazaMinusvalido.new()
  end
  describe "Clase que representa las plazas de un aparcamiento -- Aparcamiento::Plaza" do
    context "Atributos de la clase Aparcamiento::Plaza" do
      it "Tiene una clase para almacenar los datos de una plaza" do
        expect(@plaza1).instance_of? Aparcamiento::Plaza
      end
      it "Tiene un atributo para representar la altura" do
        expect(@plaza1.altura).to be 10
        expect { Aparcamiento::Plaza.new(-1, 10, 20) }.to raise_error(ArgumentError)
      end
      it "Tiene un atributo para representar la longitud" do
        expect(@plaza1.longitud).to be 20
        expect { Aparcamiento::Plaza.new(10, -10, 30) }.to raise_error(ArgumentError)
      end
      it "Tiene un atributo para representar la anchura" do
        expect(@plaza1.anchura).to be 30
        expect { Aparcamiento::Plaza.new(10, 10, -10) }.to raise_error(ArgumentError)
      end
      it "Tiene un metodo to_s" do
        expect(@plaza1.to_s).to eq "Altura: 10 Longitud: 20 Anchura: 30"
      end
    end
    context "Herencia de la clase Aparcamiento::Plaza" do
      it "Se espera que una instancia de la clase Plaza sea un objeto (Object)" do
        expect(@plaza1.is_a? Object).to eq(true)
        expect(@plaza1.instance_of? Object).to eq(false)
      end
      it "Se espera que una instancia de la clase Plaza sea un objeto (BasicObject)" do
        expect(@plaza1.is_a? BasicObject).to eq(true)
        expect(@plaza1.instance_of? BasicObject).to eq(false)
      end
      it "No se espera que una instancia de la clase Plaza sea un Vehiculo" do
        expect(@plaza1.instance_of? Aparcamiento::Vehiculo).to eq(false)
        expect(@plaza1.is_a? Aparcamiento::Vehiculo).to eq(false)
      end

      it "No se espera que una instancia de la clase Plaza sea un Motor" do
        expect(@plaza1.instance_of? Aparcamiento::Motor).to eq(false)
        expect(@plaza1.is_a? Aparcamiento::Motor).to eq(false)
      end
    end
  end
  describe "Clase que representa las plazas de un aparcamiento -- Aparcamiento::PlazaMinusvalido" do
    context "Atributos de la clase Aparcamiento::PlazaMinusvalido" do
      it "Tiene una clase para almacenar los datos de una plaza minusvalido" do
        expect(@plaza_minusvalido).instance_of? Aparcamiento::PlazaMinusvalido
      end
    end
    context "Herencia de la clase Aparcamiento::PlazaMinusvalido" do
      it "Se espera que una instancia de la clase PlazaMinusvalido sea una Plaza" do
        expect(@plaza_minusvalido.is_a? Aparcamiento::Plaza).to eq(true)
        expect(@plaza_minusvalido.instance_of? Aparcamiento::Plaza).to eq(false)
      end
      it "Se espera que una instancia de la clase PlazaMinusvalido sea un objeto (Object)" do
        expect(@plaza_minusvalido.is_a? Object).to eq(true)
        expect(@plaza_minusvalido.instance_of? Object).to eq(false)
      end
      it "Se espera que una instancia de la clase PlazaMinusvalido sea un objeto (BasicObject)" do
        expect(@plaza_minusvalido.is_a? BasicObject).to eq(true)
        expect(@plaza_minusvalido.instance_of? BasicObject).to eq(false)
      end
      it "No se espera que una instancia de la clase PlazaMinusvalido sea un Vehiculo" do
        expect(@plaza_minusvalido.instance_of? Aparcamiento::Vehiculo).to eq(false)
        expect(@plaza_minusvalido.is_a? Aparcamiento::Vehiculo).to eq(false)
      end

      it "No se espera que una instancia de la clase PlazaMinusvalido sea un Motor" do
        expect(@plaza_minusvalido.instance_of? Aparcamiento::Motor).to eq(false)
        expect(@plaza_minusvalido.is_a? Aparcamiento::Motor).to eq(false)
      end
    end
  end
end
