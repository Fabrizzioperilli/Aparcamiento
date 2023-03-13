#
# Modulo que contiene los datos del programa
#
module Aparcamiento
  #
  # Modulo que contiene las funcionalidades del programa
  #
  module Funcionalidades
    # @return [Symbol] Devuelve la constante COMPLETO
    COMPLETO = :completo
    # @return [Symbol] Devuelve la constante LIBRE
    LIBRE = :Libre

    #
    # Funcion que devuelve el estado del aparcamiento
    #
    # @param [Aparcamiento::Plaza] .estadodatos Recibe un objeto de tipo Aparcamiento::Datos
    #
    # @return [Symbol] Devuelve un simbolo que representa el estado del aparcamiento
    #
    def Funcionalidades.estado(datos)
      if datos.instance_of? Aparcamiento::Datos
        if datos.plazas_libres == 0
          return COMPLETO
        else
          return LIBRE
        end
      else
        return nil
      end
    end

    #
    # Funcion porcetanje de reserva
    #
    # @param [Datos] .porcentaje_reverva_plazas_minusvalidosdatos
    # @param [Float] porcentaje
    #
    # @return [Bool]
    #
    def Funcionalidades.porcentaje_reverva_plazas_minusvalidos(datos, porcentaje)
      if datos.instance_of? Aparcamiento::Datos and porcentaje >= 0 and porcentaje <= 100
        valor = datos.count / 40
        if valor >= porcentaje
          return true
        else
          return false
        end
      else
        return nil
      end
    end

    #
    # Numero de plazas libres de minusvalidos
    #
    # @param [Datos] .n_plazas_minusvalidos_libredatos
    #
    # @return [Integer]
    #
    def Funcionalidades.n_plazas_minusvalidos_libre(datos)
      if datos.instance_of? Aparcamiento::Datos
        return datos.n_plazas_minusvalidos_libre
      else
        return nil
      end
    end

    #
    # Numero de vehiculos estacionados
    #
    # @param [Datos] .n_vehiculos_estacionadosdatos
    #
    # @return [Integer]
    #
    def Funcionalidades.n_vehiculos_estacionados(datos)
      if datos.instance_of? Aparcamiento::Datos
        datos.conjunto_vehiculo.size
      else
        return nil
      end
    end

    #
    # Porcentaje de ocupacion
    #
    # @param [Datos] .porcentaje_plazas_ocupadasdatos
    #
    # @return [Float] Porcentaje
    #
    def Funcionalidades.porcentaje_plazas_ocupadas(datos)
      if datos.instance_of? Aparcamiento::Datos
        (datos.plazas_libres * 100) / datos.numero_plazas
      else
        return nil
      end
    end

    #
    # Porcentaje de plazas libres minusvalidos
    #
    # @param [Datos] .porcentaje_plazas_libres_minusvalidosdatos
    #
    # @return [Float] Porcentaje
    #
    def Funcionalidades.porcentaje_plazas_libres_minusvalidos(datos)
      if datos.instance_of? Aparcamiento::Datos
        if datos.n_plazas_minusvalidos_libre != 0
          n_plazas_minusvalidos_libre(datos) * 100 / datos.n_plazas_minusvalidos_libre
        else
          return 0
        end
      else
        return nil
      end
    end
  end
end
