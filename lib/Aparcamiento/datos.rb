#
# Modulo que contiene los datos del programa
#
module Aparcamiento
  #
  # Clase para almacenar los datos de un aparcamiento
  #
  class Datos
    include Enumerable
    include Comparable
    attr_reader :accesibilidad, :seguridad, :identificacion, :nombre, :descripcion, :tipo_aparcamiento, :conjunto_plazas, :plazas_ocupadas, :plazas_libres, :distancia_centro_cuidad, :n_plazas_minusvalidos_libre, :precio_minuto, :conjunto_vehiculo

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
    def initialize(accesibilidad, seguridad, identificacion, nombre, descripcion, tipo_aparcamiento, conjunto_plazas, plazas_libres, distancia_centro_cuidad, n_plazas_minusvalidos_libre, precio_minuto, conjunto_vehiculo)
      if accesibilidad >= 1 && accesibilidad <= 5
        @accesibilidad = accesibilidad
      else
        raise ArgumentError, "La accesibilidad debe ser un valor entre 1 y 5"
      end

      if seguridad >= 1 && seguridad <= 10
        @seguridad = seguridad
      else
        raise ArgumentError, "La seguridad debe ser un valor entre 1 y 10"
      end

      if identificacion.is_a? String
        @identificacion = identificacion
      else
        raise TypeError, "La identificacion debe ser un string"
      end

      if nombre.is_a? String
        @nombre = nombre
      else
        raise TypeError, "El nombre debe ser un string"
      end

      if descripcion == :Cubierto || descripcion == :Descubierto || descripcion == :Mixto
        @descripcion = descripcion
      else
        raise ArgumentError, "La descripcion debe ser cubierto, descubierto o mixto"
      end

      if tipo_aparcamiento == :Autobuses || tipo_aparcamiento == :Bicicletas || tipo_aparcamiento == :Coches || tipo_aparcamiento == :Motos
        @tipo_aparcamiento = tipo_aparcamiento
      else
        raise ArgumentError, "El tipo de aparcamiento debe ser Autobuses, Bicicletas, Coches o Motos"
      end

      if conjunto_plazas.is_a? Array
        if conjunto_plazas.all? { |plaza| plaza.is_a? Plaza }
          @conjunto_plazas = conjunto_plazas
        else
          raise TypeError, "El conjunto de plazas debe ser un array de plazas"
        end
      else
        raise TypeError, "El conjunto de plazas debe ser un array"
      end

      if plazas_libres <= conjunto_plazas.length && plazas_libres >= 0
        @plazas_libres = plazas_libres
        @plazas_ocupadas = conjunto_plazas.length - plazas_libres
      else
        raise ArgumentError, "El numero de plazas libres debe ser menor o igual que el numero de plazas totales"
      end

      if distancia_centro_cuidad < 0
        raise ArgumentError, "La distancia al centro de la cuidad debe ser mayor que 0"
      else
        @distancia_centro_cuidad = distancia_centro_cuidad
      end

      if n_plazas_minusvalidos_libre < 0
        raise ArgumentError, "El numero de plazas para minusvalidos debe ser mayor que 0"
      elsif !n_plazas_minusvalidos_libre.instance_of? Integer
        raise TypeError, "El numero de plazas para minusvalidos debe ser un entero"
      else
        @n_plazas_minusvalidos_libre = n_plazas_minusvalidos_libre
      end

      if precio_minuto < 0
        raise ArgumentError, "El precio por minuto debe ser mayor que 0"
      else
        @precio_minuto = precio_minuto
      end

      if conjunto_vehiculo.is_a? Array
        if conjunto_vehiculo.all? { |i| i.is_a? Aparcamiento::Vehiculo }
          @conjunto_vehiculo = conjunto_vehiculo
        else
          raise TypeError, "El conjunto de vehiculos debe ser un array de vehiculos"
        end
      else
        raise TypeError, "El conjunto de vehiculos debe ser un array"
      end
    end

    #
    # Metodo que devuelve el numero de plazas del aparcamiento
    #
    # @return [Integer] Devuelve el numero de plazas
    #
    def numero_plazas
      @conjunto_plazas.size
    end

    #
    # Metodo que devulve el numero de plazas libres del aparcamiento
    #
    # @return [Integer] Devuelve el numero de plazas libres
    #
    def plazas_libres
      @plazas_libres
    end

    #
    # Metodo que permite añadir una plaza al conjunto de plazas
    #
    # @param [Aparcamiento::Plaza] plaza Recibe un objeto de tipo Aparcamiento::Plaza
    #
    # @return [Aparcamiento::Datos] Devuelve un objeto de tipo Aparcamiento::Datos
    #
    def añadir_plaza(plaza)
      if plaza.instance_of? Plaza
        @conjunto_plazas.push(plaza)
        @plazas_libres += 1
        @plazas_ocupadas -= 1
      else
        raise TypeError, "La plaza debe ser un objeto de tipo Aparcamiento::Plaza"
      end
    end

    #
    # Metodo to_s
    #
    # @return [String] Devuelve un string con los datos del aparcamiento
    #
    def to_s
      ("Nombre aparcamiento: #{@nombre}\nIdentificacion: #{@identificacion}\nAccesibilidad: #{@accesibilidad}\nSeguridad: #{@seguridad}\nPlazas disponibles: #{@plazas_libres}\nPlazas ocupadas: #{@plazas_ocupadas}\nTipo de aparcamiento: #{@tipo_aparcamiento}")
    end

    #
    # Metodo each
    #
    #
    #
    def each
      @conjunto_vehiculo.each { |i| yield i }
    end

    #
    # Sobrecarga del operador [] para obtener la posicion
    #
    # @param [Integer] i
    #
    # @return [Vehiculo]
    #
    def [](i)
      @conjunto_vehiculo[i]
    end

    #
    # Método para aparcar vehiculos
    #
    # @param [Vehiculo] vehiculo
    #
    #
    def aparcar_vehiculo(vehiculo)
      if vehiculo.instance_of? Vehiculo
        @conjunto_vehiculo.push(vehiculo)
      else
        raise TypeError, "El vehiculo debe ser un objeto de tipo Aparcamiento::Vehiculo"
      end
    end

    #
    # Tiempo de estancia en el aparcamiento
    #
    # @param [Time] hora_entra
    # @param [Time] hora_sale
    #
    # @return [Float]
    #
    def tiempo_estancia(hora_entra, hora_sale)
      if (hora_entra.instance_of? Time) && (hora_sale.instance_of? Time)
        (hora_sale - hora_entra) / 60
      else
        raise TypeError, "Las horas deben ser objetos de tipo Time"
      end
    end

    #
    # Precio de la estancia en el aparcamiento por minutos
    #
    # @param [Time] hora_entra
    # @param [Time] hora_sale
    #
    # @return [Float]
    #
    def precio_estancia(hora_entra, hora_sale)
      if (hora_entra.instance_of? Time) && (hora_sale.instance_of? Time)
        tiempo_estancia(hora_entra, hora_sale) * @precio_minuto
      else
        raise TypeError, "Las horas deben ser objetos de tipo Time"
      end
    end


    #
    # Indice de sostenibilidad
    #
    # @return [Integer] Valor
    #
    def indice_sostenibilidad
      if (@distancia_centro_cuidad <= 20 && precio_minuto > 0.50)
        return 1
      elsif (@distancia_centro_cuidad > 20 && @distancia_centro_cuidad < 40) && (@precio_minuto <= 0.50 && @precio_minuto >= 0.10)
        return 2
      elsif (@distancia_centro_cuidad >= 40 && @precio_minuto < 0.10)
        return 3
      else
        return nil
      end
    end


    #
    # Metodo comparable segun el indice sostenibilidad
    #
    # @param [Datos] other Objeto de la misma clase
    #
    # @return [Datos]
    #
    def <=>(other)
      indice_sostenibilidad <=> other.indice_sostenibilidad
    end
  end
end
