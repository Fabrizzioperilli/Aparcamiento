module Aparcamiento
  #
  # Clase PlazaMinusvalido
  #
  class PlazaMinusvalido < Plaza
    attr_reader :altura, :longitud, :anchura
    #
    # Inicializa los atributos
    #
    # @param [Float] altura 
    # @param [Float] longitud 
    # @param [Float] anchura 
    # @param [Float] espacio_lateral 
    #
    def initialize(altura = 5, longitud = 5, anchura = 2, espacio_lateral = 1.5)
      
      if altura != 5 
        raise ArgumentError, "La altura debe ser 5 metros para las plazas de minusvalidos"
      else
        @altura = altura
      end
      
      if longitud != 5 
        raise ArgumentError, "La longitud debe ser 5 metros para las plazas de minusvalidos"
      else
        @longitud = longitud
      end

      if anchura < 2
        raise ArgumentError, "La anchura debe ser mayor o igual que 2 para las plazas de minusvalidos"
      else 
        @anchura = anchura
      end

      if espacio_lateral < 1.5
        raise ArgumentError, "El espacio lateral debe ser mayor o igual que 1.5 para las plazas de minusvalidos"
      else
        @espacio_lateral = espacio_lateral
      end
      
      super(altura, longitud, anchura)
    end

    #
    # Metodo to_s
    #
    # @return [String] Devuelve un string con los datos
    #
    def to_s
      ("Altura: #{@altura} Longitud: #{@longitud} Anchura: #{@anchura}, Espacio Lateral: #{espacio_lateral}")
    end
  end
end