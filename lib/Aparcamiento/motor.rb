module Aparcamiento
  #
  # Clase Motor. Clase hija de la clase Vehiculo
  #
  class Motor < Vehiculo
    attr_reader :n_ruedas, :n_plazas, :potencia, :velocidad_max
    #
    # Inicializa los atributos de la clase
    #
    # @param [Float] n_ruedas Numero de ruedas
    # @param [Float] plazas Numeor de plazas
    # @param [Float] potencia Cantidad de potencia
    # @param [Float] velocidad_max Velocidad Máxima
    #
    def initialize (matricula, altura, anchura, largo, peso, n_ruedas, plazas, potencia, velocidad_max)  
      super(matricula, altura, anchura, largo, peso)
      
      if n_ruedas < 2
        raise ArgumentError, "El numero de ruedas debe ser mayor que 1"
      elsif !n_ruedas.instance_of?(Integer)
        raise ArgumentError, "El numero de ruedas debe ser un entero"
      else
        @n_ruedas = n_ruedas
      end

      if plazas <= 1
        raise ArgumentError, "El numero de plazas debe ser mayor que 0"
      elsif !plazas.instance_of?(Integer)
        raise ArgumentError, "El numero de plazas debe ser un entero"
      else
        @n_plazas = plazas
      end

      if potencia <= 0
        raise ArgumentError, "La potencia debe ser mayor que 0"
      else
        @potencia = potencia
      end

      if velocidad_max <= 0
        raise ArgumentError, "La velocidad maxima debe ser mayor que 0"
      else
        @velocidad_max = velocidad_max
      end
    end

    #
    # Método to_s
    #
    # @return [String]
    #
    def to_s 
      ("Ruedas: #{n_ruedas} Plazas: #{n_plazas} Potencia: #{potencia} Velocidad Maxima: #{velocidad_max}")
    end

    #
    # Mñétodo Comparable
    #
    # @param [Aparcamiento::Motor.new] other Otro objeto de la misma clase
    #
    # @return [Bool]
    #
    def <=>(other)
      if (other.instance_of?(Aparcamiento::Motor))
       return @n_plazas <=> other.n_plazas
      else 
        raise TypeError, "No se pueden comparar objetos de diferente tipo"
      end
    end
  end
end