module EntradasHelper
    def format_date(date)
       date.to_formatted_s(:rfc822)
    end
    
    def valor_formatado(valor)
        
    'R$ ' + valor.to_s
    end
end
