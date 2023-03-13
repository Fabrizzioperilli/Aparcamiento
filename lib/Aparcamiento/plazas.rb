#
# Modulo que contiene los datos del programa
#
module Aparcamiento
  #
  # Clase para almacenar los datos de una plaza
  #
  class Plaza
    attr_reader :altura, :longitud, :anchura

    #
    # Inicializa los datos de una plaza
    #
    # @param [Float] altura Recibe un float que representa la altura de la plaza
    # @param [Float] longitud Recibe un float que representa la longitud de la plaza
    # @param [Float] anchura Recibe un float que representa la anchura de la plaza
    #
    def initialize(altura, longitud, anchura)
      if altura >= 0
        @altura = altura
      else
        raise ArgumentError, "La altura debe ser mayor o igual que 0"
      end

      if longitud >= 0
        @longitud = longitud
      else
        raise ArgumentError, "La longitud debe ser mayor o igual que 0"
      end

      if anchura >= 0
        @anchura = anchura
      else
        raise ArgumentError, "La anchura debe ser mayor o igual que 0"
      end
    end

    #
    # Metodo to_s
    #
    # @return [String] Devuelve un string con los datos de la plaza
    #
    def to_s
      ("Altura: #{@altura} Longitud: #{@longitud} Anchura: #{@anchura}")
    end
  end
end