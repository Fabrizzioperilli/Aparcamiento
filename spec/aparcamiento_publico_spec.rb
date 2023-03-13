require "Aparcamiento/datos"
require "Aparcamiento/funcionalidades"
require "Aparcamiento/plazas"
require "Aparcamiento/vehiculo"
require "Aparcamiento/motor"
require "Aparcamiento/aeropuerto"
require "Aparcamiento/estacion"

RSpec.describe Aparcamiento do
  before :all do
    @plaza1 = Aparcamiento::Plaza.new(10, 20, 30)
    @plaza2 = Aparcamiento::Plaza.new(40, 40, 40)
    @plaza3 = Aparcamiento::Plaza.new(10, 10, 10)
    @vehiculo1 = Aparcamiento::Vehiculo.new("1234ABC", 10, 10, 10, 10)
    @vehiculo2 = Aparcamiento::Vehiculo.new("1239DEF", 10, 10, 10, 10)
    @aparcamiento1 = Aparcamiento::Datos.new(1, 1, "1", "1", :Cubierto, :Autobuses, [@plaza1, @plaza2, @plaza3], 2, 10, 2, 1, [@vehiculo1])
    @aparcamiento2 = Aparcamiento::Datos.new(1, 1, "2", "2", :Descubierto, :Coches, [@plaza1, @plaza2, @plaza3], 1, 50, 0, 0.08, [@vehiculo1, @vehiculo2])
    @aparcamiento3 = Aparcamiento::Datos.new(1, 1, "3", "3", :Cubierto, :Autobuses, [@plaza1, @plaza2, @plaza3], 3, 30, 7, 0.3, [@vehiculo1, @vehiculo2])
    @aparcamiento4 = Aparcamiento::Datos.new(1, 1, "4", "4", :Descubierto, :Coches, [@plaza1, @plaza2, @plaza3], 0, 10, 0, 1, [@vehiculo1, @vehiculo2])
    @aparcamiento5 = Aparcamiento::Datos.new(1, 1, "5", "5", :Cubierto, :Autobuses, [@plaza1, @plaza2, @plaza3], 0, 10, 5, 1, [@vehiculo1, @vehiculo2])
    @vector_aparcamientos = [@aparcamiento1, @aparcamiento2, @aparcamiento3, @aparcamiento4, @aparcamiento5]
  end

  describe "Representación de índice de sostenibilidad de un aparcamiento" do
    it "Se espera un método de la clase datos que repesente el índidce se sostenibilidad" do
      expect(@aparcamiento1.indice_sostenibilidad).to eq (1)
      expect(@aparcamiento2.indice_sostenibilidad).to eq (3)
      expect(@aparcamiento3.indice_sostenibilidad).to eq (2)
      expect(@aparcamiento1.indice_sostenibilidad).not_to eq (nil)
    end
    it "Se espera un conjunto de aparcamientos de una ciudad. Seleccionando los aparcamientos con plazas libres y con indice de sostenibilidad mas alto" do
      expect(@vector_aparcamientos.select{|x| Aparcamiento::Funcionalidades::estado(x) == :Libre}.max).to eq (@aparcamiento2)
      expect(@vector_aparcamientos.select{|x| Aparcamiento::Funcionalidades::estado(x) == :Libre}.max).not_to eq (@aparcamiento1)
    end
    it "Se espera un conjunto de aparcamientos de una ciudad. Seleccionando los aparcamientos con plazas libres para minusvalidos y con indice de sostenibilidad mas alto" do
      expect(@vector_aparcamientos.select{|x| Aparcamiento::Funcionalidades::n_plazas_minusvalidos_libre(x) > 0}.max).to eq (@aparcamiento3)
      expect(@vector_aparcamientos.select{|x| Aparcamiento::Funcionalidades::n_plazas_minusvalidos_libre(x) > 0}.max).not_to eq (@aparcamiento1)
    end
    it "Se espera un conjunto de aparcamientos de una ciudad. Calculamos el porcentaje de ocupación de cada uno de ellos" do
      expect(@vector_aparcamientos.collect{|x| Aparcamiento::Funcionalidades::porcentaje_plazas_ocupadas(x)}).to eq ([66, 33, 100, 0, 0])
      expect(@vector_aparcamientos.collect{|x| Aparcamiento::Funcionalidades::porcentaje_plazas_ocupadas(x)}).not_to eq(nil)
    end
    it "Se espera un conjunto de aparcamientos de una ciudad. Calculando el porcentaje de ocupacion plazas minusvalido" do
      expect(@vector_aparcamientos.collect{|x| Aparcamiento::Funcionalidades::porcentaje_plazas_libres_minusvalidos(x)}).to eq ([100, 0, 100, 0, 100])
    end
  end
end