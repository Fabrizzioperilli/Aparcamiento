require "Aparcamiento/datos"
require "Aparcamiento/funcionalidades"
require "Aparcamiento/plazas"
require "Aparcamiento/vehiculo"
require "Aparcamiento/motor"

RSpec.describe Aparcamiento do
  describe "Representación de un vehiculo - Aparcamiento::Vehiculo" do
    before :all do
      @vehiculo = Aparcamiento::Vehiculo.new("1234ABC", 10, 10, 10, 10)
      @vehiculo2 = Aparcamiento::Vehiculo.new("5678DEF", 20, 20, 15, 20)
    end
    
    context "Atributos de la clase Vehiculos" do
      it "Tiene una clase para representar vehiculo" do
        expect(Aparcamiento::Vehiculo.new("1324567", 10, 10, 10, 10)).instance_of?(Aparcamiento::Vehiculo)
      end

      it "Tiene un atributo para identificar un vehiculo" do
        expect{ Aparcamiento::Vehiculo.new("13245", 2, 10, 10, 10) }.to raise_error(RangeError)
      end

      it "Tiene un atributo con la altura en metros" do
        expect{ Aparcamiento::Vehiculo.new("1234567", -2, 10, 10, 10)}.to raise_error(ArgumentError)
      end
      
      it "Tiene un atributo con el ancho en metros" do
        expect{ Aparcamiento::Vehiculo.new("1234567", 10, -10, 10, 10) }.to raise_error(ArgumentError)
      end
      
      it "Tiene un atributo con el largo en metros" do
        expect{ Aparcamiento::Vehiculo.new("1234567", 10, 10, -10, 10) }.to raise_error(ArgumentError)
      end

      it "Tiene un atributo con el peso en toneladas" do
        expect{ Aparcamiento::Vehiculo.new("1234567", 10, 10, 10, -10) }.to raise_error(ArgumentError)
      end
      it "Se obtiene la cadena con la informacion del vehiculo correctamente formateada" do
        expect(@vehiculo.to_s).to eq "Matricula: #{@vehiculo.matricula} Altura: #{@vehiculo.altura} Anchura: #{@vehiculo.anchura} Largo: #{@vehiculo.largo} Peso: #{@vehiculo.peso}"
      end
      it "Se tiene una variable de clase que cuenta el numero de objetos tipo Vehiculo" do
        expect(Aparcamiento::Vehiculo.numero_vehiculo).to eq (6)
      end
      it "Se incluye un Método para comparar vehiculos según su volumen" do
        expect(@vehiculo < @vehiculo2).to be(true)
        expect(@vehiculo <= @vehiculo2).to be(true)
        expect(@vehiculo == @vehiculo2).to be(false)
        expect(@vehiculo > @vehiculo2).to be(false)
        expect(@vehiculo >= @vehiculo2).to be(false)
        expect(@vehiculo >= @vehiculo2).to be(false)
        expect{@vehiculo >= @notor}.to raise_error(TypeError)
        expect{@vehiculo == "notor"}.to raise_error(TypeError)
      end
    end
    context "Herencia de la clase Vehiculo" do
      it "Se espera que una instancia de la clase vehiculo sea Vehiculo" do
        expect(@vehiculo.instance_of? Aparcamiento::Vehiculo).to eq (true)
        expect(@vehiculo.is_a? Aparcamiento::Vehiculo).to eq (true)
      end
      it "Se espera que una instancia de la clase Vehiculo sea un Object" do
        expect(@vehiculo.is_a? Object).to eq (true)
        expect(@vehiculo.instance_of? Object).to eq (false)
        expect(@vehiculo.class.superclass).to eq(Object)
      end
      it "Se espera que una instancia de la clase Vehiculo sea un Basic Object" do
        expect(@vehiculo.is_a? BasicObject).to eq(true)
        expect(@vehiculo.instance_of? BasicObject).to eq(false)
      end
      it "No se espera que una instancia de la clase Vehiculo sea un String" do
        expect(@vehiculo.instance_of? String).to eq (false)
        expect(@vehiculo.is_a? String).to eq (false)
      end
      it "No se espera que una instancia de la clase Vehiculo sea un Numeric" do
        expect(@vehiculo.instance_of? Numeric).to eq (false)
        expect(@vehiculo.is_a? Numeric).to eq (false)
      end
    end
  end

  describe "Representancion de un vehiculo motor - Aparcamiento::Motor" do
    before :all do
      @motor = Aparcamiento::Motor.new("1234ABC", 10, 10, 10, 10, 4, 2, 100, 200)
      @motor2 = Aparcamiento::Motor.new("5678DEF", 20, 20, 15, 20, 4, 8, 100, 200)
    end
    context "Atributos de la clase Motor" do
      it "Tiene una clase para represenar un vehiculo motor" do
        expect(@motor).instance_of?(Aparcamiento::Motor)
      end
      it "Tiene un atributo para el número de ruedas" do
        expect(@motor.n_ruedas).to eq (4)
      end
      it "Tiene un atributo para el número de plazas" do
        expect(@motor.n_plazas).to eq (2)
        expect {Aparcamiento::Motor.new("1234ABC", 10, 10, 10, 10, 4, -2, 100, 200)}.to raise_error(ArgumentError)
      end
      it "Tiene un atributo para representar la potencia del motor en centímetros cúbicos" do
        expect(@motor.potencia).to eq (100)
        expect {Aparcamiento::Motor.new("1234ABC", 10, 10, 10, 10, 4, 2, -100, 200)}.to raise_error(ArgumentError)
      end
      it "Tiene un atributo para representar la velocidad maxima en kilometros horas " do
        expect(@motor.velocidad_max).to eq (200)
        expect {Aparcamiento::Motor.new("1234ABC", 10, 10, 10, 10, 4, 2, 100, -200)}.to raise_error(ArgumentError)
      end
      it "Se tiene una cadena correctamente formateada con la informacion de vehiculo a motor" do
          expect(@motor.to_s).to eq "Ruedas: #{@motor.n_ruedas} Plazas: #{@motor.n_plazas} Potencia: #{@motor.potencia} Velocidad Maxima: #{@motor.velocidad_max}"
      end
      it "Se incluye un Método para comparar vehiculos de motor según el numero de plazas" do
        expect(@motor < @motor2).to be(true)
        expect(@motor <= @motor2).to be(true)
        expect(@motor == @motor2).to be(false)
        expect(@motor > @motor2).to be(false)
        expect(@motor >= @motor2).to be(false)
        expect{@motor >= @vehiculo}.to raise_error(TypeError)
        expect{@motor == "vehiculo"}.to raise_error(TypeError)
      end
    end
    context "Herencia de la clase motor" do
      it "Se espera que una instancia de la clase Motor sea un vehiculo de motor" do
        expect(@motor.instance_of? Aparcamiento::Motor).to eq (true)
        expect(@motor.is_a? Aparcamiento::Motor).to eq (true)
      end
      it "Se espera que una instancia de la clase Motor sea un Vehiculo" do
        expect(@motor).is_a?(Aparcamiento::Vehiculo)
        expect(@motor.instance_of? Aparcamiento::Vehiculo).to eq (false)
        expect(@motor.class.superclass).to eq(Aparcamiento::Vehiculo)
      end
      it "Se espera que una instancia de la clase Motor sea un objeto (Object)" do
        expect(@motor.is_a? Object).to eq (true)
        expect(@motor.instance_of? Object).to eq (false)
        expect(@motor.class.superclass.superclass).to eq(Object)
      end
      it "Se espera que una instancia de la clase Motor sea un objeto (BasicObject)" do
        expect(@motor.is_a? BasicObject).to eq(true)
        expect(@motor.instance_of? BasicObject).to eq(false)
      end
      it "No se espera que un objeto de la clase Motor sea una cadena (String)" do
        expect(@motor.instance_of? String).to eq (false)
        expect(@motor.is_a? String).to eq (false)
      end
      it "No se espera que un objeto de la clase Motor sea una numero (Numeric)" do
        expect(@motor.instance_of? Numeric).to eq (false)
        expect(@motor.is_a? Numeric).to eq (false)
      end
    end
  end
end