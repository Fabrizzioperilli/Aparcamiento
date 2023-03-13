# frozen_string_literal: true
require "Aparcamiento/datos"
require "Aparcamiento/funcionalidades"
require "Aparcamiento/plazas"
require "Aparcamiento/vehiculo"
require "Aparcamiento/motor"

RSpec.describe Aparcamiento do
  before :all do
    @plaza1 = Aparcamiento::Plaza.new(10, 20, 30)
    @plaza2 = Aparcamiento::Plaza.new(40, 40, 40)
    @plaza3 = Aparcamiento::Plaza.new(10, 10, 10)
    @vehiculo1 = Aparcamiento::Vehiculo.new("1234ABC", 10, 10, 10, 10)
    @vehiculo2 = Aparcamiento::Vehiculo.new("1239DEF", 10, 10, 10, 10)
    @datos = Aparcamiento::Datos.new(1, 1, "1", "1", :Cubierto, :Autobuses, [@plaza1, @plaza2, @plaza3], 1, 100, 5, 1, [@vehiculo1, @vehiculo2])
  end

  it "Tiene un numero de version, usando la sintaxis X.Y.Z" do
    expect(Aparcamiento::VERSION).not_to be nil
  end

  context "Interfaz de las Funcionalidades - Aparcamiento::Funciones" do
    it "Se cuenta con una constante para representar si el aparcamiento esta completo" do
      expect(Aparcamiento::Funcionalidades::COMPLETO).not_to be nil
    end
    it "Se cuenta con una constante para representar si el aparcamiento esta libre" do
      expect(Aparcamiento::Funcionalidades::LIBRE).not_to be nil
    end
    it "Se cuenta con una funcion para mostrar el estado del aparcamiento (COMPLETO, LIBRE) " do
      expect(Aparcamiento::Funcionalidades.estado("datos")).to be nil
      expect(Aparcamiento::Funcionalidades.estado(@datos)).to be Aparcamiento::Funcionalidades::LIBRE
    end
    it "Se cuenta con una funcion para mostrar el porcentaje de plazas reservadas para minusvalidos" do
      expect(Aparcamiento::Funcionalidades.porcentaje_reverva_plazas_minusvalidos("datos", 10)).to be nil
      expect(Aparcamiento::Funcionalidades.porcentaje_reverva_plazas_minusvalidos(@datos, 10)).to be false
    end
    it "Se cuenta con una funcion para mostrar el numero de plazas libres para minusvalidos" do
      expect(Aparcamiento::Funcionalidades.n_plazas_minusvalidos_libre("datos")).to be nil
      expect(Aparcamiento::Funcionalidades.n_plazas_minusvalidos_libre(@datos)).to be 5
    end
    it "Se cuenta con una funcion para mostrar el numero de vehiculos estacionados" do
      expect(Aparcamiento::Funcionalidades.n_vehiculos_estacionados("datos")).to be nil
      expect(Aparcamiento::Funcionalidades.n_vehiculos_estacionados(@datos)).to be 2
    end
  end

  context "Herencia del módulo Aparcamiento" do
    it "Se espera que un aparcamiento sea un objeto de la clase Module" do
      expect(Aparcamiento.is_a? Module).to eq (true)
      expect(Aparcamiento.instance_of? Module).to eq (true)
    end
    it "Se espera que un aparcamiento sea un objeto (Object)" do
      expect(Aparcamiento.is_a? Object).to eq (true)
      expect(Aparcamiento.instance_of? Object).to eq (false)
    end
    it "Se espera que un aparcamiento sea un objeto (BasicObject)" do
      expect(Aparcamiento.is_a? BasicObject).to eq (true)
      expect(Aparcamiento.instance_of? BasicObject).to eq (false)
    end
    it "No se espera que un aparcamiento sea una clase (Class)" do
      expect(Aparcamiento.is_a? Class).to eq (false)
      expect(Aparcamiento.instance_of? Class).to eq (false)
    end
    it "No se espera que un aparcamiento sea un Vehiculo" do
      expect(Aparcamiento.is_a? Aparcamiento::Vehiculo).to eq (false)
      expect(Aparcamiento.instance_of? Aparcamiento::Vehiculo).to eq (false)
    end
    it "No se espera que un aparcamiento sea un Motor" do
      expect(Aparcamiento.is_a? Aparcamiento::Motor).to eq (false)
      expect(Aparcamiento.instance_of? Aparcamiento::Motor).to eq (false)
    end
  end  
end