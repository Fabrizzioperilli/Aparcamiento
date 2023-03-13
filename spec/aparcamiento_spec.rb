# frozen_string_literal: true
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
    @tiempo_entrada = Time.new(2022, 1, 1, 2, 0, 0, "+02:00")
    @tiempo_salida = Time.new(2022, 1, 1, 2, 50, 0, "+02:00")
    @aeropuerto = Aparcamiento::Aeropuerto.new(1, 1, "1", "1", :Cubierto, :Autobuses, [@plaza1, @plaza2, @plaza3], 1, 100, 5, 1, [@vehiculo1, @vehiculo2], 3)
    @estacion_tren = Aparcamiento::EstacionTren.new(1, 1, "1", "1", :Cubierto, :Autobuses, [@plaza1, @plaza2, @plaza3], 1, 100, 5, 1, [@vehiculo1, @vehiculo2], 20)
    @datos = Aparcamiento::Datos.new(1, 1, "1", "1", :Cubierto, :Autobuses, [@plaza1, @plaza2, @plaza3], 1, 100, 5, 1, [@vehiculo1, @vehiculo2])
  end

  describe "Representacion de los Datos de un aparcamiento - Aparcamiento::Datos" do
    context "Atributos de la clase Aparcamiento::Datos" do
      it "Tiene una clase para almacenar los datos de un aparcamiento" do
        expect(Aparcamiento::Datos).not_to be nil
        expect(@datos).instance_of? Aparcamiento::Datos
      end
      it "Todo aparcamiento tiene un atributo de accesibilidad (1..5)" do
        expect(@datos.accesibilidad).to be 1
        expect { Aparcamiento::Datos.new(-1, 1, "1", "1", :Cubierto, :Autobuses, [@plaza1, @plaza2, @plaza3], 1, 100, 5, 1, [@vehiculo1, @vehiculo2]) }.to raise_error(ArgumentError)
      end
      it "Todo aparcamiento tiene un atributo de seguridad (1..10)" do
        expect(@datos.seguridad).to be 1
        expect { Aparcamiento::Datos.new(1, 20, "1", "1", :Cubierto, :Autobuses, [@plaza1, @plaza2, @plaza3], 1, 100, 5, 1, [@vehiculo1, @vehiculo2]) }.to raise_error(ArgumentError)
      end
      it "Un aparcamiento tiene un atributo para su identificacion" do
        expect(@datos.identificacion).to be "1"
        expect { Aparcamiento::Datos.new(1, 1, 1, "1", :Cubierto, :Autobuses, [@plaza1, @plaza2, @plaza3], 1, 100, 5, 1, [@vehiculo1, @vehiculo2]) }.to raise_error(TypeError)
      end
      it "Un aparcamiento tiene un atributo para el nombre comercial " do
        expect(@datos.nombre).to be "1"
        expect { Aparcamiento::Datos.new(1, 1, "1", 1, :Cubierto, :Autobuses, [@plaza1, @plaza2, @plaza3], 1, 100, 5, 1, [@vehiculo1, @vehiculo2]) }.to raise_error(TypeError)
      end
      it "Un aparcamiento tiene un atributo para su descripción (Cubierto - Descubierto - Mixto)" do
        expect(@datos.descripcion).to be :Cubierto
        expect { Aparcamiento::Datos.new(1, 1, "1", "1", 10000, :Autobuses, [@plaza1, @plaza2, @plaza3], 1, 100, 5, 1, [@vehiculo1, @vehiculo2]) }.to raise_error(ArgumentError)
      end
      it "Tiene un atributo el tipo de aparcamiento (Autobuses, Bicicletas, Coches, Motos)" do
        expect(@datos.tipo_aparcamiento).to be :Autobuses
        expect { Aparcamiento::Datos.new(1, 1, "1", "1", :Cubierto, :Camiones, [@plaza1, @plaza2, @plaza3], 1, 100, 5, 1, [@vehiculo1, @vehiculo2]) }.to raise_error(ArgumentError)
      end
      it "Tiene un atributo para representar el conjunto de plazas (Altura, Longitud, Anchura)" do
        expect { Aparcamiento::Datos.new(1, 1, "1", "1", :Cubierto, :Autobuses, "Array", 1, 100, 5, 1, [@vehiculo1, @vehiculo2]) }.to raise_error(TypeError)
      end
      it "Tiene un atributo para representar el numero de plazas libres y ocupadas" do
        expect(@datos.plazas_libres).to be 1
        expect(@datos.plazas_ocupadas).to be 2
        expect { Aparcamiento::Datos.new(1, 1, "1", "1", :Cubierto, :Autobuses, [@plaza1, @plaza2, @plaza3], -1, 100, 5, 1, [@vehiculo1, @vehiculo2]) }.to raise_error(ArgumentError)
      end
      it "Tiene un metodo para obtener el numero de plazas del aparcamiento" do
        expect(@datos.numero_plazas).to be 3
        expect(@datos.numero_plazas).to be (@datos.plazas_libres + @datos.plazas_ocupadas)
      end
      it "Tiene un metodo para obtener el numero de plazas libres" do
        expect(@datos.plazas_libres).to be 1
        expect(@datos.plazas_libres).to be (@datos.numero_plazas - @datos.plazas_ocupadas)
      end
      it "Tiene un metodo para añadir una plaza" do
        expect { @datos.añadir_plaza("plaza") }.to raise_error(TypeError)
      end
      it "Se tiene un atributo para la distancia al centro de la ciudad" do
        expect(@datos.distancia_centro_cuidad).to eq 100
      end
      it "Se tiene un atributo para representar el numero de plazas de minusvaldios disponible" do
        expect(@datos.n_plazas_minusvalidos_libre).to eq 5
      end
      it "Se tiene un atributo para representar el precio por minuto" do
        expect(@datos.precio_minuto).to eq 1
      end
      it "Se tiene un atributo almacenar un conjunto de vehiculos" do
        expect(@datos.conjunto_vehiculo).instance_of? (Array)
      end

      it "Se incluye el modulo Enumerable" do
        expect(@datos).to be_kind_of(Enumerable)
      end

      it "Muestra los elementos del enumerable con vehiculos" do
        expect(@datos.each { |x| x }).to eq [@vehiculo1, @vehiculo2]
        expect(@datos.map { |x| x }).to eq [@vehiculo1, @vehiculo2]
        expect(@datos.select { |x| x }).to eq [@vehiculo1, @vehiculo2]
        expect(@datos.find { |x| x }).to eq @vehiculo1
        expect(@datos.min { |x, y| x.peso <=> y.peso }).to eq @vehiculo1
      end
      
      it "Utiliza operador [] para acceder a los vehiculos" do
        expect(@datos[0]).to eq @vehiculo1
      end
      it "Se utiliza un metedo para aparcar un vehiculo" do
        expect { @datos.aparcar_vehiculo("vehiculo") }.to raise_error(TypeError)
      end
      it "Tiene un metodo que calcula el tiempo de estancia de un vehiculo" do
        expect(@datos.tiempo_estancia(@tiempo_entrada, @tiempo_salida)).to eq 50
        expect { @datos.tiempo_estancia(200, 200) }.to raise_error(TypeError)
      end
      
      it "Tiene un metodo que calcula el precio de estancia de un vehiculo" do
        expect(@datos.precio_estancia(@tiempo_entrada, @tiempo_salida)).to eq 50
        expect { @datos.precio_estancia(200, 200) }.to raise_error(TypeError)
      end

    end
    context "Herencia de la clase Aparcamiento::Datos" do
      it "Se espera que una instancia de la clase Datos sean los Datos de un aparcamiento" do
        expect(@datos.instance_of? Aparcamiento::Datos).to eq(true)
        expect(@datos.is_a? Aparcamiento::Datos).to eq(true)
      end
      it "Se espera que una instancia de la clase Datos sea un objeto (Object)" do
        expect(@datos.is_a? Object).to eq(true)
        expect(@datos.instance_of? Object).to eq(false)
      end
      it "Se espera que una instancia de la clase Datos sea un objeto (BasicObject)" do
        expect(@datos.is_a? BasicObject).to eq(true)
        expect(@datos.instance_of? BasicObject).to eq(false)
      end
      it "No se espera que una instancia de la clase Datos sea un Vehiculo" do
        expect(@datos.instance_of? Aparcamiento::Vehiculo).to eq(false)
        expect(@datos.is_a? Aparcamiento::Vehiculo).to eq(false)
      end

      it "No se espera que una instancia de la clase Datos sea un Motor" do
        expect(@datos.instance_of? Aparcamiento::Motor).to eq(false)
        expect(@datos.is_a? Aparcamiento::Motor).to eq(false)
      end
    end
  end
  describe "Representacion de un aparcamiento aeropuerto - Aparcamiento::Aeropuerto" do
    context "Atributos de la clase Aparcamiento::Aeropuerto" do
      it "Tiene una clase para almacenar los datos aeropuerto" do
        expect(Aparcamiento::Aeropuerto).not_to be nil
        expect(@aeropuerto).instance_of? Aparcamiento::Aeropuerto
      end
      it "Se tiene un atributo para representar el numero de plantas" do
        expect(@aeropuerto.n_plantas).to eq 3
      end
      
      it "Muestra los elementos del enumerable con vehiculos" do
        expect(@aeropuerto.each { |x| x }).to eq [@vehiculo1, @vehiculo2]
        expect(@aeropuerto.map { |x| x }).to eq [@vehiculo1, @vehiculo2]
        expect(@aeropuerto.select { |x| x }).to eq [@vehiculo1, @vehiculo2]
        expect(@aeropuerto.find { |x| x }).to eq @vehiculo1
        expect(@aeropuerto.min { |x, y| x.peso <=> y.peso }).to eq @vehiculo1
      end
      
      it "Utiliza operador [] para acceder a los vehiculos" do
        expect(@aeropuerto[0]).to eq @vehiculo1
      end
    end
    context "Herencia de la clase Aparcamiento::Aeropuerto" do
      it "Se espera que una instancia de la clase Aeropuerto sean los Datos de un aparcamiento" do
        expect(@aeropuerto.instance_of? Aparcamiento::Datos).to eq(false)
        expect(@aeropuerto.is_a? Aparcamiento::Datos).to eq(true)
      end
      it "Se espera que una instancia de la clase Aeropuerto sea un objeto (Object)" do
        expect(@aeropuerto.is_a? Object).to eq(true)
        expect(@aeropuerto.instance_of? Object).to eq(false)
      end
      it "Se espera que una instancia de la clase Aeropuerto sea un objeto (BasicObject)" do
        expect(@aeropuerto.is_a? BasicObject).to eq(true)
        expect(@aeropuerto.instance_of? BasicObject).to eq(false)
      end
      it "No se espera que una instancia de la clase Aeropuerto sea un Vehiculo" do
        expect(@aeropuerto.instance_of? Aparcamiento::Vehiculo).to eq(false)
        expect(@aeropuerto.is_a? Aparcamiento::Vehiculo).to eq(false)
      end

      it "No se espera que una instancia de la clase Aeropuerto sea un Motor" do
        expect(@datos.instance_of? Aparcamiento::Motor).to eq(false)
        expect(@datos.is_a? Aparcamiento::Motor).to eq(false)
      end
    end
  end

  describe "Representacion de un aparcamiento estacion tren - Aparcamiento::EstacionTren" do
    context "Atributos de la clase Aparcamiento::EstacionTren" do
      it "Tiene una clase para almacenar los estacion tren" do
        expect(Aparcamiento::EstacionTren).not_to be nil
        expect(@estacion_tren).instance_of? Aparcamiento::EstacionTren
      end
      it "Se tiene un atributo para representar el numero de plazas de larga distancia" do
        expect(@estacion_tren.n_plazas_larga_estancia).to eq 20
      end
      it "Muestra los elementos del enumerable con vehiculos" do
        expect(@estacion_tren.each { |x| x }).to eq [@vehiculo1, @vehiculo2]
        expect(@estacion_tren.map { |x| x }).to eq [@vehiculo1, @vehiculo2]
        expect(@estacion_tren.select { |x| x }).to eq [@vehiculo1, @vehiculo2]
        expect(@estacion_tren.find { |x| x }).to eq @vehiculo1
        expect(@estacion_tren.min { |x, y| x.peso <=> y.peso }).to eq @vehiculo1
      end
      it "Utiliza operador [] para acceder a los vehiculos" do
        expect(@estacion_tren[0]).to eq @vehiculo1
      end
    end

    context "Herencia de la clase Aparcamiento::EstacionTren" do
      it "Se espera que una instancia de la clase EstacionTren sea un aparcamiento" do
        expect(@aeropuerto.instance_of? Aparcamiento::Aeropuerto).to eq(true)
        expect(@aeropuerto.is_a? Aparcamiento::Datos).to eq(true)
      end
      it "Se espera que una instancia de la clase EstacionTren sea un objeto (Object)" do
        expect(@aeropuerto.is_a? Object).to eq(true)
        expect(@aeropuerto.instance_of? Object).to eq(false)
      end
      it "Se espera que una instancia de la clase EstacionTren sea un objeto (BasicObject)" do
        expect(@aeropuerto.is_a? BasicObject).to eq(true)
        expect(@aeropuerto.instance_of? BasicObject).to eq(false)
      end
      it "No se espera que una instancia de la clase EstacionTren sea un Vehiculo" do
        expect(@aeropuerto.instance_of? Aparcamiento::Vehiculo).to eq(false)
        expect(@aeropuerto.is_a? Aparcamiento::Vehiculo).to eq(false)
      end
      it "No se espera que una instancia de la clase EstacionTren sea un Motor" do
        expect(@datos.instance_of? Aparcamiento::Motor).to eq(false)
        expect(@datos.is_a? Aparcamiento::Motor).to eq(false)
      end
    end
  end
end