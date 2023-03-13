module Aparcamiento
  #
  # Clase Aeropuerto
  #
  class Aeropuerto < Datos
    attr_reader :accesibilidad, :seguridad, :identificacion, :nombre, :descripcion, :tipo_aparcamiento, :conjunto_plazas, :plazas_libres, :distancia_centro_cuidad, :n_plazas_minusvalidos_libre, :precio_minuto, :conjunto_vehiculo, :n_plantas

    #
    # Inicializa los datos del aparcamiento
    #
    # @param [Integer] accesibilidad Recibe un entero que representa la accesibilidad del aparcamiento
    # @param [Integer] seguridad Recibe un entero que representa la seguridad del aparcamiento
    # @param [String] identificacion Recibe un string que representa la identificacion del aparcamiento
    # @param [String] nombre Recibe un string que representa el nombre del aparcamiento
    # @param [Symbol] descripcion Recibe un simbolo que representa la descripcion del aparcamiento
    # @param [Symbol] tipo_aparcamiento Recibe un simbolo que representa el tipo de aparcamiento
    # @param [Array] conjunto_plazas Recibe un array que representa el conjunto de plazas del aparcamiento
    # @param [Integer] plazas_libres Recibe un entero que representa el numero de plazas libres del aparcamiento
    #
    # @param [Integer] n_plantas Numero de plantas 
    #
    def initialize(accesibilidad, seguridad, identificacion, nombre, descripcion, tipo_aparcamiento, conjunto_plazas, plazas_libres, distancia_centro_cuidad, n_plazas_minusvalidos_libre, precio_minuto, conjunto_vehiculo, n_plantas)
      super(accesibilidad, seguridad, identificacion, nombre, descripcion, tipo_aparcamiento, conjunto_plazas, plazas_libres, distancia_centro_cuidad, n_plazas_minusvalidos_libre, precio_minuto, conjunto_vehiculo)

      if n_plantas < 0
        raise ArgumentError, "El numero de plantas debe ser mayor que 0"
      elsif !n_plantas.is_a? Integer
        raise TypeError, "El numero de plantas debe ser un entero"
      else
        @n_plantas = n_plantas
      end
    end

    #
    # Metodo to_s
    #
    # @return [String]
    #
    def to_s
      ("Nombre aparcamiento: #{@nombre}\nIdentificacion: #{@identificacion}\nAccesibilidad: #{@accesibilidad}\nSeguridad: #{@seguridad}\nPlazas disponibles: #{@plazas_libres}\nPlazas ocupadas: #{@plazas_ocupadas}\nTipo de aparcamiento: #{@tipo_aparcamiento}\nNúmero plantas: #{@n_plantas}")
    end
  end
end
