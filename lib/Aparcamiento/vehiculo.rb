#
# Módulo Aparcamiento
#
module Aparcamiento
  #
  # Clase Vehiculo
  #
  class Vehiculo
    include Comparable
    attr_reader :matricula, :altura, :anchura, :largo, :peso

    #
    # Inicializa los atributos de la clase
    #
    # @param [String] matricula
    # @param [Float] altura
    # @param [Float] anchura
    # @param [Float] largo
    # @param [Float] peso
    #
    def initialize(matricula, altura, anchura, largo, peso)
      if !matricula.instance_of?(String)
        raise ArgumentError, "La matricula debe ser un string"
      elsif matricula.length != 7
        raise RangeError, "La matricula debe tener 7 caracteres"
      else
        @matricula = matricula
      end

      if altura <= 0
        raise ArgumentError, "La altura debe ser mayor que 0"
      else
        @altura = altura
      end

      if anchura <= 0
        raise ArgumentError, "La anchura debe ser mayor que 0"
      else
        @anchura = anchura
      end

      if largo <= 0
        raise ArgumentError, "El largo debe ser mayor que 0"
      else
        @largo = largo
      end

      if peso <= 0
        raise ArgumentError, "El peso debe ser mayor que 0"
      else
        @peso = peso
      end

      if defined? @@numero_vehiculo
        @@numero_vehiculo += 1
      else
        @@numero_vehiculo = 0
      end
    end

    #
    # Método to_s
    #
    # @return [String]
    #
    def to_s
      ("Matricula: #{@matricula} Altura: #{@altura} Anchura: #{@anchura} Largo: #{@largo} Peso: #{@peso}")
    end

    #
    # Método de clase que retorna el numero de objetos creados de la clase
    #
    # @return [Integer]
    #
    def self.numero_vehiculo
      @@numero_vehiculo
    end

    #
    # Método comparable
    #
    # @param [Aparcamiento::Vehiculo.new] other
    #
    # @return [Bool]
    #
    def <=>(other)
      if other.instance_of?(Aparcamiento::Vehiculo)
        @altura * @anchura * @largo <=> other.altura * other.anchura * other.largo
      else
        raise TypeError, "No se pueden comparar objetos de diferente tipo"
      end
    end
  end
end
